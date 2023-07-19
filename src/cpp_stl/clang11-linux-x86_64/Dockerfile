FROM ubuntu:22.04

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
	clang-11 \
	make \
	cmake \
	libboost-test-dev \
	zlib1g-dev \
	valgrind \
	ruby && \
	./prepare-apt-uninit

# Set up clang for cc/c++ aliases
RUN \
	ln -s clang-11 /usr/bin/clang && \
	ln -s clang-11 /usr/bin/cc && \
	ln -s clang++-11 /usr/bin/clang++ && \
	ln -s clang++-11 /usr/bin/c++

# Validate that we've got correct version, e.g. something like this:
#
# $ clang --version
# Ubuntu clang version 11.1.0-6
# Target: x86_64-pc-linux-gnu
# Thread model: posix
# InstalledDir: /usr/bin
RUN ./validate-clang 'clang version 11\.'
