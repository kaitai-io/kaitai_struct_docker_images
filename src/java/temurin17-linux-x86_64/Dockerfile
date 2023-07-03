FROM eclipse-temurin:17

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare-ruby
RUN ./prepare-java-deps

# Validate that we've got correct version, e.g. something like this:
#
# $ java -version
# openjdk version "17.0.7" 2023-04-18
# OpenJDK Runtime Environment Temurin-17.0.7+7 (build 17.0.7+7)
# OpenJDK 64-Bit Server VM Temurin-17.0.7+7 (build 17.0.7+7, mixed mode, sharing)

RUN ./validate '^openjdk version "17\.'
