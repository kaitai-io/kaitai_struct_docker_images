FROM alpine:3.19

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
# dot - graphviz version 9.0.0 (20230911.1827)

RUN ./validate '^dot - graphviz version 9\.'
