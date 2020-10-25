FROM alpine:latest
LABEL maintainer="Mislav Cimpersak"

RUN apk add --update bash curl jq python3 python3-dev py3-pip

RUN pip3 install awscli

RUN cd /usr/local/bin \
    && curl -k -sS -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.13/2020-09-18/bin/linux/amd64/kubectl \
    && chmod 755 /usr/local/bin/kubectl

RUN curl -L https://get.helm.sh/helm-v3.3.4-linux-amd64.tar.gz | tar xz && mv linux-amd64/helm /usr/local/bin/helm && rm -rf linux-amd64

RUN cd /usr/local/bin \
    && curl -k -sS -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.8/2020-09-18/bin/darwin/amd64/aws-iam-authenticator \
    && chmod 755 /usr/local/bin/aws-iam-authenticator

CMD /bin/bash
