FROM golang:1.8.1
WORKDIR /go/src/github.com/influxdata/telegraf
RUN git clone --depth 1 --branch dropwizard https://github.com/atzoum/telegraf.git /go/src/github.com/influxdata/telegraf
RUN make prepare build-for-docker && ls -lah