# Can't use "slim" container, because we use XML-Simple, which requires gcc to build
FROM perl:5.24

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare

# We need to install Ruby for tests infrastructure, but this image is
# based off Debian 9 "stretch", which is deprecated and no longer uses
# deb.debian.org as distribution point. We fix that by redirecting to
# http://archive.debian.org/debian-archive/debian/dists/
RUN echo 'deb http://archive.debian.org/debian-archive/debian stretch main' >/etc/apt/sources.list

RUN ./prepare-apt-ruby

# Validate that we've got correct version, e.g. something like this:
#
# $ perl --version
#
# This is perl 5, version 24, subversion 4 (v5.24.4) built for x86_64-linux-gnu
#
# Copyright 1987-2018, Larry Wall
# ...

RUN ./validate '^This is perl 5, version 24,'
