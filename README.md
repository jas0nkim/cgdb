# Cloud Game Database

Provides easily searchable game titles by cloud gaming platforms, such as Google Stadia, Microsoft Xbox Game Pass, Nvidia Geforce Now, and so on. Multi-language support. Inspired by [tvdb](http://thetvdb.com).

- Search / display information oriented site
- Search by game / platform / country
- Multi-language support

## Live Demo
[Live demo](http://54.146.80.135/platform/stadia/games)

## Installation
1. Create environment/config files
```
# environment files
$ mkdir .env
$ touch .env/backend.env
$ touch .env/bot.env
$ touch .env/postgres.env
$ touch .env/rabbit.env
# aws config files
$ mkdir backend/.aws
$ touch backend/.aws/credentials
$ touch backend/.aws/config
# frontend local
$ touch frontend/.env.local
```
copy and paste following lines into `.env/backend.env` file
```
DJANGO_SECRET_KEY='YOUR-DJANGO-SECRET-KEY'
DEBUG=True or False
ALLOWED_HOSTS=HOST_ADDRESS_1||HOST_ADDRESS_2||...
CORS_ALLOWED_ORIGINS=ORIGIN_ADDRESS_1||ORIGIN_ADDRESS_2||...
DATABASE_NAME=YOUR-DB-NAME
DATABASE_USER=YOUR-DB-USER
DATABASE_PASS=YOUR-DB-PASSWORD
DATABASE_HOST=postgres
DATABASE_PORT=5432
S3_IMAGES_BUCKET=YOUR-S3-BUCKET-NAME
RABBITMQ_USER=YOUR-RABBITMQ-USER-NAME
RABBITMQ_PASS=YOUR-RABBITMQ-PASSWORD
```
copy and paste following lines into `.env/bot.env` file
```
AUTH_TOKEN=YOUR-AUTH-TOKEN
API_SERVER_HOST=YOUR-BACKEND-SERVER i.g. http://backend:8000
RABBITMQ_USER=YOUR-RABBITMQ-USER-NAME
RABBITMQ_PASS=YOUR-RABBITMQ-PASSWORD
```
copy and paste following lines into `.env/postgres.env` file
```
POSTGRES_USER=YOUR-DB-USER
POSTGRES_PASSWORD=YOUR-DB-PASSWORD
POSTGRES_DB=YOUR-DB-NAME
PGDATA=/data/postgres
```
copy and paste following lines into `.env/rabbit.env` file
```
RABBITMQ_DEFAULT_USER=YOUR-RABBITMQ-USER-NAME
RABBITMQ_DEFAULT_PASS=YOUR-RABBITMQ-PASSWORD
```
copy and paste following lines into `backend/.aws/credentials` file
```
[default]
aws_access_key_id = YOUR_ACCESS_KEY
aws_secret_access_key = YOUR_SECRET_KEY
```
copy and paste following lines into `backend/.aws/config` file
```
[default]
region=us-east-1
```
copy and paste following lines into `frontend/.env.production` and `frontend/.env.local` files
```
NODE_ENV=production or local
NEXT_PUBLIC_SITE_NAME=YOUR-WEBSITE-NAME
NEXT_PUBLIC_SITE_HOST=YOUR-WEBSITE-HOST
NEXT_PUBLIC_API_SERVER_URL=YOUR-API-SERVER-URL
NEXT_PUBLIC_MAX_SUGGESTIONS=5
NEXT_PUBLIC_PLACEHOLDER_IMG=https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6zm2HEMg-i1OfKqgFRy4bV3joE5jzFTv8aA&usqp=CAU
GA_TRACKING_ID=YOUR-GOOGLE-ANALYTICS-TRACKING-ID
```
2. Build containers
```
$ docker-compose build

# (optional) initialize postgres database
$ docker-compose run --rm postgres
# ctrl+c to kill the postgres container
```
3. Run containers
```
$ docker-compose up -d
```
4. Collect Django static files
```
$ docker-compose exec backend python manage.py collectstatic
```
5. Create a superuser
```
$ docker-compose exec backend python manage.py createsuperuser
```
6. Generate auth tokens (i.e. from admin site)
7. Restore platforms data
```
$ docker-compose exec postgres bash
# cd /etc
# psql -U cgdb cgdb < .sql/cgdb-platforms-backup-xxxx.sql
```

## Backup/restore data
- Backup
```
$ docker-compose exec postgres pg_dump -h postgres -U cgdb cgdb > .sql/cgdb-backup-xxxx.sql
# Enter db password after
```
- Restore
```
$ docker-compose exec postgres bash
# cd /etc
# psql -U cgdb cgdb < .sql/cgdb-backup-xxxx.sql
```
- Django migration
```
$ docker-compose exec backend python manage.py makemigrations
$ docker-compose exec backend python manage.py migrate
```

## Access postgres db
```
$ docker-compose exec postgres psql -h postgres -U cgdb cgdb
```

## Run crawlers with AWS Lambda
- Build docker image
```
$ cd bot
$ docker build --file Dockerfile.lambda -t lambda/scraper:1.0 .
```
- Run docker image in local
```
$ docker run -p 9000:8080 --env-file ../.env/bot.env lambda/scraper:1.0
```
- Test the container in local
```
$ curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{"queryStringParameters":{"platform":"TEST_PLATFORM","source":"TEST_SOURCE"}}'
```
- Upload docker image to the AWS ECR repository
```
# Authenticate the Docker CLI to your Amazon ECR registry
$ aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 094000180617.dkr.ecr.us-east-1.amazonaws.com

# Create a repository in Amazon ECR using the create-repository command
$ aws ecr create-repository --repository-name lambda/scraper --image-scanning-configuration scanOnPush=true --image-tag-mutability MUTABLE

# Tag your image to match your repository name using the docker tag command
$ docker tag lambda/scraper:1.0 094000180617.dkr.ecr.us-east-1.amazonaws.com/lambda/scraper:1.0

# Deploy the image to Amazon ECR using the docker push command
$ docker push 094000180617.dkr.ecr.us-east-1.amazonaws.com/lambda/scraper:1.0
```

## Run crawlers with REST API
- Stadia games
```
http://YOUR-BACKEND-SERVER/api/producer/crawl/Stadia/Reddit
# set active all Stadia games before run Stadia Steam

# crawl from Steam
http://YOUR-BACKEND-SERVER/api/producer/crawl/Stadia/Steam
# crawl from Metacritic
http://YOUR-BACKEND-SERVER/api/producer/crawl/Stadia/Metacritic
# crawl from Wikipedia
http://YOUR-BACKEND-SERVER/api/producer/crawl/Stadia/Wikipedia

or

# crawl from Steam, Metacritic, and Wikipedia at once.
http://YOUR-BACKEND-SERVER/api/producer/crawl/Stadia/SMW
```
- Wikipedia
```
$ docker-compose run --rm bot scrapy crawl WikipediaGameSpider -a titles="Absolver||...||..." -a urls="...||..." -a platform="Xbox Game Pass"
```

## Bulk Game status updates
- Stadia games
```
$ docker-compose exec postgres psql -h postgres -U cgdb cgdb
...
cgdb=# select count(*) from games where links->'stadia' IS NOT NULL and active = false;
cgdb=# update games set active = true where links->'stadia' IS NOT NULL and active = false;
```

## Run tests
- backend
```
$ docker-compose exec backend python manage.py test
```
- worker
```
$ docker-compose exec worker python -m unittest
```

## References / Game list
- [Steam](https://store.steampowered.com/)
- [Metacritic](https://www.metacritic.com/)
- [Stadia - Reddit](https://www.reddit.com/r/Stadia/wiki/index)
- [Stadia - Wikipedia](https://en.wikipedia.org/wiki/List_of_Stadia_games)
- [Xbox Game Pass - Xbox](https://www.xbox.com/en-US/xbox-game-pass/games)
- [Xbox Game Pass - Xbox News](https://news.xbox.com/en-us/)
- [Xbox Game Pass - Windows Central](https://www.windowscentral.com/xbox-project-xcloud-games-list)
- [Luna - Android authority](https://www.androidauthority.com/amazon-luna-1170676/)
- [GeForce Now - Reddit 1](http://gfngames.tk/)
- [GeForce Now - Reddit 2](https://geforcenow-games.com/)
- [GeForce Now - Nvidia](https://www.nvidia.com/en-us/geforce-now/games/)
- [PlayStation Now - Playstation](https://www.playstation.com/en-ca/ps-now/ps-now-games/#all-ps-now-games)