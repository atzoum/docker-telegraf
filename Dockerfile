FROM golang:1.8.1
WORKDIR /go/src/github.com/influxdata/telegraf
RUN git clone --depth 1 --branch dropwizard https://github.com/atzoum/telegraf.git /go/src/github.com/influxdata/telegraf
RUN make prepare build-for-docker && ./telegraf --version && ls -lah

FROM telegraf:1.3.0-alpine
COPY --from=0 /go/src/github.com/influxdata/telegraf/telegraf /usr/bin/