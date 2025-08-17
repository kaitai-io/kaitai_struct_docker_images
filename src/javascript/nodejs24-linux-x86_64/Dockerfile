FROM node:24-alpine

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare
RUN ./prepare-alpine-init && ./prepare-alpine-ruby && ./prepare-alpine-uninit

# Validate that we've got correct version, e.g. something like this:
#
# $ node --version
# v24.6.0

RUN ./validate '^v24\.'
