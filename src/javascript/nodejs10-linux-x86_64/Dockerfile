FROM node:10-alpine

# Copy files common for all images
COPY 4img/* ./

WORKDIR /app

# Install all dependencies
RUN /prepare
RUN /prepare-alpine-init && /prepare-alpine-ruby && /prepare-alpine-uninit

# Validate that we've got correct version, e.g. something like this:
#
# $ node --version
# v10.24.1

RUN /validate '^v10\.'
