FROM rust:1.83

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare-apt-ruby && ./prepare-apt-uninit
RUN ./prepare
# See https://nexte.st/docs/installation/pre-built-binaries/#downloading-and-installing-from-your-terminal
RUN curl -fsSL https://get.nexte.st/0.9/linux | tar xzvf - -C "${CARGO_HOME:-~/.cargo}"/bin

# Validate that we've got correct versions, e.g. something like this:
#
# $ rustc --version
# rustc 1.83.0 (90b35a623 2024-11-26)
# $ cargo nextest --version
# cargo-nextest 0.9.87 (fee71ad7b 2024-12-17)
# release: 0.9.87
# commit-hash: fee71ad7ba08be06519cf9eeb495c6fce0a2e888
# commit-date: 2024-12-17
# host: x86_64-unknown-linux-gnu

RUN ./validate-rustc '^rustc 1\.83\.'
RUN ./validate-nextest '^cargo-nextest 0\.9\.'
