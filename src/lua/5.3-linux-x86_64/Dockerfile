FROM ubuntu:24.04

# Copy files common for all images
COPY 4img/* ./

ARG DEBIAN_FRONTEND=noninteractive

# Install Lua, LuaRocks and our Lua dependencies
RUN ./prepare-apt-ruby && \
	./prepare 5.3 && \
	./prepare-apt-uninit

ENV PATH="$PATH:/lua_install/bin"

# Validate that we've got correct version, e.g. something like this:
#
# $ lua -v
# Lua 5.3.6  Copyright (C) 1994-2020 Lua.org, PUC-Rio
# $ luarocks --version
# /lua_install/bin/luarocks 3.11.1
# LuaRocks main command-line interface

RUN ./validate-lua '^Lua 5\.3\.'
RUN ./validate-luarocks 'luarocks 3\.11\.'
