#!/bin/sh
# remove assets which are not needed in production
# this only makes sense when "docker-squash" is used afterwards!
rm -fr /usr/share/doc/* /usr/share/man/* /usr/share/locale/?? /usr/share/locale/??_?? \
       /usr/share/icons/* /usr/share/sounds/* \
       /var/lib/apt/* \
       /tmp/*
