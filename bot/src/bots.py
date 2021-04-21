import os
from celery import Celery
from cgdb_bot import tasks

app = Celery('bots',
            broker=f'amqp://{os.getenv("RABBITMQ_USER")}:{os.getenv("RABBITMQ_PASS")}@{os.getenv("RABBITMQ_HOST")}:{os.getenv("RABBITMQ_PORT")}',
            backend='rpc://')

@app.task
def crawl(platform, source, file=None):
    return tasks.crawl(platform, source, file)
