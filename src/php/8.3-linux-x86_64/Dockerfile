FROM php:8.3

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare-apt-ruby
RUN ./prepare

# Validate that we've got correct version, e.g. something like this:
#
# $ php --version
# PHP 8.3.3 (cli) (built: Feb 16 2024 20:53:43) (NTS)
# Copyright (c) The PHP Group
# Zend Engine v4.3.3, Copyright (c) Zend Technologies

RUN ./validate '^PHP 8\.3\.'
