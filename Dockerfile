FROM node:8

LABEL Maintainer="kekel87 <https://github.com/kekel87>" \
    Description="Docker for Angular CI (with gitlab)."

# Install chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends  google-chrome-stable

ENV CHROME_BIN /usr/bin/google-chrome

# Install firefox
RUN wget -q -O - http://mozilla.debian.net/archive.asc | apt-key add - \
    && echo 'deb http://http.debian.net/debian unstable main' > /etc/apt/sources.list.d/debian-mozilla.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends libc6-dev \
    && apt-get install -y --no-install-recommends -t unstable firefox

# Required for phantom 
RUN apt-get install -y --no-install-recommends \
    bzip2 \
    zip

# Clean up 
RUN apt-get autoremove --purge -y \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/locale/* /var/cache/debconf/*-old /usr/share/doc/*
