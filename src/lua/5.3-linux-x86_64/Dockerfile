FROM ubuntu:22.04

# Copy files common for all images
COPY 4img/* ./

# Install apt dependencies
RUN \
	apt-get update && \
	apt-get install -y --no-install-recommends \
		gcc \
		libc-dev \
		libreadline-dev \
		python3-pip \
		unzip \
		make \
		wget \
		ruby && \
# Install lua itself + lua dependencies
	./install-lua && \
	./prepare && \
# Uninstall gcc, cleanup apt caches
	apt-get --purge autoremove -y \
		gcc \
		libc-dev \
		libreadline-dev \
		python3-pip \
		unzip \
		make \
		wget \
		libreadline8+ && \
	rm -rf /var/lib/apt/lists/*

# Validate that we've got correct version, e.g. something like this:
#
# $ lua -v
# Lua 5.3.6  Copyright (C) 1994-2020 Lua.org, PUC-Rio
# $ luarocks --version
# //lua_install/bin/luarocks 3.8.0
# LuaRocks main command-line interface

RUN ./validate-lua '^Lua 5\.3\.'
RUN ./validate-luarocks 'luarocks 3\.8\.'
