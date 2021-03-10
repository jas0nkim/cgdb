# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html

from scrapy.exceptions import DropItem
from cgdb_bot.items import WikipediaGameItem

class WikipediaGamePipeline:
    def process_item(self, item, spider):
        if isinstance(item, WikipediaGameItem):
            if not item.english_title:
                raise DropItem("Missing English title")
            missing_components = []
            if not item.language:
                missing_components.append('language')
            if not item.title_lc:
                missing_components.append('title_lc')
            if not item.description_lc:
                missing_components.append('description_lc')
            if not item.pictures:
                missing_components.append('pictures')
            if not item.developers:
                missing_components.append('developers')
            if not item.publishers:
                missing_components.append('publishers')
            if not item.series:
                missing_components.append('series')
            if not item.genres:
                missing_components.append('genres')
            if not item.modes:
                missing_components.append('modes')
            if not item.link:
                missing_components.append('link')
            if not item.inter_languages:
                missing_components.append('inter_languages')
            if len(missing_components) > 4:
                raise DropItem(f"""Too many missing components: {', '.join(missing_components)}""")
            # set platform
            item.platform = spider._platform
        return item

# class WriteScrapedItemsPipeline:
#     def open_spider(self, spider):
#         self.file = open('scraped_items.json', 'a')
#         self.file.write("[\n")

#     def close_spider(self, spider):
#         self.file.write("]")
#         self.file.close()

#     def process_item(self, item, spider):
#         data = item.asjson() + ",\n"
#         self.file.write(data)
#         return item