#!/bin/sh

composer install --no-dev --optimize-autoloader --prefer-dist
chmod o+w components/demo/cache/ components/demo/logs/
