FROM 941333304678.dkr.ecr.us-east-1.amazonaws.com/docker-hub/cljkondo/clj-kondo:2026.01.19

ENV REVIEWDOG_VERSION=v0.12.0

RUN apt-get update && apt-get -y install git

RUN curl -sfL https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

COPY lint.sh /lint.sh

ENTRYPOINT ["bash", "/lint.sh"]
