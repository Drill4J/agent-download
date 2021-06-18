FROM bash

RUN mkdir /data
COPY *.sh /

# ENTRYPOINT /agent-download.sh
CMD ["bash", "/agent-download.sh"]
