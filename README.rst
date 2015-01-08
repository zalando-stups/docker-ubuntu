=================
Ubuntu Base Image
=================

This Docker base image contains Ubuntu 14.04 LTS and the Zalando CA certificate.
Versions of this image will be immutable, i.e. there is no "latest" tag, but instead version numbers are incremented like::

    <UBUNTU_LTS_VERSION>-<COUNTER> (example: "14.04.1-1")

Build the Docker image and squash it with a single command:

.. code-block:: bash

    $ ./build.sh

You can find the `latest Ubuntu Docker image on Docker Hub`_.

.. _latest Ubuntu Docker image on Docker Hub: https://registry.hub.docker.com/u/zalando/ubuntu/
