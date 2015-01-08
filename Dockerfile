FROM ubuntu:14.04.1
MAINTAINER Henning Jacobs <henning.jacobs@zalando.de>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl

# add Zalando CA
RUN curl https://static.zalando.de/ca/zalando-service.ca > /usr/local/share/ca-certificates/zalando-service.crt
RUN curl https://static.zalando.de/ca/zalando-root.ca > /usr/local/share/ca-certificates/zalando-root.crt
RUN update-ca-certificates
