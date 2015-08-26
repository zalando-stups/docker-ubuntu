FROM ubuntu:15.04
MAINTAINER Zalando SE

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y language-pack-en curl

# set locale
ENV LANG=en_US.UTF-8

# add Zalando CA
RUN curl https://static.zalando.de/ca/zalando-service.ca > /usr/local/share/ca-certificates/zalando-service.crt
RUN curl https://static.zalando.de/ca/zalando-root.ca > /usr/local/share/ca-certificates/zalando-root.crt

# add AWS RDS CA bundle
RUN mkdir /tmp/rds-ca && \
    curl http://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem > /tmp/rds-ca/aws-rds-ca-bundle.pem
# split the bundle into individual certs (prefixed with xx)
# see http://blog.swwomm.com/2015/02/importing-new-rds-ca-certificate-into.html
RUN cd /tmp/rds-ca && csplit -sz aws-rds-ca-bundle.pem '/-BEGIN CERTIFICATE-/' '{*}'
RUN for CERT in /tmp/rds-ca/xx*; do mv $CERT /usr/local/share/ca-certificates/aws-rds-ca-$(basename $CERT).crt; done

RUN update-ca-certificates
