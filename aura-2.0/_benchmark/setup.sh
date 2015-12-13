#!/bin/sh

composer install --no-dev --optimize-autoloader --prefer-dist
chmod o+w tmp/cache/ tmp/log/
