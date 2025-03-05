#!/usr/bin/env bash
WP_DIR=$(/var/www/wordpress)
WP_PASS=$("P@ssword")
WP_USER=$("wpadmin")
WP_DBNAME=$("wordpress")

echo "Database configuration for Wordpress"
echo "===================================="
echo "username ....: ${WP_USER}"
echo "password ....: ${WP_PASS}"
echo "database ....: ${WP_DBNAME}"