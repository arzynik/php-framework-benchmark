#!/bin/sh

composer install --no-dev --optimize-autoloader --prefer-dist
chmod o+w var/tmp/ var/log/
