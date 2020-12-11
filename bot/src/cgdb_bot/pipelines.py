# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html

from scrapy.exceptions import DropItem

class WikipediaGamePipeline:
    def process_item(self, item, spider):
        if not item.title:
            raise DropItem("Missing title")
        missing_components = []
        if not item.description:
            missing_components.append('description')
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
        if len(missing_components) > 4:
            raise DropItem(f"""Too many missing components: 
                            {', '.join(missing_components)}""")
        return item

class JsonWriterPipeline:
    def open_spider(self, spider):
        self.file = open('items.json', 'w')

    def close_spider(self, spider):
        self.file.close()

    def process_item(self, item, spider):
        data = item.asjson() + "\n"
        self.file.write(data)
        return item