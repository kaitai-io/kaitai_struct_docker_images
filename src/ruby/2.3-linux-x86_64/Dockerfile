FROM ruby:2.3

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare

# Validate that we've got correct version, e.g. something like this:
#
# $ ruby --version
# ruby 2.3.8p459 (2018-10-18 revision 65136) [x86_64-linux]

RUN ./validate '^ruby 2\.3\.'
