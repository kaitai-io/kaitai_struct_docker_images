FROM corgibytes/ruby-1.9.3

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare

# Validate that we've got correct version, e.g. something like this:
#
# $ ruby --version
# ruby 1.9.3p551 (2014-11-13 revision 48407) [x86_64-linux]

RUN ./validate '^ruby 1\.9\.'
