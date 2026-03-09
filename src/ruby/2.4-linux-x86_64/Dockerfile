FROM ruby:2.4

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare

# Validate that we've got correct version, e.g. something like this:
#
# $ ruby --version
# ruby 2.4.10p364 (2020-03-31 revision 67879) [x86_64-linux]

RUN ./validate '^ruby 2\.4\.'
