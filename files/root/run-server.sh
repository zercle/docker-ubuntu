#!/usr/bin/env bash

#service supervisor start
service ssh start
service rsyslog start
service cron start

openssl dhparam -dsaparam -out /etc/ssl/dhparam.pem 4096

tail -f /dev/null
