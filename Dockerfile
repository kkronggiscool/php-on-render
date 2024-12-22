# Use an official PHP image with Apache pre-installed
FROM php:8.1-apache

# Enable mod_rewrite (commonly used for pretty URLs)
RUN a2enmod rewrite

# Copy the PHP application files into the container
COPY . /var/www/html/

# Expose port 80 for the web server
EXPOSE 80

# Set the working directory
WORKDIR /var/www/html

# Ensure permissions are correct for Apache to access the files
RUN chown -R www-data:www-data /var/www/html

# Set the entry point for the container
CMD ["apache2ctl", "-D", "FOREGROUND"]
