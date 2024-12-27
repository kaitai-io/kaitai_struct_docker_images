FROM ubuntu:24.04

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
	clang \
	make \
	cmake \
	libboost-test-dev \
	zlib1g-dev \
	valgrind \
	ruby && \
	./prepare-apt-uninit

# Validate that we've got correct version, e.g. something like this:
#
# $ clang --version
# Ubuntu clang version 18.1.3 (1ubuntu1)
# Target: x86_64-pc-linux-gnu
# Thread model: posix
# InstalledDir: /usr/bin
RUN ./validate-clang 'clang version 18\.'
