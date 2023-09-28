FROM php:7.4-apache

# Enable Apache mod_rewrite module
RUN a2enmod rewrite

# Set up Apache configuration
RUN { \
    echo 'ServerName localhost'; \
    echo 'LogLevel warn mod_rewrite.c:trace3'; \
    echo 'ErrorLog /var/log/apache2/error.log'; \
    echo 'CustomLog /var/log/apache2/access.log combined'; \
    } >> /etc/apache2/apache2.conf

# Set up custom Directory configurations and DirectoryIndex
RUN { \
    echo '<Directory "/var/www/html/">'; \
    echo '    AllowOverride All'; \
    echo '    Options Indexes FollowSymLinks'; \
    echo '    Require all granted'; \
    echo '</Directory>'; \
    echo 'DirectoryIndex index.php'; \
    } >> /etc/apache2/sites-available/000-default.conf 

# Copy the PHP file to the web root
COPY index.php /var/www/html/

# Test HTML Page
COPY index.html /var/www/html/
