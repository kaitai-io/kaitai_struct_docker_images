FROM python:2.7-alpine

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare

# Validate that we've got correct version, e.g. something like this:
#
# $ python --version
# Python 2.7.18

RUN ./validate '^Python 2\.7\.'
