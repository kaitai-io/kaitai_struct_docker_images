FROM php:8.5

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare-apt-ruby
RUN ./prepare

# Validate that we've got correct version, e.g. something like this:
#
# $ php --version
# PHP 8.5.3 (cli) (built: Feb 24 2026 19:07:09) (NTS)
# Copyright (c) The PHP Group
# Built by https://github.com/docker-library/php
# Zend Engine v4.5.3, Copyright (c) Zend Technologies
#     with Zend OPcache v8.5.3, Copyright (c), by Zend Technologies

RUN ./validate '^PHP 8\.5\.'
