FROM php:8.4

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare-apt-ruby
RUN ./prepare

# Validate that we've got correct version, e.g. something like this:
#
# $ php --version
# PHP 8.4.2 (cli) (built: Dec 24 2024 22:21:26) (NTS)
# Copyright (c) The PHP Group
# Built by https://github.com/docker-library/php
# Zend Engine v4.4.2, Copyright (c) Zend Technologies

RUN ./validate '^PHP 8\.4\.'
