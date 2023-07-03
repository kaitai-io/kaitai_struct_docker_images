FROM azul/zulu-openjdk-alpine:7

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare-alpine-ruby
RUN ./prepare-java-deps

# Validate that we've got correct version, e.g. something like this:
#
# $ java -version
# openjdk version "1.7.0_352"
# OpenJDK Runtime Environment (Zulu 7.56.0.11-CA-linux64) (build 1.7.0_352-b01)
# OpenJDK 64-Bit Server VM (Zulu 7.56.0.11-CA-linux64) (build 24.352-b01, mixed mode)

RUN ./validate '^openjdk version "1\.7\.'
