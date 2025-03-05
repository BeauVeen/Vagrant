#!/usr/bin/env bash
WP_DIR="$(/var/www/wordpress)"
WP_FILE="/vagrant/wordpress_latest.tar.gz"

curl https://wordpress.org/latest.tar.gz > ${WP_FILE}
mkdir -p ${WP_DIR}
cd ${WP_DIR}
tar zxvf ${WP_FILE} --strip-components 1
chown -Rv www-data.www-data *

echo *** wordpress installed ***