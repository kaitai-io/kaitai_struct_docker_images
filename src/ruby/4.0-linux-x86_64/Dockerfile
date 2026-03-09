FROM ruby:4.0

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare

# Validate that we've got correct version, e.g. something like this:
#
# $ ruby --version
# ruby 4.0.1 (2026-01-13 revision e04267a14b) +PRISM [x86_64-linux]

RUN ./validate '^ruby 4\.0\.'
