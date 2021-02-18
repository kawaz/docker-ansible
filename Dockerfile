FROM alpine:3.13.2
RUN \
  apk add --no-cache ansible openssh-client jq bash py3-pip rsync ca-certificates && \
  pip3 --no-cache-dir install yq awscli
