# Can't use "slim" container, because we use XML-Simple, which requires gcc to build
FROM perl:5.38

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare

RUN ./prepare-apt-ruby

# Validate that we've got correct version, e.g. something like this:
#
# $ perl --version
#
# This is perl 5, version 38, subversion 0 (v5.38.0) built for x86_64-linux-gnu
#
# Copyright 1987-2023, Larry Wall
# ...

RUN ./validate '^This is perl 5, version 38,'
