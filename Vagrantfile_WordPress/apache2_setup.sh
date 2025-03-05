#!/usr/bin/env bash
WP_DIR="$(/var/www/wordpress)"

mkdir $WP_DIR
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/wordpress.conf
sudo a2dissite 000-default
echo "<VirtualHost *:80>" > /etc/apache2/sites-available/wordpress.conf
echo "	ServerAdmin webmaster@localhost" >> /etc/apache2/sites-available/wordpress.conf
echo "	DocumentRoot $WP_DIR" >> /etc/apache2/sites-available/wordpress.conf
echo "	<Directory $WP_DIR>" >> /etc/apache2/sites-available/wordpress.conf
echo "		AllowOverride All" >> /etc/apache2/sites-available/wordpress.conf
echo "	</Directory>" >> /etc/apache2/sites-available/wordpress.conf
echo "	ErrorLog /etc/apache2/_wp-error.log" >> /etc/apache2/sites-available/wordpress.conf
echo "	CustomLog /etc/apache2/_wp-access.log combined" >> /etc/apache2/sites-available/wordpress.conf
echo "</VirtualHost>" >> /etc/apache2/sites-available/wordpress.conf
sudo a2ensite wordpress
sudo systemctl reload apache2.service
echo *** Apache installed ***