FROM lukasojd/docker-gen:latest

MAINTAINER Lukáš Kříž <lukasojd@gmail.com>

RUN apt-get update

RUN apt-get install -y apache2 libapache2-mod-php5

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /app/
WORKDIR /app/

# create empty script and set permissions
RUN touch /var/www/proxy.php && chmod 644 /var/www/proxy.php

COPY default.conf /etc/apache2/sites-enabled/000-default.conf
COPY proxy.php.tmpl /app/proxy.php.tmpl
COPY run.sh /run.sh

CMD ["/run.sh"]
