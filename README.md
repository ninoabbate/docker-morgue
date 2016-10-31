#   Morgue

This application helps managing your postmortems. It has a pluggable feature system and can pull in related information from IRC and JIRA as well as storing relevant links and graphs.

Morgue consists of two containers: one mariadb database and the application (Apache + PHP 5).

The Morgue container is built from scratch starting from Alpine and Morgue source code (https://github.com/etsy/morgue). 

## Requirements
- docker
- docker-compose

## How to run it
```
$  docker-compose up -d
```

Once done, login to morgue using the credentials `morgue:P0stm0rt3ms!`

* Default WebUI: <http://morgue.yourdomain.com/>
