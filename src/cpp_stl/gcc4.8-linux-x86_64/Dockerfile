FROM ubuntu:14.04

WORKDIR /root

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN apt-get update

# curl is needed to download the source code of the software to be built from
# source.
RUN apt-get install -y --no-install-recommends \
	g++ \
	zlib1g-dev \
	valgrind \
	curl \
	ruby

# Install GNU Make 4 from source. We are not happy with GNU Make 3.81 that we
# get by default on Ubuntu 14.04 (see "The Trusty Tahr" at
# https://launchpad.net/ubuntu/+source/make-dfsg - note that "Trusty Tahr" is a
# codename for Ubuntu 14.04), because it does not support the `--output-sync`
# option that we want to use in
# https://github.com/kaitai-io/kaitai_struct_tests/blob/af0359aeb87233640fcd85b57850c712b6f03f63/builder/cpp_builder.rb#L135
#
# Without it, messages from recipes running in parallel are often interspersed
# even on the same lines, making it difficult to read the resulting log files.
# See https://www.gnu.org/software/make/manual/html_node/Parallel-Output.html
# and https://github.com/kaitai-io/ci_targets/pull/12#issue-1813540049
RUN apt-get install -y --no-install-recommends make && \
	curl -w '%{url_effective}\n' -fsSLO https://ftpmirror.gnu.org/make/make-4.4.1.tar.gz && \
	sha256sum -c -w make-4.4.1.tar.gz.sha256 && \
	tar -xzf make-4.4.1.tar.gz && \
	rm -f make-4.4.1.tar.gz && \
	cd make-4.4.1 && \
	./configure && \
	make && \
	make install && \
	apt-get purge -y make && \
	cd .. && \
	rm -rf make-4.4.1

RUN ./validate-make '^GNU Make 4.4.1$'

# Ubuntu 14.04 comes with ancient cmake 2.8.12.2-0ubuntu3. We don't really want
# to keep supporting old cmake versions, nor we benefit in any way from using
# ancient cmake. Therefore, we use a precompiled binary distribution of a recent
# version of cmake.

# Download the CMake binary installer and run it
RUN curl -fLO https://github.com/Kitware/CMake/releases/download/v4.1.2/cmake-4.1.2-linux-x86_64.sh && \
	sha256sum -c -w cmake-4.1.2-linux-x86_64.sh.sha256 && \
	chmod u+x cmake-4.1.2-linux-x86_64.sh && \
	./cmake-4.1.2-linux-x86_64.sh --skip-license --prefix=/usr/local --exclude-subdir && \
	rm -f cmake-4.1.2-linux-x86_64.sh && \
	cmake --version

# Build Boost.Test from source - see
# https://www.boost.org/doc/libs/1_81_0/libs/test/doc/html/boost_test/adv_scenarios/build_utf.html
#
# Note: we're using Boost 1.81 specifically because we still support C++98 and
# test on it. With Boost 1.82 and later, we would see the following message...
#
# ```
# /usr/local/include/boost/{bind,function,smart_ptr}/detail/requires_cxx11.hpp:*:*:
#   note: #pragma message:
#     C++03 support is deprecated in Boost.{Bind,Function,SmartPtr} 1.82 and
#     will be removed in Boost.{Bind,Function,SmartPtr} 1.84.
# ```
#
# ... for every single test module compiled with `-std=c++98`, which clutters
# the build output quite a bit. Boost 1.81 doesn't generate these messages yet,
# so the easiest way to avoid them is to stick with Boost 1.81 (as long as we
# support C++98).

RUN curl -fsSLO https://archives.boost.io/release/1.81.0/source/boost_1_81_0.tar.bz2 && \
	tar --bzip2 -xf boost_1_81_0.tar.bz2 && \
	rm -f boost_1_81_0.tar.bz2 && \
	cd boost_1_81_0 && \
	./bootstrap.sh --with-libraries=test && \
	./b2 -d0 --with-test variant=debug link=shared install && \
	cd .. && \
	rm -rf boost_1_81_0

# Validate that we've got correct version, e.g. something like this:
#
# $ gcc --version
# gcc (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4
# Copyright (C) 2013 Free Software Foundation, Inc.
# This is free software; see the source for copying conditions.  There is NO
# warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

RUN ./validate-gcc '^gcc \(.*\) 4\.8\.'
RUN ./validate-boost '^Boost 1_81$'
