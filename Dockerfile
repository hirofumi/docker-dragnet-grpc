FROM alpine:3.12.0

COPY deps /tmp/deps
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.10/main' >> /etc/apk/repositories \
    && apk update \
    && apk add --no-cache --virtual .runtime freetype libgcc libgfortran libpng libstdc++ libxml2 libxslt musl openblas python3=3.7.7-r0 zlib \
    && apk add --no-cache --virtual .build bash build-base freetype-dev gcc gfortran git libpng-dev libxml2-dev libxslt-dev linux-headers openblas-dev python3-dev wget zlib-dev \
    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && pip3 install --no-cache-dir -r /tmp/deps/dragnet/requirements.txt \
    && pip3 install --no-cache-dir -r /tmp/deps/requirements.txt \
    && rm /usr/include/xlocale.h \
    && apk del .build \
    && rm -rf /tmp/deps
