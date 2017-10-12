#   Morgue

This application helps managing your postmortems. It has a pluggable feature system and can pull in related information from IRC and JIRA as well as storing relevant links and graphs.

Morgue consists of two containers: one mariadb database and the application (Apache + PHP 5).

The Morgue container is built from scratch starting from Alpine Linux and Morgue source code (https://github.com/etsy/morgue). 

![homepage](morgue_home.png)

![event](morgue_event.png)

## Configuration

Environment Variable | Default | Use
-------------------- | ------- | ---
MORGUE_ENVIRONMENT | development |
TZ | Europe/Zurich |
MORGUE_DB_HOST | localhost |
MORGUE_DB_PORT | 3306 |
MORGUE_DB_DATABASE | morgue |
MORGUE_DB_USER | morgue |
MORGUE_DB_PASSWORD | morgue_password |
MORGUE_ANNIVERSARY_ENABLED | on |
MORGUE_ANNIVERSARY_NAVBAR_ENABLED | on |
MORGUE_STATUS_TIME_ENABLED | on |
MORGUE_CONTACT_ENABLED | on |
MORGUE_CALENDAR_ENABLED | on |
MORGUE_CALENDAR_NAVBAR_ENABLED | on |
MORGUE_SUMMARY_ENABLED | on |
MORGUE_IMAGES_ENABLED | on |
MORGUE_IRC_ENABLED | on |
MORGUE_JIRA_ENABLED | on |
MORGUE_LINKS_ENABLED | on |
MORGUE_TAGS_ENABLED | on |
MORGUE_HISTORY_ENABLED | on |
MORGUE_REPORT_ENABLED | on |
MORGUE_REPORT_NAVBAR_ENABLED | on |
MORGUE_UPLOAD_ENABLED | on |
MORGUE_UPLOAD_ENABLED | on |
MORGUE_WHY_SURPRISED_ENABLED | on |
MORGUE_UPLOAD_DIR | /tmp/morgue |

## Requirements
- docker
- docker-compose

## How to run it
First change the configurations in `example.json` file, then start morgue executing:
```
$  docker-compose up -d
```

Once done, login to morgue using the credentials `morgue:P0stm0rt3ms!`

* Default url: <http://morgue.yourdomain.com/>
