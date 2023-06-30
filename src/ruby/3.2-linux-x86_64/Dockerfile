FROM ruby:3.2

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare

# Validate that we've got correct version, e.g. something like this:
#
# $ ruby --version
# ruby 3.2.2 (2023-03-30 revision e51014f9c0) [x86_64-linux]

RUN ./validate '^ruby 3\.2\.'
