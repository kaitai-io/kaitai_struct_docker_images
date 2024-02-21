FROM ruby:3.3

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare

# Validate that we've got correct version, e.g. something like this:
#
# $ ruby --version
# ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [x86_64-linux]

RUN ./validate '^ruby 3\.3\.'
