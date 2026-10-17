FROM perl:5.44-slim

# Copy files common for all images
COPY 4img/* ./

# Ruby is required for test infrastructure (aggregators, test result converters) to work.
# `prepare` installs Perl dependencies and needs apt lists, so it runs between these.
RUN ./prepare-apt-ruby && \
	./prepare && \
	./prepare-apt-uninit

# Validate that we've got correct version, e.g. something like this:
#
# $ perl --version
#
# This is perl 5, version 44, subversion 0 (v5.44.0) built for x86_64-linux-gnu
#
# Copyright 1987-2026, Larry Wall
# ...

RUN ./validate '^This is perl 5, version 44,'
