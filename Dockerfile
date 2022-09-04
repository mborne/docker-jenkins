FROM jenkins/jenkins:lts

ENV DOCKER_URL=unix:///var/run/docker.sock

USER root

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    gosu \
 && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
 && add-apt-repository \
   "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable" \
 && apt-get update \
 && apt-get install -y --no-install-recommends docker-ce-cli docker-compose-plugin \
 && apt-get clean

USER jenkins
RUN jenkins-plugin-cli --plugins "docker-workflow"

USER root
COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/usr/bin/tini", "--", "/docker-entrypoint.sh"]

