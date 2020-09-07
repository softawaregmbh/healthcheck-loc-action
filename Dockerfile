# Use alpine image
FROM alpine:3.11.3

# Install bash
RUN apk update
RUN apk add --no-cache --upgrade bash

# Comment in to test
# COPY test-prj /test-prj

# Copy shell script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

COPY scc-2.12.0-i386-unknown-linux /scc
RUN chmod +x /scc

COPY jq-1.6-linux32 /jq
RUN chmod +x /jq

# Run script
ENTRYPOINT ["/entrypoint.sh"]