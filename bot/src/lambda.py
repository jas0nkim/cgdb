from cgdb_bot import tasks

def handler(event, context):
    return tasks.crawl(event.get('platform'), event.get('source'), event.get('file'))
