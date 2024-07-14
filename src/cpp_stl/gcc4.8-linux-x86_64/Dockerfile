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
	zlib1g-dev \
	valgrind \
	curl \
	libssl-dev \
	ruby

# Ubuntu 14.04 comes with ancient cmake 2.8.12.2-0ubuntu3. We don't
# really want to keep supporting old cmake versions, nor we benefit anyhow
# from using ancient cmake. Also, it's quite trivial to just build fresh
# cmake from sources, so we do that.

RUN curl -fsSLO https://github.com/Kitware/CMake/releases/download/v3.27.7/cmake-3.27.7.tar.gz
RUN tar -xf cmake-3.27.7.tar.gz && \
	cd cmake-3.27.7 && \
	./bootstrap && \
	make && \
	make install && \
	cmake --version

# Build Boost.Test from source - see
# https://www.boost.org/doc/libs/1_84_0/libs/test/doc/html/boost_test/adv_scenarios/build_utf.html

RUN curl -fsSLO https://boostorg.jfrog.io/artifactory/main/release/1.84.0/source/boost_1_84_0.tar.bz2 && \
	tar --bzip2 -xf boost_1_84_0.tar.bz2 && \
	rm -f boost_1_84_0.tar.bz2 && \
	cd boost_1_84_0 && \
	./bootstrap.sh --with-libraries=test && \
	./b2 --with-test variant=debug link=shared install && \
	cd .. && \
	rm -rf boost_1_84_0

# Validate that we've got correct version, e.g. something like this:
#
# $ gcc --version
# gcc (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4
# Copyright (C) 2013 Free Software Foundation, Inc.
# This is free software; see the source for copying conditions.  There is NO
# warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

RUN ./validate-gcc '^gcc \(.*\) 4\.8\.'
RUN ./validate-boost '^Boost 1_84$'
