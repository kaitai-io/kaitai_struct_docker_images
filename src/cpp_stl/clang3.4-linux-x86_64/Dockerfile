FROM ubuntu:14.04

# Copy files common for all images
COPY 4img/* ./

RUN apt-get update

# Ubuntu 14.04 comes with ancient cmake 2.8.12.2-0ubuntu3. We don't
# really want to keep supporting old cmake versions, nor we benefit anyhow
# from using ancient cmake.
#
# Ultimately, in this image we want clang/clang++ as the only compiler,
# but the caveat is that for building new cmake we temporarily need gcc.

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

# Build and install cmake
RUN curl -fsSL https://github.com/Kitware/CMake/releases/download/v3.26.4/cmake-3.26.4.tar.gz -o cmake-3.26.4.tar.gz
RUN tar -xvf cmake-3.26.4.tar.gz && \
	cd cmake-3.26.4 && \
	./bootstrap && \
	make && \
	make install && \
	cmake --version

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
