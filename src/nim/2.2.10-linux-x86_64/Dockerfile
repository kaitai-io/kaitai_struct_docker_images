FROM nimlang/nim:2.2.10

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
# Nim Compiler Version 2.2.10 [Linux: amd64]
# Compiled at 2026-04-24
# Copyright (c) 2006-2026 by Andreas Rumpf
#
# git hash: bfeb3146d1638b39f69007a4ae5a23e23ae4e5ef
# active boot switches: -d:release
RUN ./validate '^Nim Compiler Version 2\.2\.10 '
