FROM golang as scc-get

ARG VERSION
RUN go get -u github.com/boyter/scc@v$VERSION

FROM amd64/alpine
COPY --from=scc-get /go/bin/scc /bin/
ENTRYPOINT ["scc"]
