FROM rust:1.80

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare-apt-ruby && ./prepare-apt-uninit
RUN ./prepare
# See https://nexte.st/book/pre-built-binaries#downloading-and-installing-from-your-terminal
RUN curl -fsSL https://get.nexte.st/0.9/linux | tar xzvf - -C "${CARGO_HOME:-~/.cargo}"/bin

# Validate that we've got correct versions, e.g. something like this:
#
# $ rustc --version
# rustc 1.80.1 (3f5fd8dd4 2024-08-06)
# $ cargo nextest --version
# cargo-nextest-nextest 0.9.77

RUN ./validate-rustc '^rustc 1\.80\.'
RUN ./validate-nextest '^cargo-nextest-nextest 0\.9\.'
