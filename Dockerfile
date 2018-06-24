FROM node:8-alpine

LABEL Maintainer="kekel87 <https://github.com/kekel87>" \
  Description="Docker for Angular CI (with gitlab) base on Alpine Linux."

ARG NG_CLI_VERSION=latest

RUN apk --update --no-cache add \
  docker \
  git \
  yarn \
  git \
  udev \
  ttf-freefont \
  chromium-chromedriver \
  chromium \
  && rm -rf /tmp/* /var/cache/apk/*

ENV CHROME_BIN /usr/bin/chromium-browser

WORKDIR /app