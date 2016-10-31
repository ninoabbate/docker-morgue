FROM alpine:3.4

RUN apk --update add bash apache2 php5 php5-apache2 php5-curl php5-mysqli php5-openssl php5-json php5-phar php5-pdo php5-pdo_mysql postfix git

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
  && php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
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
ADD example.json /var/www/morgue/config/example.json

EXPOSE 80

ENTRYPOINT ["httpd","-D","FOREGROUND"]