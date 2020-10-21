# Cloud Game Database

Provides easily searchable game titles by cloud gaming platforms, such as microsoft xcloud, nvidia geforce now, google stadia, and so on. Inspired by [tvdb](http://thetvdb.com).

- Search / display information oriented site
- Search by game / platform / country
- Multi-language support

## Installation

1. Run containers
```
$ docker-compose up -d
```

2. Initialize django database and create a superuser
```
$ docker-compose exec backend python manage.py migrate
$ docker-compose exec backend python manage.py createsuperuser
```
