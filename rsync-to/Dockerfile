FROM alpine:3.7

MAINTAINER Tobias Schoch

RUN apk update && apk --no-cache add rsync inotify-tools

# make the data volume if not yet existing
RUN mkdir -p /data
VOLUME /data

EXPOSE 873
COPY ./run.sh /
COPY ./post /usr/bin
RUN chmod +x run.sh && chmod +x /usr/bin/post

ENTRYPOINT ["./run.sh"]
