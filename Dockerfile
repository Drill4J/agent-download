FROM busybox

RUN mkdir /data
COPY *.sh /

ENTRYPOINT ls /data
