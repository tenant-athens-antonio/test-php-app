FROM php:7.4-apache

# Enable Apache mod_rewrite module
RUN a2enmod rewrite

# Specify DirectoryIndex in Apache Configuration
RUN echo '<Directory "/var/www/html/">\n\
    AllowOverride All\n\
    DirectoryIndex index.php\n\
</Directory>' > /etc/apache2/conf-available/htaccess.conf \
&& a2enconf htaccess

# Copy the PHP file to the web root
COPY index.php /var/www/html/

# Expose port 80
EXPOSE 80
