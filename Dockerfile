FROM quay.io/nordstrom/baseimage-ubuntu:16.04
MAINTAINER Nordstrom Platform Team "techk8s@nordstrom.com"

ENV HELM_TARBALL helm-v2.2.0-linux-amd64.tar.gz
ADD https://storage.googleapis.com/kubernetes-helm/${HELM_TARBALL} .
RUN tar xvzf $HELM_TARBALL
ENV PATH=/linux-amd64/:$PATH
RUN helm init --client-only
RUN rm $HELM_TARBALL
