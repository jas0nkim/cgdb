FROM node:lts
EXPOSE 3000
RUN mkdir frontend
COPY . frontend
WORKDIR frontend
RUN npx browserslist@latest --update-db
RUN npm ci
RUN npm run build