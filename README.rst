=================
Ubuntu Base Image
=================

This Docker base image contains Ubuntu 15.04 and the Zalando CA certificate.
Versions of this image will be immutable, i.e. there is no "latest" tag, but instead version numbers are incremented like::

    <UBUNTU_VERSION>-<COUNTER> (example: "15.04-1")

Build and test the image like that:

.. code-block:: bash

    $ docker build -t docker-ubuntu:15.10-local .
    $ sed 's/UNTESTED/docker-ubuntu:15.10-local/g' Dockerfile.test > Dockerfile.test-gen
    $ docker build -t docker-ubuntu-test:15.10-local -f Dockerfile.test-gen .
    $ docker run docker-ubuntu-test:15.10-local

You can find the `latest Ubuntu Docker image in our open source registry`_.

.. _latest Ubuntu Docker image in our open source registry: https://registry.opensource.zalan.do/teams/stups/artifacts/docker-ubuntu/tags
