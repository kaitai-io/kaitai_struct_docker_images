FROM python:3.11-alpine

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare
RUN ./prepare-alpine-init && ./prepare-alpine-ruby && ./prepare-alpine-uninit

# Validate that we've got correct version, e.g. something like this:
#
# $ python --version
# Python 3.11.4

RUN ./validate-python '^Python 3\.11\.'
RUN ./validate-construct '^2\.10\.'
