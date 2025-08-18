FROM rust:1.89

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
# rustc 1.89.0 (29483883e 2025-08-04)
# $ cargo nextest --version
# cargo-nextest 0.9.94 (4148937af 2025-04-10)
# release: 0.9.94
# commit-hash: 4148937aff340f1aebee88a7b03ed0cd38f3b4ee
# commit-date: 2025-04-10
# host: x86_64-unknown-linux-gnu

RUN ./validate-rustc '^rustc 1\.89\.'
RUN ./validate-nextest '^cargo-nextest 0\.9\.'
