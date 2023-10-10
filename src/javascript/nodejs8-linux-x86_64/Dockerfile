FROM node:8-alpine

# Copy files common for all images
COPY 4img/* ./

# NOTE: the following `unsafe-perm=true` setting is needed on Alpine for
# Node.js versions older than 12 to avoid "Error: could not get
# uid/gid", see https://stackoverflow.com/a/52196681
RUN npm config set unsafe-perm true

# Install all dependencies
RUN ./prepare
RUN ./prepare-alpine-init && ./prepare-alpine-ruby && ./prepare-alpine-uninit

# Validate that we've got correct version, e.g. something like this:
#
# $ node --version
# v8.17.0

RUN ./validate '^v8\.'
