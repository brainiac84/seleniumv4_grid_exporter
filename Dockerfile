FROM golang:1.12-alpine as build
WORKDIR /go/selenium_grid_exporter
COPY . .
RUN go build -o /selenium_grid_exporter .

FROM alpine:3
LABEL maintainer "AJ <aj@48k.io>"
COPY --from=builder /selenium_grid_exporter /usr/bin/selenium_grid_exporter

EXPOSE 8080
ENTRYPOINT ["/usr/bin/selenium_grid_exporter"]
