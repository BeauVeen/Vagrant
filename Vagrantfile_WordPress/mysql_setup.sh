#!/usr/bin/env bash
mysql -Bse "CREATE DATABASE wordpress;CREATE USER 'wpadmin'@'localhost' IDENTIFIED BY 'P@ssword1';GRANT ALL ON wordpress.* TO 'wpadmin'@'localhost';FLUSH PRIVILEGES;"