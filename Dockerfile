FROM golang:1.12-alpine3.9 as builder

LABEL author="buzzkillb"

RUN apk add --no-cache -y \
    git \
    gcc \
    musl-dev \
    linux-headers \
    make

RUN git clone https://gitlab.com/ethergem/go-egem.git /go-egem && \
    chmod -R 755 /go-egem && \
    make -C /go-egem egem

# final image
FROM golang:1.12-alpine3.9

RUN mkdir -p /data

VOLUME ["/data"]

COPY --from=builder /go-egem/build/bin/egem /usr/local/bin/egem

EXPOSE 30666

ENTRYPOINT ["egem", "--datadir=/data"]
