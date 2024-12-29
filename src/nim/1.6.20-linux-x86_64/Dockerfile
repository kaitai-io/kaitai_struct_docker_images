FROM nimlang/nim:1.6.20-alpine

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
# Nim Compiler Version 1.6.20 [Linux: amd64]
# Compiled at 2024-04-07
# Copyright (c) 2006-2023 by Andreas Rumpf
#
# git hash: 19fdbfc173bfccb64cb64e0a963e69f52f71fc73
# active boot switches: -d:release -d:danger
RUN ./validate '^Nim Compiler Version 1\.6\.20 '
