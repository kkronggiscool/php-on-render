# Use the official PHP image from Docker Hub
FROM php:8.1-cli

# Install Apache and required PHP extensions (if needed)
RUN apt-get update && apt-get install -y \
    apache2 \
    libapache2-mod-php \
    && rm -rf /var/lib/apt/lists/*

# Enable Apache mod_rewrite (if needed)
RUN a2enmod rewrite

# Copy the PHP application files into the container
COPY . /var/www/html/

# Set the working directory
WORKDIR /var/www/html

# Expose port 80 for the web server
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
