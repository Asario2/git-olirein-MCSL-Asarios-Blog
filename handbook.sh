#!/bin/sh -l

npm run docs:build

php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear
php artisan migrate
php artisan queue:restart
php artisan queue:listen --timeout=7200

php artisan sitemap:generate
