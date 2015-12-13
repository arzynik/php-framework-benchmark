#!/bin/sh

composer install --no-dev --optimize-autoloader --prefer-dist
chmod o+w storage/*
chmod o+w storage/framework/*
