FROM alpine:3.23

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
# dot - graphviz version 12.2.1 (20241206.2353)

RUN ./validate '^dot - graphviz version 12\.'
