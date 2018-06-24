FROM node:8

LABEL Maintainer="kekel87 <https://github.com/kekel87>" \
    Description="Docker for Angular CI (with gitlab)."

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    apt-transport-https \
    gnupg2 \
    software-properties-common \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && echo 'deb [arch=amd64] https://download.docker.com/linux/debian jessie stable' > /etc/apt/sources.list.d/docker.list \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/chrome.list \
    && wget -q -O - http://mozilla.debian.net/archive.asc | apt-key add - \
    && echo 'deb http://http.debian.net/debian unstable main' > /etc/apt/sources.list.d/debian-mozilla.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    docker-ce \
    libc6-dev \
    google-chrome-stable \
    bzip2 \
    zip \
    && apt-get install -y --no-install-recommends -t unstable firefox \
    && rm -rf /var/lib/apt/lists/*

ENV CHROME_BIN /usr/bin/google-chrome
