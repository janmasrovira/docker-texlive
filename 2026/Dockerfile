FROM alpine:3.23.4

ARG YEAR=2026

COPY texlive.profile /tmp/

RUN apk add --no-cache perl fontconfig py3-pygments && \
    apk add --no-cache --virtual .build-deps wget && \
    cd /tmp && \
    wget "https://texlive.info/historic/systems/texlive/$YEAR/install-tl-unx.tar.gz" && \
    tar xfz install-tl-unx.tar.gz --strip-components 1 && \
    perl install-tl --profile=texlive.profile && \
    rm -rf /tmp/install-tl* /tmp/texlive.profile /tmp/tlpkg && \
    rm -rf "/usr/local/texlive/$YEAR/texmf-dist/doc" && \
    rm -rf "/usr/local/texlive/$YEAR/texmf-dist/source" && \
    apk del .build-deps

ENV PATH="/usr/local/texlive/$YEAR/bin/x86_64-linuxmusl:${PATH}"

CMD ["sh"]
