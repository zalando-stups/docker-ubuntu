=================
Ubuntu Base Image
=================

This Docker base image contains Ubuntu 16.04 and the Zalando CA certificate.
Versions of this image will be immutable, i.e. there is no "latest" tag, but instead version numbers are incremented like::

    <UBUNTU_VERSION>-<COUNTER> (example: "16.04-1")

Build and test the image like that:

.. code-block:: bash

    $ docker build -t ubuntu:16.04-local .
    $ sed 's/UNTESTED/ubuntu:16.04-local/g' Dockerfile.test > Dockerfile.test-gen
    $ docker build -t ubuntu-test:16.04-local -f Dockerfile.test-gen .
    $ docker run ubuntu-test:16.04-local

You can find the `latest Ubuntu Docker image in our open source registry`_.

.. _latest Ubuntu Docker image in our open source registry: https://registry.opensource.zalan.do/teams/stups/artifacts/ubuntu/tags
