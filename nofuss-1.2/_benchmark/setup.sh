#!/bin/sh

rm cache/*.all.php
composer install --no-dev --optimize-autoloader --prefer-dist
php html/index.php -m compress
chmod o+w cache
