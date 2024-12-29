FROM nimlang/nim:2.2.0-alpine

# Copy files common for all images
COPY 4img/* ./

# Install nim dependencies
RUN nimble install -y 'kaitai_struct_nim_runtime@#head'
RUN nimble install -y testify

# Make sure `testify` is available in the PATH
RUN ln -s $(nimble path testify)/testify /usr/local/bin

# Install ruby for post-run aggregation
RUN ./prepare-alpine-init && ./prepare-alpine-ruby && ./prepare-alpine-uninit

# Validate that we've got correct version, e.g. something like this:
#
# $ nim --version
# Nim Compiler Version 2.2.0 [Linux: amd64]
# Compiled at 2024-10-02
# Copyright (c) 2006-2024 by Andreas Rumpf
#
# git hash: 78983f1876726a49c69d65629ab433ea1310ece1
# active boot switches: -d:release -d:danger
RUN ./validate '^Nim Compiler Version 2\.2\.0 '
