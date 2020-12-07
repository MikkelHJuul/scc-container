FROM golang as scc-get

ENV GOOS=linux
ENV GOARCH=amd64

ARG VERSION
RUN git clone --branch $VERSION --depth 1 https://github.com/boyter/scc
WORKDIR /go/scc
RUN go build

FROM amd64/alpine
COPY --from=scc-get /go/scc/scc /bin/
ENTRYPOINT ["scc"]
