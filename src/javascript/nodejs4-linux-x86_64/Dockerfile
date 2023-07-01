FROM node:4-alpine

# Copy files common for all images
COPY 4img/* ./

WORKDIR /app

# Install all dependencies
RUN /prepare

# Validate that we've got correct version, e.g. something like this:
#
# $ node --version
# v4.9.1

RUN /validate '^v4\.'