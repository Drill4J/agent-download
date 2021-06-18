FROM nginx

RUN mkdir /data
COPY agent-download.sh /
WORKDIR /data
RUN chmod +x agent-download.sh
RUN agent-download.sh

# ENTRYPOINT /agent-download.sh
# CMD ["bash", "/agent-download.sh"]
CMD ["nginx", "-g", "daemon off;"]
