import re
import logging
from cgdb_bot.items import WikipediaGameItem
from cgdb_bot.exceptions import NoHtmlElementFound
from cgdb_bot.settings import (WIKIPEDIA_LOCAL_TITLE_SPLIT_CHAR as SPLIT_CHAR,
                        WIKIPEDIA_NOT_SUPPORTED_LANGUAGE_CODES as NOT_SUPPORTED_ISOS)

class WikipediaParser:
    """
    Wikipedia page parser
    """
    def __init__(self):
        self.logger = logging.getLogger(__name__)

    def parse_game_article(self, response, english_title=None):
        """
        parse game article page
        """
        if response.status != 200:
            # broken link or inactive
            self.logger.error("Link not working: HTTP status code - %s", response.status)
            yield WikipediaGameItem(english_title=english_title,
                                    link=response.url)

        """
        TODO: if this page is an 'English' Wikipedia site, get links of other languages, and request those links
        """

        yield self._parse_game_article_en_template(response, english_title)

    def _parse_game_article_en_template(self, response, english_title=None):
        return WikipediaGameItem(
                    english_title=self._get_english_title(response, english_title),
                    language=self._extract_language(response),
                    title_lc=self._extract_title(response),
                    description_lc=self._extract_description(response),
                    pictures=self._extract_pictures(response),
                    developers=self._extract_developers(response),
                    publishers=self._extract_publishers(response),
                    series=self._extract_series(response),
                    genres=self._extract_genres(response),
                    modes=self._extract_modes(response),
                    link=response.url,
                    inter_languages = self._extract_inter_languages(response),
                )

    def _extract_inter_languages(self, response):
        ret = []
        languages = response.xpath('//a[@class="interlanguage-link-target"]')
        for lang_link in languages:
            title_lc = lang_link.xpath('./@title').get().split(SPLIT_CHAR)
            lang = title_lc.pop()
            title_lc = SPLIT_CHAR.join(title_lc)
            if lang_link.xpath('./@lang').get() in NOT_SUPPORTED_ISOS:
                continue
            ret.append({
                'iso': lang_link.xpath('./@lang').get(),
                'url': lang_link.xpath('./@href').get(),
                'lang': lang.strip(),
                'lang_lc': lang_link.xpath('./text()').get(),
                'title_lc': title_lc.strip(),
            })
        return ret

    def _get_english_title(self, response, english_title=None):
        if not english_title or self._extract_language(response) == 'en':
            return self._extract_title(response)
        return english_title

    def _extract_title(self, response):
        title = response.css('#firstHeading > i::text').get()
        try:
            if title is None:
                raise NoHtmlElementFound("No title found")
            return title
        except NoHtmlElementFound as err:
            self.logger.warning("%s - %s", str(err), response.url)
            return None

    def _extract_language(self, response):
        language = response.xpath('/html/@lang').get()
        try:
            if language is None:
                raise NoHtmlElementFound("No language found")
            return language
        except NoHtmlElementFound as err:
            self.logger.warning("%s - %s", str(err), response.url)
            return None

    def _extract_description(self, response):
        # get all texts inside the first <p> in <div class="mw-parser-output">,
        # but exclude class="mw-empty-elt"
        description_pieces = response.xpath("""//div[@id="mw-content-text"]
                                        /div[@class="mw-parser-output"]
                                        /p[not(contains(@class, "mw-empty-elt"))][1]
                                        //text()""").getall()
        try:
            if len(description_pieces) < 1:
                raise NoHtmlElementFound("No description found")
            # remove wikipedia's reference numbers (i.e [3])
            return re.sub(r'\[(.*?)\]', '', ''.join(description_pieces).strip())
        except NoHtmlElementFound as err:
            self.logger.warning("%s - %s", str(err), response.url)
            return None

    def _extract_pictures(self, response):
        pictures = []
        image_link = response.xpath('//meta[@property="og:image"]/@content').get()
        try:
            if image_link is None:
                raise NoHtmlElementFound("No pictures found")
            pictures.append(image_link)
            return pictures
        except NoHtmlElementFound as err:
            self.logger.warning("%s - %s", str(err), response.url)
            return pictures

    def _extract_developers(self, response):
        return self._extract_from_info_table(response, lookup='Developer(s)')

    def _extract_publishers(self, response):
        return self._extract_from_info_table(response, lookup='Publisher(s)')

    def _extract_series(self, response):
        return self._extract_from_info_table(response, lookup='Series',
                                            loglevel='warning')

    def _extract_genres(self, response):
        return self._extract_from_info_table(response, lookup='Genre(s)',
                                            lowercase=True)

    def _extract_modes(self, response):
        return self._extract_from_info_table(response, lookup='Mode(s)',
                                            loglevel='warning',
                                            lowercase=True)

    def _extract_from_info_table(self, response, lookup=None,
                                            loglevel='warning',
                                            lowercase=False):
        td = response.xpath(f"""//table[@class="infobox hproduct"]/tbody
                            /tr[th//text()[contains(., "{lookup}")]]/td""")
        if len(td.xpath('./*[contains(@class, "NavFrame")]')) > 0:
            td = td.xpath('./*[not(contains(@class, "NavFrame"))]')
        if len(td.xpath('.//li')) > 0:
            ret = []
            for li in td.xpath('.//li'):
                # for filtering publishers on https://en.wikipedia.org/wiki/Black_Desert_Online
                ret = ret + li.xpath('./text()').getall()
                ret = ret + li.xpath("""
                                *[not(self::span[@style="font-size:95%;"])]
                                //text()""").getall()
            # get any items outside list(ul/li). ref: https://en.wikipedia.org/wiki/Wonder_Boy_(video_game)
            ret = ret + td.xpath('./*[not(ul)]//text()').getall()
        else:
            # for filtering publishers on https://en.wikipedia.org/wiki/Black_Desert_Online
            ret = td.xpath('./text()').getall() + td.xpath("""
                                *[not(self::span[@style="font-size:95%;"])]
                                //text()""").getall()
        
        def __filter_ret(_ret):
            """
            remove ',' , empty string, (...), [...] items from the return list
            """
            r = []
            for x in _ret:
                x = x.replace(',','').strip()
                # remove empty, (...), [...]
                if not x or re.match(r'\((.*?)\)|\[(.*?)\]', x):
                    continue
                if lowercase:
                    x = x.lower()
                r.append(x)
            return r

        try:
            if len(ret) < 1:
                raise NoHtmlElementFound(f"No {lookup} found")
            ret = __filter_ret(ret)
            return ret
        except NoHtmlElementFound as err:
            getattr(self.logger, loglevel)("%s - %s", str(err), response.url)
            return ret
