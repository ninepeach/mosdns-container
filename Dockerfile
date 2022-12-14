FROM --platform=$BUILDPLATFORM golang:alpine as builder
ARG CGO_ENABLED=0
ARG TAG

WORKDIR /root
RUN apk add --update git \
	&& git clone https://github.com/IrineSistiana/mosdns \
	&& cd ./mosdns \
	&& git fetch --all --tags \
	&& git checkout tags/${TAG} \
	&& go build -ldflags "-s -w -X main.version=${TAG}" -trimpath -o mosdns

FROM --platform=${BUILDPLATFORM} alpine:latest
LABEL maintainer="Stone <github.com/magicst0ne>"

COPY --from=builder /root/mosdns/mosdns /usr/bin/

RUN apk add --no-cache ca-certificates \
	&& mkdir /etc/mosdns
ADD entrypoint.sh /entrypoint.sh
ADD config.yaml /config.yaml
ADD /geodata/geoip.dat /geoip.dat
ADD /geodata/geosite.dat /geosite.dat
VOLUME /etc/mosdns
EXPOSE 53/udp 53/tcp
RUN chmod +x /entrypoint.sh
CMD ["sh", "/entrypoint.sh"]
