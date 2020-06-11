FROM python:3.7.7-alpine3.12

ENV HELM_LATEST_VERSION v3.2.2
ENV PATH="/root/.local/bin:$PATH"
ENV PYTHONIOENCODING=UTF-8


RUN apk add -U ca-certificates git curl jq && \
    apk add -U -t deps curl && \
    curl -o helm.tar.gz https://get.helm.sh/helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz && \
    tar -xvf helm.tar.gz && \
    mv linux-amd64/helm /usr/local/bin && \
    chmod +x /usr/local/bin/helm && \
    rm -rf linux-amd64 && \
    rm helm.tar.gz && \
    pip install awscli && \
    rm /var/cache/apk/*

RUN helm version
