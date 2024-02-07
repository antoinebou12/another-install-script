FROM golang:1.22-alpine as builder

RUN apk update && apk --no-cache add git build-base
RUN go get -u -v github.com/go-shiori/shiori

# ========== END OF BUILDER ========== #

FROM alpine:latest

RUN apk update && apk --no-cache add dumb-init ca-certificates
COPY --from=builder /go/bin/shiori /usr/local/bin/shiori

ENV SHIORI_DIR /srv/shiori/
EXPOSE 8078

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/usr/local/bin/shiori", "serve"]