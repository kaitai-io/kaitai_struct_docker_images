FROM julia:1.9

# Copy files common for all images
COPY 4img/* ./

# Ruby is needed to run partial builder
RUN ./prepare-apt-ruby && \
    ./prepare-apt-uninit

WORKDIR /env

# Install dependencies
RUN julia -e 'using Pkg; Pkg.activate("."); Pkg.add(["TestReports", "Test", "StringEncodings", "CodecZlib"]);'
# Precompile dependencies
RUN julia -e 'using Pkg; Pkg.instantiate();'
