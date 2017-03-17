#!/bin/bash

/etc/init.d/apache2 start

docker-gen -watch /app/proxy.php.tmpl /var/www/proxy.php
