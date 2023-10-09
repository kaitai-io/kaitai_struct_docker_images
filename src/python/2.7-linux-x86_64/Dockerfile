FROM python:2.7-alpine

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN python -m pip install enum34 && ./prepare
RUN ./prepare-alpine-init && ./prepare-alpine-ruby && ./prepare-alpine-uninit

# Validate that we've got correct version, e.g. something like this:
#
# $ python --version
# Python 2.7.18

RUN ./validate '^Python 2\.7\.'
