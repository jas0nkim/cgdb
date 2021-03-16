# Cloud Game Database

Provides easily searchable game titles by cloud gaming platforms, such as Google Stadia, Microsoft Xbox Game Pass, Nvidia Geforce Now, and so on. Multi-language support. Inspired by [tvdb](http://thetvdb.com).

- Search / display information oriented site
- Search by game / platform / country
- Multi-language support

## Installation
1. Create environment files
```
$ mkdir .env
$ touch .env/backend.env
$ touch .env/bot.env
$ touch .env/postgres.env
```
copy and paste following lines into `backend.env` file
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
```
copy and paste following lines into `bot.env` file
```
AUTH_TOKEN=YOUR-AUTH-TOKEN
API_SERVER_HOST=YOUR-BACKEND-SERVER i.g. http://172.30.64.239:8765
```
copy and paste following lines into `postgres.env` file
```
POSTGRES_USER=YOUR-DB-USER
POSTGRES_PASSWORD=YOUR-DB-PASSWORD
POSTGRES_DB=YOUR-DB-NAME
PGDATA=/data/postgres
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

## Run crawlers
- Stadia games
```
$ docker-compose run --rm bot python run.py -p Stadia -s Reddit
# set active all Stadia games before run Stadia Steam
$ docker-compose run --rm bot python run.py -p Stadia -s Steam
$ docker-compose run --rm bot python run.py -p Stadia -s Wikipedia
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
cgdb=# select count(*) from games where links->'stadia' IS NOT NULL;
cgdb=# update games set active = true where links->'stadia' IS NOT NULL;
```

## Run tests
- backend
```
$ docker-compose exec backend python manage.py test
```
- bot
```
$ docker-compose run --rm bot python -m unittest
```

## References / Game list
- [Steam](https://store.steampowered.com/)
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