FROM ubuntu:22.04

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
	g++ \
	make \
	cmake \
	libboost-test-dev \
	zlib1g-dev \
	valgrind \
	ruby

# Validate that we've got correct version, e.g. something like this:
#
# $ gcc --version
# gcc (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0
# Copyright (C) 2021 Free Software Foundation, Inc.
# This is free software; see the source for copying conditions.  There is NO
# warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

RUN ./validate-gcc '^gcc \(.*\) 11\.'
