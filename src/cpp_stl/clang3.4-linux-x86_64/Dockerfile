FROM ubuntu:14.04

WORKDIR /root

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN apt-get update

# Ultimately, in this image we want clang/clang++ as the only compiler,
# but the caveat is that we temporarily need gcc to build Boost.

# curl - required to download cmake
RUN apt-get install -y --no-install-recommends \
	g++ \
	make \
	zlib1g-dev \
	valgrind \
	curl \
	ruby

# Ubuntu 14.04 comes with ancient cmake 2.8.12.2-0ubuntu3. We don't really want
# to keep supporting old cmake versions, nor we benefit in any way from using
# ancient cmake. Therefore, we use a precompiled binary distribution of a recent
# version of cmake.

# Download the CMake binary installer and run it
RUN curl -fsSLO https://github.com/Kitware/CMake/releases/download/v3.31.3/cmake-3.31.3-linux-x86_64.sh && \
	chmod u+x cmake-3.31.3-linux-x86_64.sh && \
	./cmake-3.31.3-linux-x86_64.sh --skip-license --prefix=/usr/local --exclude-subdir && \
	rm cmake-3.31.3-linux-x86_64.sh && \
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
	./b2 --with-test variant=debug link=shared install && \
	cd .. && \
	rm -rf boost_1_81_0

# Remove gcc and install clang instead
RUN \
	apt-get remove -y g++ gcc && \
	apt-get autoremove -y && \
	apt-get install -y clang binutils

# Validate that we've got correct version, e.g. something like this:
#
# $ clang --version
# Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)
# Target: x86_64-pc-linux-gnu
# Thread model: posix

RUN ./validate-clang 'clang version 3\.4-'
RUN ./validate-boost '^Boost 1_81$'
