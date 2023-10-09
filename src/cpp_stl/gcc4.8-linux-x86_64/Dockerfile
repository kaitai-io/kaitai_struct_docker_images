FROM ubuntu:14.04

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN apt-get update

# curl - required to download cmake
# libssl-dev - required for cmake build
RUN apt-get install -y --no-install-recommends \
	g++ \
	make \
	libboost-test-dev \
	zlib1g-dev \
	valgrind \
	curl \
	libssl-dev \
	ruby

# Ubuntu 14.04 comes with ancient cmake 2.8.12.2-0ubuntu3. We don't
# really want to keep supporting old cmake versions, nor we benefit anyhow
# from using ancient cmake. Also, it's quite trivial to just build fresh
# cmake from sources, so we do that.

RUN curl -fsSL https://github.com/Kitware/CMake/releases/download/v3.27.7/cmake-3.27.7.tar.gz -o cmake-3.27.7.tar.gz
RUN tar -xf cmake-3.27.7.tar.gz && \
	cd cmake-3.27.7 && \
	./bootstrap && \
	make && \
	make install && \
	cmake --version

# Validate that we've got correct version, e.g. something like this:
#
# $ gcc --version
# gcc (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4
# Copyright (C) 2013 Free Software Foundation, Inc.
# This is free software; see the source for copying conditions.  There is NO
# warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

RUN ./validate-gcc '^gcc \(.*\) 4\.8\.'
