FROM alpine:3.7

MAINTAINER Tobias Schoch

RUN apk update && apk --no-cache add rsync

# make the data volume if not yet existing
RUN mkdir -p /data
VOLUME /data

EXPOSE 873
COPY ./run.sh /
RUN chmod +x run.sh

ENTRYPOINT ["./run.sh"]
