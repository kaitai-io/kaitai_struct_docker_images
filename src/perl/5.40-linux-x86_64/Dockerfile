# Can't use "slim" container, because we use XML-Simple, which requires gcc to build
FROM perl:5.40

# Copy files common for all images
COPY 4img/* ./

# Ruby is required for test infrastructure (aggregators, test result converters) to work
RUN ./prepare-apt-ruby && \
	./prepare-apt-uninit

# Install Perl dependencies
RUN ./prepare

# Validate that we've got correct version, e.g. something like this:
#
# $ perl --version
#
# This is perl 5, version 40, subversion 0 (v5.40.0) built for x86_64-linux-gnu
#
# Copyright 1987-2024, Larry Wall
# ...

RUN ./validate '^This is perl 5, version 40,'
