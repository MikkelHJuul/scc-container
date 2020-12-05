FROM alpine as scc-get

# Install wget + bash
RUN apk update
RUN apk add wget
RUN apk add --no-cache --upgrade bash

# Download scc
RUN wget https://github.com/boyter/scc/releases/download/v2.13.0/scc-2.13.0-i386-unknown-linux.zip
RUN unzip ./scc-2.13.0-i386-unknown-linux.zip -d /
RUN chmod +x /scc

FROM alpine
COPY --from=scc-get /scc /
WORKDIR /root
ENTRYPOINT ["/scc"]
