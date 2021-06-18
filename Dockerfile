FROM bash

RUN mkdir /data
COPY *.sh /

ENTRYPOINT /agent-download.sh
