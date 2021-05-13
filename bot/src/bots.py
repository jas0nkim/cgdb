from celery import Celery
from cgdb_bot import tasks
from cgdb_bot.settings import (RABBITMQ_HOST, RABBITMQ_PORT, RABBITMQ_USER,
                            RABBITMQ_PASS)

app = Celery('bots',
            broker=f'amqp://{RABBITMQ_USER}:{RABBITMQ_PASS}@{RABBITMQ_HOST}:{RABBITMQ_PORT}',
            backend='rpc://')

@app.task
def crawl(platform, source, file=None):
    status, _ = tasks.crawl(platform, source, file)
    return status
