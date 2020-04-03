FROM alpine:latest
RUN \
  apk add --no-cache ansible openssh-client jq bash && \
  pip3 --no-cache-dir install yq awscli
