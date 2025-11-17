FROM nimlang/nim:2.2.6-alpine-regular

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
# Nim Compiler Version 2.2.6 [Linux: amd64]
# Compiled at 2025-10-31
# Copyright (c) 2006-2025 by Andreas Rumpf
#
# git hash: ab00c56904e3126ad826bb520d243513a139436a
# active boot switches: -d:release -d:danger
RUN ./validate '^Nim Compiler Version 2\.2\.6 '
