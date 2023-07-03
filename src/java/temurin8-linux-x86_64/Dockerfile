FROM eclipse-temurin:8

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare-ruby
RUN ./prepare-java-deps

# Validate that we've got correct version, e.g. something like this:
#
# $ java -version
# openjdk version "1.8.0_372"
# OpenJDK Runtime Environment (Temurin)(build 1.8.0_372-b07)
# OpenJDK 64-Bit Server VM (Temurin)(build 25.372-b07, mixed mode)

RUN ./validate '^openjdk version "1\.8\.'
