#!/usr/bin/env bash
WP_DIR="$(/var/www/wordpress)“​
WP_SITE="${WP_DIR##*/}“​
cd ${WP_DIR}

if [[ -f .htaccess ]]; then
	mv .htaccess .htaccess_ORIGINAL
fi

cat > ${WP_DIR}/.htaccess <<EOT
<IfModule mod_rewrite.c>
	RewriteEngine On
	RewriteBase /${WP_SITE}/
	RewriteRule ^index\.php$ - [L]
	RewriteCond %{REQUEST_FILENAME} !-f
	RewriteCond %{REQUEST_FILENAME} !-d
	RewriteRule . /${WP_SITE}/index.php [L]
</IfModule>
EOT

chown www-data.www-data ${WP_DIR}/.htaccess
chown root.www-data ${WP_DIR} 
chmod 775 ${WP_DIR}