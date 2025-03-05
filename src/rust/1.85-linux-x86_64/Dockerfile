FROM rust:1.85

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
# rustc 1.85.0 (4d91de4e4 2025-02-17)
# $ cargo nextest --version
# cargo-nextest 0.9.92 (e167105e4 2025-02-24)
# release: 0.9.92
# commit-hash: e167105e4bab278f048d298ce75ddf1b06c11f2e
# commit-date: 2025-02-24
# host: x86_64-unknown-linux-gnu

RUN ./validate-rustc '^rustc 1\.85\.'
RUN ./validate-nextest '^cargo-nextest 0\.9\.'
