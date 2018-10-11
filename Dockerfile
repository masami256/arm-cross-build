FROM docker.io/arm64v8/fedora

RUN mkdir /src && \
dnf install -y gcc make file

WORKDIR /src

CMD /bin/bash
