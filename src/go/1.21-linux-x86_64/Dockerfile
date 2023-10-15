FROM golang:1.21-alpine

# Copy files common for all images
COPY 4img/* ./

RUN ./prepare-alpine-init

# Ruby is required for test infrastructure (aggregators, test result converters) to work
RUN ./prepare-alpine-ruby

# Required to download go-junit-report release in ./prepare-go-deps
RUN apk add curl

# Required for `go get` to work
RUN apk add git

RUN ./prepare-alpine-uninit

# Install rest of go-specific dependencies
RUN ./prepare

# Validate that we've got correct version, e.g. something like this:
#
# $ go version
# go version go1.21.3 linux/amd64

RUN ./validate '^go version go1\.21\.'
