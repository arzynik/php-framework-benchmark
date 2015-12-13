#!/bin/sh

composer install --no-dev --optimize-autoloader --prefer-dist
chmod o+w storage/*
sudo chmod o+w storage/framework/*
php artisan optimize --force
php artisan config:cache
php artisan route:cache
