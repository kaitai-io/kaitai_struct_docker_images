FROM nimlang/nim:2.2.2-alpine

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
# Nim Compiler Version 2.2.2 [Linux: amd64]
# Compiled at 2025-02-06
# Copyright (c) 2006-2025 by Andreas Rumpf
#
# git hash: 6c34f62785263ad412f662f3e4e4bf8d8751d113
# active boot switches: -d:release -d:danger
RUN ./validate '^Nim Compiler Version 2\.2\.2 '
