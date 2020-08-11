FROM python:3.7.7-alpine3.12

ENV HELM_LATEST_VERSION v3.2.4
ENV BASE_URL="https://get.helm.sh"
ENV TAR_FILE="helm-v${VERSION}-linux-amd64.tar.gz"
ENV PATH="/root/.local/bin:$PATH"
ENV PYTHONIOENCODING=UTF-8


RUN apk add -U ca-certificates git curl jq  bash && \
    curl -L ${BASE_URL}/${TAR_FILE} |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64 && \
    pip install awscli && \
    rm /var/cache/apk/*
    
RUN helm plugin install https://github.com/zendesk/helm-secrets

RUN  rm -f /bin/sh && ln -sfT /bin/bash /bin/sh

RUN helm version
