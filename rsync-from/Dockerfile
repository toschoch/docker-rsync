FROM alpine:3.7

MAINTAINER Tobias Schoch

RUN apk update && apk --no-cache add rsync

# make the data volume if not yet existing
RUN mkdir -p /data
VOLUME /data

COPY ./upload.sh /

# add crontab line in cron file
COPY ./cron /etc/cron
RUN crontab /etc/cron \
	&& chmod +x /upload.sh

# grap cron output
CMD ["/usr/sbin/crond", "-f", "-l", "8"]
