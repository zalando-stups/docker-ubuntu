FROM ubuntu:18.04
MAINTAINER Zalando SE

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y --no-install-recommends \
          language-pack-en \
          ca-certificates \
          curl \
          lsb-release \
      && apt-get purge -y \
          krb5-locales \
      && apt-get clean -y \
      && apt-get autoremove -y \
      && rm -rf /tmp/* /var/tmp/* \
      && rm -rf /var/lib/apt/lists/*

# set locale
ENV LANG=en_US.UTF-8

# add Zalando CA
RUN curl https://secure-static.ztat.net/ca/zalando-service.ca > /usr/local/share/ca-certificates/zalando-service.crt
RUN curl https://secure-static.ztat.net/ca/zalando-root.ca > /usr/local/share/ca-certificates/zalando-root.crt

# add AWS RDS CA bundle
RUN mkdir /tmp/rds-ca && \
    curl https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem > /tmp/rds-ca/aws-rds-ca-bundle.pem
# split the bundle into individual certs (prefixed with xx)
# see http://blog.swwomm.com/2015/02/importing-new-rds-ca-certificate-into.html
RUN cd /tmp/rds-ca && csplit -sz aws-rds-ca-bundle.pem '/-BEGIN CERTIFICATE-/' '{*}'
RUN for CERT in /tmp/rds-ca/xx*; do mv $CERT /usr/local/share/ca-certificates/aws-rds-ca-$(basename $CERT).crt; done

RUN update-ca-certificates

# remove documentation
COPY purge.sh /usr/local/bin/
RUN purge.sh
