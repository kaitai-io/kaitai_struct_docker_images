FROM nimlang/nim:1.6.0-alpine

# Copy files common for all images
COPY 4img/* ./

RUN nimble install -y 'kaitai_struct_nim_runtime@#head'
RUN nimble install -y testify

# Make sure `testify` is available in the PATH
RUN ln -s $(nimble path testify)/testify /usr/local/bin

# Validate that we've got correct version, e.g. something like this:
#
# $ nim -version
# Nim Compiler Version 1.6.0 [Linux: amd64]
# Compiled at 2021-10-19
# Copyright (c) 2006-2021 by Andreas Rumpf
#
# git hash: 727c6378d2464090564dbcd9bc8b9ac648467e38
# active boot switches: -d:release -d:danger
RUN ./validate '^Nim Compiler Version 1\.6\.0 '
