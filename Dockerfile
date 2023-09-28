FROM php:7.4-apache

# Enable Apache mod_rewrite module
RUN a2enmod rewrite

# AllowOverride All enables the use of .htaccess
RUN echo '<Directory "/var/www/html/">\n\
    AllowOverride All\n\
</Directory>' > /etc/apache2/conf-available/htaccess.conf \
&& a2enconf htaccess

# Copy the PHP file and .htaccess to the web root
COPY index.php /var/www/html/
COPY .htaccess /var/www/html/

# Expose port 80
EXPOSE 80
