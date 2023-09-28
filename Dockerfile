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

# Set up custom Directory configurations
RUN { \
    echo '<Directory "/var/www/html/">'; \
    echo '    AllowOverride All'; \
    echo '    Options Indexes FollowSymLinks'; \
    echo '    Require all granted'; \
    echo '</Directory>'; \
    echo 'DirectoryIndex index.php index.html'; \
    } > /etc/apache2/conf-available/custom-config.conf && \
    a2enconf custom-config

# If there is any need for other .conf files, enable them here
RUN a2enconf htaccess

# Copy the PHP file to the web root
COPY index.php /var/www/html/
