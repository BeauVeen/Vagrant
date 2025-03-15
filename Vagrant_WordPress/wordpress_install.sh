#!/bin/bash

# Update and install Apache, MySQL, PHP, and necessary extensions
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y apache2 mysql-server php php-mysql libapache2-mod-php unzip curl

# Start Apache and MySQL services
sudo systemctl start apache2
sudo systemctl enable apache2
sudo systemctl start mysql
sudo systemctl enable mysql

# Download and install WordPress
cd /var/www/html
sudo rm -rf *
curl -O https://wordpress.org/latest.tar.gz
sudo tar -xvzf latest.tar.gz
sudo mv wordpress/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

# Set up MySQL Database for WordPress
mysql -Bse "CREATE DATABASE wordpress;CREATE USER 'wpadmin'@'localhost' IDENTIFIED BY 'P@ssword1';GRANT ALL ON wordpress.* TO 'wpadmin'@'localhost';FLUSH PRIVILEGES;"

# Configure Apache for WordPress
sudo a2enmod rewrite
sudo systemctl restart apache2