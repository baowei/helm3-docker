FROM python:3.7.7-slim-stretch

ENV HELM_LATEST_VERSION v3.2.3
ENV PATH="/root/.local/bin:$PATH"
ENV PYTHONIOENCODING=UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
	ca-certificates \
	curl \
	&& rm -rf /var/lib/apt/lists/*
	
RUN curl -o helm.tar.gz https://get.helm.sh/helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz && \
        tar -xvf helm.tar.gz && \
        mv linux-amd64/helm /usr/local/bin && \
        chmod +x /usr/local/bin/helm && \
        rm -rf linux-amd64 && \
        rm helm.tar.gz
	
RUN pip install awscli
	

RUN helm version
