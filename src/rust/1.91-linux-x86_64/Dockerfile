FROM rust:1.91

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
# rustc 1.91.1 (ed61e7d7e 2025-11-07)
# $ cargo nextest --version
# cargo-nextest 0.9.113 (a996815a8 2025-11-16)
# release: 0.9.113
# commit-hash: a996815a861a4bad5509c57510bab58172c6691c
# commit-date: 2025-11-16
# host: x86_64-unknown-linux-gnu

RUN ./validate-rustc '^rustc 1\.91\.'
RUN ./validate-nextest '^cargo-nextest 0\.9\.'
