FROM golang:1-alpine as build
WORKDIR /go/selenium_grid_exporter
COPY . .

ARG TARGETOS TARGETARCH
RUN GOOS=$TARGETOS GOARCH=$TARGETARCH CGO_ENABLED=0 GO111MODULE=on go build -o /selenium_grid_exporter .

FROM alpine:3
LABEL maintainer "AJ <aj@48k.io>"
COPY --from=build /selenium_grid_exporter /usr/bin/selenium_grid_exporter

EXPOSE 8080
ENTRYPOINT ["/usr/bin/selenium_grid_exporter"]
