FROM php:7.4-apache

# Enable Apache mod_rewrite module
RUN a2enmod rewrite

# Custom LogLevel for 404 errors
RUN echo 'LogLevel warn mod_rewrite.c:trace3' >> /etc/apache2/apache2.conf


# Specify DirectoryIndex in Apache Configuration
RUN echo '<Directory "/var/www/html/">\n\
    AllowOverride All\n\
    DirectoryIndex index.php\n\
</Directory>' > /etc/apache2/conf-available/htaccess.conf \
&& a2enconf htaccess

# Copy the PHP file to the web root
COPY index.php /var/www/html/
