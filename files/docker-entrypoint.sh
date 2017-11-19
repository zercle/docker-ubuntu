#!/usr/bin/env bash

service rsyslog restart
service cron restart

tail -f /dev/null

exit $?
