FROM alpine:3.21

# Copy files common for all images
COPY 4img/* ./

# Ruby is required for test infrastructure (aggregators, test result converters) to work
RUN \
	./prepare-alpine-init && \
	./prepare-alpine-ruby && \
	apk add graphviz && \
	./prepare-alpine-uninit

# Validate that we've got correct version, e.g. something like this:
#
# $ dot -V
# dot - graphviz version 12.2.0 (20241103.1931)

RUN ./validate '^dot - graphviz version 12\.'
