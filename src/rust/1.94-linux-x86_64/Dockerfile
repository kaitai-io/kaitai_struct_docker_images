FROM rust:1.94

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
# rustc 1.94.0 (4a4ef493e 2026-03-02)
#
# $ cargo nextest --version
# cargo-nextest 0.9.128 (96bc6d4f4 2026-02-19)
# release: 0.9.128
# commit-hash: 96bc6d4f4056abd8af1e27f9f18148d0d1f447ae
# commit-date: 2026-02-19
# host: x86_64-unknown-linux-gnu

RUN ./validate-rustc '^rustc 1\.94\.'
RUN ./validate-nextest '^cargo-nextest 0\.9\.'
