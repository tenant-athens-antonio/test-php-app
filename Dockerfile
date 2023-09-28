FROM php:7.4-apache

# Enable Apache mod_rewrite module
RUN a2enmod rewrite

# Copy the PHP file to the web root
COPY index.php /var/www/html/
