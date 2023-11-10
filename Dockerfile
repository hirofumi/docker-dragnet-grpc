FROM alpine:3.18.4

COPY deps /tmp/deps
RUN echo 'https://dl-cdn.alpinelinux.org/alpine/v3.10/main' >> /etc/apk/repositories \
    && echo 'https://dl-cdn.alpinelinux.org/alpine/v3.10/community' >> /etc/apk/repositories \
    && apk update \
    && apk add --no-cache --virtual .runtime freetype libgcc libgfortran libpng libstdc++ libxml2 libxslt musl openblas py3-lxml=4.3.4-r0 py3-numpy=1.16.4-r1 py3-scipy=1.2.1-r4 python3=3.7.10-r0 zlib \
    && apk add --no-cache --virtual .build bash build-base freetype-dev gcc gfortran git libpng-dev libxml2-dev libxslt-dev linux-headers openblas-dev py-numpy-dev=1.16.4-r1 python3-dev=3.7.10-r0 wget zlib-dev \
    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && pip3 install --no-cache-dir -r /tmp/deps/dragnet/requirements.txt \
    && pip3 install --no-cache-dir -r /tmp/deps/requirements.txt \
    && rm /usr/include/xlocale.h \
    && apk del .build \
    && rm -rf /tmp/deps
