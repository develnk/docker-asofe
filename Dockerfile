FROM debian:stretch-slim
MAINTAINER develnk "develnk@gmail.com"

ENV ASOFE_URL="https://github.com/TheLightSide/asofe.git" \
 ASOFE_COMMIT="54a4d90d8f57e5cf2a2fa3b4f868b4fd5518aa60"

RUN apt-get autoclean && apt-get autoremove && apt-get update \
    && apt-get -qqy install --no-install-recommends build-essential \
    automake ncurses-dev curl libcurl4-openssl-dev libssl-dev libgtest-dev \
    make autoconf automake libtool git apt-utils pkg-config libc6-dev \
    libcurl3-dev libudev-dev m4 g++-multilib unzip python zlib1g-dev \
    wget ca-certificates pwgen bsdmainutils nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN cd /usr/src \
    && git clone $ASOFE_URL \
    && cd asofe \
    && git checkout $ASOFE_COMMIT \
    && ./zcutil/build.sh -j4 \
    && cd /usr/src/asofe/src \
    && /usr/bin/install -c asofe-tx asofed asofe-cli asofe-gtest -t /usr/local/bin/ \
    && cp ../zcutil/fetch-params.sh /usr/local/bin/asofe-fetch-params \
    && rm -Rf /usr/src/asofe

RUN mkdir -p /root/.asofe-params && mkdir /root/.asofe

COPY root /root

VOLUME ["/root"]

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8585
CMD ["/usr/local/bin/asofed", "-printtoconsole"]
