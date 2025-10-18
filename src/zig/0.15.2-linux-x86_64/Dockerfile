FROM alpine:3.22

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN \
	./prepare-alpine-init && \
	./prepare-alpine-ruby && \
	apk add curl minisign && \
	./prepare-alpine-uninit

# Download Zig
RUN ./prepare 'zig-x86_64-linux-0.15.2.tar.xz'

# Add the `zig` binary to PATH
ENV PATH="$PATH:/usr/local/zig-x86_64-linux-0.15.2"

# Validate that we've got correct version, e.g. something like this:
#
# $ zig version
# 0.15.2

RUN ./validate '^0\.15\.2$'
