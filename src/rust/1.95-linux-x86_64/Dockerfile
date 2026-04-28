FROM rust:1.95-slim

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
# rustc 1.95.0 (59807616e 2026-04-14)
#
# $ cargo nextest --version
# cargo-nextest 0.9.133 (65e806bd5 2026-04-14)
# release: 0.9.133
# commit-hash: 65e806bd589d12c4341d3696a02a9788bd437c3c
# commit-date: 2026-04-14
# host: x86_64-unknown-linux-gnu

RUN ./validate-rustc '^rustc 1\.95\.'
RUN ./validate-nextest '^cargo-nextest 0\.9\.'
