FROM alpine:3.11.6

COPY deps /tmp/deps
RUN apk add --no-cache --virtual .runtime freetype libgcc libgfortran libpng libstdc++ libxml2 libxslt musl openblas python3 zlib \
    && apk add --no-cache --virtual .build bash build-base freetype-dev gcc gfortran git libpng-dev libxml2-dev libxslt-dev linux-headers openblas-dev python3-dev wget zlib-dev \
    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && pip3 install --no-cache-dir -r /tmp/deps/dragnet/requirements.txt \
    && pip3 install --no-cache-dir -r /tmp/deps/requirements.txt \
    && rm /usr/include/xlocale.h \
    && apk del .build \
    && rm -rf /tmp/deps
