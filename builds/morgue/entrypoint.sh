#!/usr/bin/env bash
set -efuo pipefail

cat <<END > /var/www/morgue/config/example.json
{
    "environment": "${MORGUE_ENVIRONMENT:-development}",
    "timezone": "${TZ:-Europe/Zurich}",

    "database":
    {  "mysqlhost": "${MORGE_DB_HOST:-localhost}",
        "mysqlport": ${MORGE_DB_PORT:-3306},
        "database": "${MORGE_DB_DATABASE:-morgue}",
        "username": "${MORGE_DB_USER:-morgue}",
        "password": "${MORGE_DB_PASSWORD:-morgue_password}"
    },


    "severity" :
    { "tooltip_title" : "Severity Levels",
      "levels" : [
            "Complete outage or degradation so severe that core functionality is unusable",
            "Functional degradation for a subset of members or loss of some core functionality for all members",
            "Noticeable degradation or loss of minor functionality",
            "No member-visible impact; loss of redundancy or capacity",
            "Anything worth mentioning not in the above levels"
        ]
    },

    "locking" :
    { "editable_days": 30,
      "lock_time": 120
    },

    "edit_page_features" : [
      "status_time",
      "contact",
      "calendar",
      "summary",
      "why_surprised",
      "images",
      "irc",
      "jira",
      "links",
      "tags",
      "history",
      "upload"
    ],
    "feature": [
    {   "name": "anniversary",
        "enabled": "${MORGUE_ANNIVERSARY_ENABLED:-on}",
        "navbar": "${MORGUE_ANNIVERSARY_NAVBAR_ENABLED:-on}",
        "mailto": "me@example.com",
        "mailfrom": "morgue@example.com",
        "custom_js_assets": ["anniversary.js"]
    },

    {   "name": "status_time",
        "enabled": "${MORGUE_STATUS_TIME_ENABLED:-on}"
    },

    {   "name": "contact",
        "enabled": "${MORGUE_CONTACT_ENABLED:-on}",
        "lookup_url": "https://directory.example.com/user/%s",
        "email_domain": "example.com"
    },

    {   "name": "calendar",
        "enabled": "${MORGUE_CALENDAR_ENABLED:-on}",
        "navbar" : "${MORGUE_CALENDAR_NAVBAR_ENABLED:-on}",
        "custom_css_assets" : ["calendar.css"],
        "custom_js_assets" : ["calendar.js", "https://apis.google.com/js/client.js?onload=loadCal"],
        "clientId" : "CLIENTID",
        "apiKey" : "APIKEY",
        "scopes" : ["https://www.googleapis.com/auth/calendar"],
        "id" : "CALENDARID",
        "facilitator": true,
        "facilitators_email": ["facilitators@example.com"],
        "attendees_email": ["attendees@example.com"]
    },

    {   "name": "summary",
        "enabled": "${MORGUE_SUMMARY_ENABLED:-on}",
        "custom_js_assets": ["summary.js"]
    },

    {   "name": "images",
        "enabled": "${MORGUE_IMAGES_ENABLED:-on}"
    },

    {   "name": "irc",
        "enabled": "${MORGUE_IRC_ENABLED:-on}",
        "channels": ["#ops"]
    },

    {   "name": "jira",
        "enabled": "${MORGUE_JIRA_ENABLED:-on}",
        "baseurl": "https://jira.foo.com",
        "username": "jira_morgue",
        "password": "jira_morgue_password",
        "proxy": "http://myproxy:8080",
        "additional_fields" : {
        }
    },

    {   "name": "links",
        "enabled": "${MORGUE_LINKS_ENABLED:-on}"
    },

    {   "name": "tags",
        "enabled": "${MORGUE_TAGS_ENABLED:-on}"
    },

    {   "name": "history",
        "enabled": "${MORGUE_HISTORY_ENABLED:-on}"
    },

    {   "name": "report",
        "enabled": "${MORGUE_REPORT_ENABLED:-on}",
        "navbar": "${MORGUE_REPORT_NAVBAR_ENABLED:-on}"
    },

    { "name": "search",
      "enabled" : "${MORGUE_UPLOAD_ENABLED:-on}"
    },

    {   "name": "upload",
        "enabled": "${MORGUE_UPLOAD_ENABLED:-on}",
        "custom_js_assets": ["dropzone.min.js", "upload.js"],
        "custom_css_assets": ["dropzone.min.css"],
        "upload_driver_options": {
            "url": "http://my.server.home/",
            "username": "webdav",
            "password": "webdav",
            "proxy": false
        },
        "upload_driver": "webdav"
    },

    {   "name": "why_surprised",
        "enabled": "${MORGUE_WHY_SURPRISED_ENABLED:-on}",
        "custom_js_assets": ["why_surprised.js"]
    }
    ],
    "upload_dir": "${MORGUE_UPLOAD_DIR:-/tmp/morgue}"
}
END

exec "${@}"
