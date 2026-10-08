FROM nim:2.2.12

# Copy files common for all images
COPY 4img/* ./

# Install nim dependencies
RUN nimble install -y 'kaitai_struct_nim_runtime@#head'
RUN nimble install -y testify

# Make sure `testify` is available in the PATH
RUN ln -s $(nimble path testify)/testify /usr/local/bin

# Install ruby for post-run aggregation
RUN ./prepare-apt-ruby && ./prepare-apt-uninit

# Validate that we've got correct version, e.g. something like this:
#
# $ nim --version
# Nim Compiler Version 2.2.12 [Linux: amd64]
# Compiled at 2026-09-08
# Copyright (c) 2006-2026 by Andreas Rumpf
#
# git hash: 8e8fbf60693418dc95bb0d762fd660231d08a583
# active boot switches: -d:release
RUN ./validate '^Nim Compiler Version 2\.2\.12 '
