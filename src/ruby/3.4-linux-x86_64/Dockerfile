FROM ruby:3.4

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare

# Validate that we've got correct version, e.g. something like this:
#
# $ ruby --version
# ruby 3.4.1 (2024-12-25 revision 48d4efcb85) +PRISM [x86_64-linux]

RUN ./validate '^ruby 3\.4\.'
