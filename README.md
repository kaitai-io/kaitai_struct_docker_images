# Kaitai Struct testing image for Docker

This repository contains
[Dockerfiles](https://docs.docker.com/engine/reference/builder/) that
allow building images of reference Docker containers that are sufficient
to run relevant portion of Kaitai Struct tests for a particular target
language in a particular environment.

## Naming

When speaking of running a portion of Kaitai Struct tests, we need to be
aware of the following variables:

* `$TARGET`: designates target programming language.

* `$SUBTARGET`: designates suffix to the programming language which
  results in a different generation result from a Kaitai Struct compiler.
  * Supported values so far:
    * `_98` and `_11` for `cpp_stl` target

* `$IMPLEMENTATION`: describes specific name and version of the
  implementation of this programming language.
  * Examples:
    * `1.18` for go 1.18 (reference compiler and implementation)
    * `clang7.3` for clang implementation of C++ compiler, version 7.3
    * `msvc141` for Microsoft Visual C++, toolset v141
    * `temurin17` for [Eclipse Temurin build of Java JDK](https://adoptium.net/temurin/releases/), version 17

* `$OS`: operating system we'll be running on:
  * `linux`
  * `macos`
  * `windows`

* `$ARCH`: CPU architecture we'll be running on / compiling for (use OS notation, e.g. result of `uname -m` or something similar):
  * `x86_64` (Linux, macOS), `x64` (Windows)
  * `i386` (Linux), `x86` (Windows)
  * `arm64` (Windows, Linux)

Therefore, accumulating all this, ultimately name of the Docker container
will be structured as:

    kaitai-$TARGET$SUBTARGET-$IMPLEMENTATION-$OS-$ARCH

for example:

    kaitai-php-7.1-linux-x86_64
    kaitai-cpp_stl_98-msvc141-windows-x64
    kaitai-cpp_stl_11-clang7.3-macos-arm64
    kaitai-csharp-netcore2.2.103-linux-x86_64
    kaitai-javascript-nodejs16-linux-x86_64
    kaitai-java-temurin11-linux-x86_64

Sources for these containers will be found in this repository in:

    src/$TARGET/$IMPLEMENTATION-$OS-$ARCH

## Use of naming

* `$TARGET` MUST match `-t` / `--target` of the compiler.
* `$SUBTARGET` matches sum of certain Kaitai Struct compiler options.
* `$TARGET$SUBTARGET` is used for naming:
  * Dirs in `compiled/` directory resulting from a run in [tests repo](https://github.com/kaitai-io/kaitai_struct_tests)
  * Dirs in [`compiled/` directory](https://github.com/kaitai-io/ci_targets/tree/master/compiled) in [ci_targets repo](https://github.com/kaitai-io/ci_targets)
* `$TARGET$SUBTARGET/$VARIETY` is used for naming branches in [ci_artifacts](https://github.com/kaitai-io/ci_artifacts)

## How to use

Go to [tests repo](https://github.com/kaitai-io/kaitai_struct_tests) and launch `./docker-ci`, e.g.:

```
./docker-ci -t java -i temurin11
```

## Further reading

* [About Kaitai Struct](https://kaitai.io/)
