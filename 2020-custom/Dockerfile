FROM alpine:3.9

COPY install-tl-unx.tar.gz texlive.profile /home/

RUN apk add --no-cache \
    perl \
    wget \
    fontconfig \
    && /bin/true

RUN cd /home && \
    tar xfz install-tl-unx.tar.gz --strip-components 1 && \
    perl install-tl --profile=texlive.profile && \
    rm -rf /home/* && \
    rm -rf /usr/local/texlive/2020/texmf-dist/doc && \
    rm -rf /usr/local/texlive/2020/texmf-dist/source && \
    /bin/true

RUN apk add --no-cache python3 && \
  pip3 install pygments && \
  apk del python3

ENV PATH="/usr/local/texlive/2020/bin/x86_64-linuxmusl:${PATH}"

CMD ["sh"]
