FROM python:2.7-alpine

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare
RUN ./prepare-alpine-init && ./prepare-alpine-ruby && ./prepare-alpine-uninit

# Validate that we've got correct version, e.g. something like this:
#
# $ python --version
# Python 2.7.18

RUN ./validate-python '^Python 2\.7\.'
RUN ./validate-construct '^2\.10\.'
