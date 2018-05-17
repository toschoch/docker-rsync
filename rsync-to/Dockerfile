FROM openjdk:8-jre-alpine

MAINTAINER Tobias Schoch

RUN apk update && apk --no-cache add rsync inotify-tools bash

# make the data volume if not yet existing
RUN mkdir -p /data
VOLUME /data

EXPOSE 873
COPY ./run.sh /
COPY ./post /usr/bin
COPY ./post.jar /usr/bin
COPY ./watchfolder.sh /
RUN chmod +x run.sh && chmod +x /usr/bin/post && chmod +x watchfolder.sh

CMD ["./run.sh"]
