FROM busybox

RUN mkdir /data
COPY *.sh /

ENTRYPOINT agent-download.sh
