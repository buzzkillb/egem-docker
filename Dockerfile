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
#    make -C /go-egem egem && \
    make -C /go-egem stats

# final image
FROM golang:1.12-alpine3.9

RUN mkdir -p /data

VOLUME ["/data"]

#COPY --from=builder /go-egem/build/bin/egem /usr/local/bin/egem
COPY --from=builder /go-egem/build/bin/stats /usr/local/bin/stats
ADD https://gitlab.com/ethergem/egem-configs/raw/master/config.toml /root/data/

EXPOSE 8897

ENTRYPOINT ["stats"]
