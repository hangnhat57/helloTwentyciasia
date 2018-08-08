#!/bin/bash
mkdir public/img/admin
mkdir public/img/admin/onboarding_slide
chmod 775 -R  ./storage ./bootstrap ./public/img/admin/onboarding_slide
chgrp -R www-data storage bootstrap/cache
chmod -R ug+rwx storage bootstrap/cache
php artisan key:generate 
php composer install 
php artisan db:seed
