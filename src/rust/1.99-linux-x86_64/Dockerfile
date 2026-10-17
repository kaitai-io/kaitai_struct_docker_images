FROM rust:1.99-slim

# Copy files common for all images
COPY 4img/* ./

# Install all dependencies
RUN ./prepare-apt-ruby && \
	apt-get install -y --no-install-recommends git curl && \
	./prepare-apt-uninit
RUN ./prepare-runtime-deps
RUN ./prepare-nextest

# Validate that we've got correct versions, e.g. something like this:
#
# $ rustc --version
# rustc 1.99.1 (58cf8f9c3 2026-10-13)
#
# $ cargo nextest --version
# cargo-nextest 0.9.148 (cd1d6d546 2026-10-07)
# release: 0.9.148
# commit-hash: cd1d6d5467322dbc0d39a80cb671d000ac302798
# commit-date: 2026-10-07
# host: x86_64-unknown-linux-gnu

RUN ./validate-rustc '^rustc 1\.99\.'
RUN ./validate-nextest '^cargo-nextest 0\.9\.'
