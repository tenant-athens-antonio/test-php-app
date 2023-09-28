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

# Modify docker-php.conf and Set up custom Directory configurations and DirectoryIndex
RUN sed -i '/DirectoryIndex disabled/d' /etc/apache2/conf-available/docker-php.conf && \
    { \
    echo '<Directory "/var/www/html/">'; \
    echo '    AllowOverride All'; \
    echo '    Options -Indexes +FollowSymLinks'; \
    echo '    Require all granted'; \
    echo '    DirectoryIndex index.php index.html'; \
    echo '</Directory>'; \
    } >> /etc/apache2/sites-available/000-default.conf 

# Copy the PHP file to the web root
COPY index.php /var/www/html/

# Copy the .htaccess file with redirection to the web root
COPY .htaccess /var/www/html/

# Restart Apache to ensure configurations are loaded
RUN service apache2 restart
