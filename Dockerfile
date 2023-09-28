# Use the official PHP image with Apache
FROM php:7.4-apache

# Copy the PHP files into the image
COPY . /var/www/html/


# Enable mod_dumpio
RUN a2enmod dump_io

# Update Apache Configuration to enable DumpIOInput and set LogLevel for dumpio
RUN echo 'DumpIOInput On' >> /etc/apache2/conf-enabled/dumpio.conf \
 && echo 'DumpIOOutput On' >> /etc/apache2/conf-enabled/dumpio.conf \
 && echo 'LogLevel dumpio:trace7' >> /etc/apache2/conf-enabled/dumpio.conf

# Change the ownership of the files to the web server user
RUN chown -R www-data:www-data /var/www/html/
