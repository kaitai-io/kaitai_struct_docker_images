FROM php:7.1

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare-apt-ruby
RUN ./prepare

# Validate that we've got correct version, e.g. something like this:
#
# $ php --version
# PHP 7.1.33 (cli) (built: Nov 22 2019 18:22:12) ( NTS )
# Copyright (c) 1997-2018 The PHP Group
# Zend Engine v3.1.0, Copyright (c) 1998-2018 Zend Technologies

RUN ./validate '^PHP 7\.1\.'
