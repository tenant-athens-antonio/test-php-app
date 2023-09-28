# Use the official PHP image with Apache
FROM php:7.4-apache

# Copy the PHP files into the image
COPY . /var/www/html/


# Change the ownership of the files to the web server user
RUN chown -R www-data:www-data /var/www/html/
