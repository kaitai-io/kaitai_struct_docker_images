FROM node:4-alpine

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare
RUN ./prepare-alpine-init && ./prepare-alpine-ruby && ./prepare-alpine-uninit

# Validate that we've got correct version, e.g. something like this:
#
# $ node --version
# v4.9.1

RUN ./validate '^v4\.'
