FROM eclipse-temurin:11

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare-ruby
RUN ./prepare-java-deps

# Validate that we've got correct version, e.g. something like this:
#
# $ java -version
# openjdk version "11.0.19" 2023-04-18
# OpenJDK Runtime Environment Temurin-11.0.19+7 (build 11.0.19+7)
# OpenJDK 64-Bit Server VM Temurin-11.0.19+7 (build 11.0.19+7, mixed mode, sharing)

RUN ./validate '^openjdk version "11\.'
