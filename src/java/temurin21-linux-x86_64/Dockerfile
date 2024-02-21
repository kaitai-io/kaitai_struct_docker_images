FROM eclipse-temurin:21

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare-apt-ruby
RUN ./prepare-java-deps

# Validate that we've got correct version, e.g. something like this:
#
# $ java -version
# openjdk version "21.0.2" 2024-01-16 LTS
# OpenJDK Runtime Environment Temurin-21.0.2+13 (build 21.0.2+13-LTS)
# OpenJDK 64-Bit Server VM Temurin-21.0.2+13 (build 21.0.2+13-LTS, mixed mode, sharing)

RUN ./validate '^openjdk version "21\.'
