FROM quay.io/nordstrom/baseimage-ubuntu:16.04
MAINTAINER Nordstrom Platform Team "techk8s@nordstrom.com"

ENV HELM_TARBALL helm-v2.2.0-linux-amd64.tar.gz
ADD https://storage.googleapis.com/kubernetes-helm/$HELM_TARBALL .
RUN tar xvzf $HELM_TARBALL
ENV PATH=/linux-amd64/:$PATH
RUN helm init --client-only
RUN rm $HELM_TARBALL

ENV STABLE_REPO_URL http://nordstrom-charts.s3-website-us-west-2.amazonaws.com
ENV INCUBATOR_REPO_URL http://nordstrom-charts-incubator.s3-website-us-west-2.amazonaws.com
ENV INTERNAL_REPO_URL http://nordstrom-charts-internal.s3-website-us-west-2.amazonaws.com
RUN helm repo add nordstrom ${STABLE_REPO_URL}
RUN helm repo add internal ${INTERNAL_REPO_URL}
RUN helm repo add incubator ${INCUBATOR_REPO_URL}

