#!/bin/sh

composer install --no-dev --optimize-autoloader --prefer-dist
chmod o+w app/storage/*
