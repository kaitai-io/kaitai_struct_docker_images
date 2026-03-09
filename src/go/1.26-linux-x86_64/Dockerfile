FROM golang:1.26-alpine

# Copy files common for all images
COPY 4img/* ./

# * Ruby is required for test infrastructure (aggregators, test result converters) to work
# * `curl` is used in src/go/_common/prepare
# * `git` is used in src/go/_common/prepare
RUN \
	./prepare-alpine-init && \
	./prepare-alpine-ruby && \
	apk add curl git && \
	./prepare-alpine-uninit

# Install rest of go-specific dependencies
RUN ./prepare

# Validate that we've got correct version, e.g. something like this:
#
# $ go version
# go version go1.26.1 linux/amd64

RUN ./validate '^go version go1\.26\.'

# Prevent Go from accessing the network (see https://go.dev/ref/mod#resolve-pkg-mod)
ENV GOPROXY=off
