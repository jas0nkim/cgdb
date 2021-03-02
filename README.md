# Cloud Game Database

Provides easily searchable game titles by cloud gaming platforms, such as microsoft xcloud, nvidia geforce now, google stadia, and so on. Multi-language support. Inspired by [tvdb](http://thetvdb.com).

- Search / display information oriented site
- Search by game / platform / country
- Multi-language support

## Installation

0. create environment files
```
$ mkdir .env
$ touch .env/backend.env
$ touch .env/postgres.env
```
copy and paste following lines into backend.env file
```
DJANGO_SETTINGS_MODULE=cgdb.settings
PYTHONUNBUFFERED=1
DJANGO_SECRET_KEY='YOUR-DJANGO-SECRET-KEY'
DEBUG=True or False
ALLOWED_HOSTS=HOST_ADDRESS_1||HOST_ADDRESS_2||...
CORS_ALLOWED_ORIGINS=ORIGIN_ADDRESS_1||ORIGIN_ADDRESS_2||...
DATABASE_NAME=YOUR-DB-NAME
DATABASE_USER=YOUR-DB-USER
DATABASE_PASS=YOUR-DB-PASSWORD
DATABASE_HOST=postgres
DATABASE_PORT=5432
```
copy and paste following lines into postgres.env file
```
POSTGRES_USER=YOUR-DB-USER
POSTGRES_PASSWORD=YOUR-DB-PASSWORD
POSTGRES_DB=YOUR-DB-NAME
PGDATA=/data/postgres
```

1. Run containers
- backend
```
$ docker-compose up -d
```
- frontend (after backend container running)
```
$ docker-compose -f docker-compose-frontend.yml up -d
```

2. Initialize django database and create a superuser
```
$ docker-compose exec backend python manage.py makemigrations
$ docker-compose exec backend python manage.py migrate
$ docker-compose exec backend python manage.py createsuperuser
```

## Backup/restore data
- Backup
```
$ docker-compose exec postgres pg_dump -h postgres -U cgdb cgdb > .sql/cgdb-backup-xxxx.sql
```
Enter password after

- Restore
```
$ docker-compose exec postgres sh
# cd /etc
# psql -U cgdb cgdb < .sql/cgdb-backup-xxxx.sql
```

## Access postgres db
```
$ docker-compose exec postgres psql -h postgres -U cgdb cgdb
```

## Run crawlers
- Reddit (Stadia)
```
$ cd bot/src
$ python run.py -p Stadia
```
- Wikipedia
```
$ cd bot/src
$ scrapy crawl WikipediaGameSpider -a titles="Absolver||...||..." -a urls="...||..." -a platform="xCloud"
```

## Run tests
- backend
```
$ docker-compose exec backend python manage.py test
```
- bot
```
$ cd bot/src
$ python -m unittest
```

## References / Game list
- [Stadia - Reddit](https://www.reddit.com/r/Stadia/wiki/index)
- [Stadia - Wikipedia](https://en.wikipedia.org/wiki/List_of_Stadia_games)
- [xCloud - Windows Central](https://www.windowscentral.com/xbox-project-xcloud-games-list)
- [Luna - Android authority](https://www.androidauthority.com/amazon-luna-1170676/)
- [GeForce Now - Reddit 1](http://gfngames.tk/)
- [GeForce Now - Reddit 2](https://geforcenow-games.com/)
- [GeForce Now - Nvidia](https://www.nvidia.com/en-us/geforce-now/games/)
- [PlayStation Now - Playstation](https://www.playstation.com/en-ca/ps-now/ps-now-games/#all-ps-now-games)