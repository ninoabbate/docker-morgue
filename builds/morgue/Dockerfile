FROM alpine:3.6

MAINTAINER Antonino Abbate "ninoabbate@gmail.com"

RUN apk --update add bash apache2 php5 php5-apache2 php5-curl php5-mysqli php5-openssl php5-json php5-phar php5-pdo php5-pdo_mysql postfix git && \
      ln /usr/bin/php5 /usr/bin/php

RUN cd /var/www/ \
  && git clone https://github.com/etsy/morgue.git morgue \
  && mv /var/www/morgue/config/example.json /var/www/morgue/config/example.json.orig \
  && mkdir -p /run/apache2 \
  && chgrp www-data /run/apache2 \
  && chmod 775 /run/apache2 \
  && chown apache:apache logs \
  && chmod g+w /var/log/apache2 \
  && addgroup apache wheel 

RUN cd /var/www/morgue \
  && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php composer-setup.php --install-dir=/var/www/morgue \
  && php -r "unlink('composer-setup.php');" \
  && php composer.phar update

RUN apk del git \
  && rm -rf /var/cache/apk/* \
  && rm -rf /var/www/localhost

RUN postconf "smtputf8_enable = no" \
  && postfix start

ADD httpd.conf /etc/apache2/httpd.conf
ADD htpasswd /etc/htpasswd/.htpasswd
ADD entrypoint.sh /

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
CMD ["httpd","-D","FOREGROUND"]
