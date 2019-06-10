FROM arm32v7/golang1.12-alpine3.9 as builder
COPY qemu-arm-static /usr/bin

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
FROM arm32v7/golang1.12-alpine3.9 as builder
COPY qemu-arm-static /usr/bin

RUN mkdir -p /data

VOLUME ["/data"]

COPY --from=builder /go-egem/build/bin/egem /usr/local/bin/egem
ADD https://gitlab.com/ethergem/egem-configs/raw/master/config.toml /root/data/

EXPOSE 8895 8896 8898 30666

ENTRYPOINT ["egem", "--datadir=/data", "--config=/root/data/config.toml"]
