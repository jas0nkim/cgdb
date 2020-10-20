FROM node:14

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN npm i -g serve
RUN npm ci
RUN npm run build