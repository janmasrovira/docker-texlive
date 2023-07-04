FROM alpine:3.18.2

ARG YEAR=2023

COPY texlive.profile /home/

RUN apk add --no-cache \
    perl \
    wget \
    fontconfig \
    && /bin/true

RUN cd /home && \
    wget "https://osl.ugr.es/CTAN/systems/texlive/tlnet/install-tl-unx.tar.gz" && \
    tar xfz install-tl-unx.tar.gz --strip-components 1 && \
    perl install-tl --profile=texlive.profile && \
    rm -rf /home/* && \
    rm -rf /usr/local/texlive/$YEAR/texmf-dist/doc && \
    rm -rf /usr/local/texlive/$YEAR/texmf-dist/source && \
    /bin/true

RUN apk add --no-cache py3-pip && \
  pip3 install pygments && \
  apk del py3-pip

ENV PATH="/usr/local/texlive/$YEAR/bin/x86_64-linuxmusl:${PATH}"

CMD ["sh"]
