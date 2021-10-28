FROM alpine

RUN apk update && apk upgrade && apk add bash jq wget

ARG HONEYMARKER_VERSION=0.2.1
RUN wget https://github.com/honeycombio/honeymarker/releases/download/v${HONEYMARKER_VERSION}/honeymarker-linux-amd64 \
  && chmod +x ./honeymarker-linux-amd64 \
  && mv ./honeymarker-* /usr/local/bin/honeymarker

RUN mkdir -p /opt/resource
COPY ./concourse/* /opt/resource/
CMD ["honeymarker --help"]

