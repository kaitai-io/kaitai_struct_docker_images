FROM eclipse-temurin:25

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare-apt-ruby
RUN ./prepare-java-deps

# Validate that we've got correct version, e.g. something like this:
#
# $ java -version
# openjdk version "25.0.1" 2025-10-21 LTS
# OpenJDK Runtime Environment Temurin-25.0.1+8 (build 25.0.1+8-LTS)
# OpenJDK 64-Bit Server VM Temurin-25.0.1+8 (build 25.0.1+8-LTS, mixed mode, sharing)

RUN ./validate '^openjdk version "25\.'
