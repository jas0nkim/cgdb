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

## Run tests
```
$ docker-compose exec backend python manage.py test
```

## References / Game list

- [Xbox Game Pass cloud gaming - Windows Central](https://www.windowscentral.com/xbox-project-xcloud-games-list)
- [GeForce Now - Nvidia](https://www.nvidia.com/en-us/geforce-now/games/)
- [Google Stadia - Wikipedia](https://en.wikipedia.org/wiki/List_of_Stadia_games)
- [PlayStation Now - Playstation](https://www.playstation.com/en-ca/ps-now/ps-now-games/#all-ps-now-games)