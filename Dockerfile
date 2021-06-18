FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
  wget \
  unzip \
  cron \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /data-download
RUN mkdir /data
COPY check-file-exist.sh /
RUN chmod +x /check-file-exist.sh
COPY agent-download.sh /
RUN chmod +x /agent-download.sh
RUN /agent-download.sh

# Copy copy-files-cron file to the cron.d directory
COPY copy-files-cron /etc/cron.d/copy-files-cron
 
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/copy-files-cron

# Apply cron job
RUN crontab /etc/cron.d/copy-files-cron
 
# Create the log file to be able to run tail
RUN touch /var/log/cron.log
 
# Run the command on container startup
CMD cron && tail -f /var/log/cron.log
