FROM alpine:latest
RUN \
  echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk add --no-cache ansible bash jq openssh aws-cli@testing && \
  pip3 install yq
