FROM node:18-alpine

# Copy files common for all images
COPY 4img/* ./

WORKDIR /app

# Install all dependencies
RUN /prepare
RUN /prepare-alpine-ruby

# Validate that we've got correct version, e.g. something like this:
#
# $ node --version
# v18.16.1

RUN /validate '^v18\.'
