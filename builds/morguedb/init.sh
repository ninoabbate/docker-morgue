#!/bin/sh

# Wait 10 seconds because the mysql server doesn't accept connections at early startup
sleep 10

# Init morgue database
mysqladmin create morgue \
  && mysql < /install.sql \
  && mysql morgue < /schemas/postmortems.sql \
  && mysql morgue < /schemas/images.sql \
  && mysql morgue < /schemas/jira.sql \
  && mysql morgue < /schemas/irc.sql \
  && mysql morgue < /schemas/anniversary.sql \
  && mysql morgue < /schemas/links.sql 
