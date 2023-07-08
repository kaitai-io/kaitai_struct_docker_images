FROM php:8.2

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare-apt-ruby
RUN ./prepare

# Validate that we've got correct version, e.g. something like this:
#
# $ php --version
# PHP 8.2.7 (cli) (built: Jul  4 2023 14:24:49) (NTS)
# Copyright (c) The PHP Group
# Zend Engine v4.2.7, Copyright (c) Zend Technologies

RUN ./validate '^PHP 8\.2\.'
