FROM python:3.8

ENV SCRAPY_SETTINGS_MODULE=cgdb_bot.settings

COPY ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

RUN mkdir /app
COPY ./src /app
WORKDIR /app