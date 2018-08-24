# vim:set ft=dockerfile:

# VERSION 1.0
# AUTHOR:         Alexander Turcic <alex@zeitgeist.se>
# DESCRIPTION:    sslyze in a Docker container
# TO_BUILD:       docker build --rm -t zeitgeist/docker-sslyze .
# SOURCE:         https://github.com/alexzeitgeist/docker-sslyze

# Pull base image.
FROM debian:jessie
MAINTAINER Alexander Turcic "alex@zeitgeist.se"

ENV RELEASE_URL https://github.com/nabla-c0d3/sslyze/releases/download/0.11.0/sslyze-0_11-linux64.zip
ENV RELEASE_DIR /sslyze-0_11-linux64/sslyze

# Compile sslyze
RUN \
  apt-get update && \
  apt-get install -y python2.7 unzip wget && \
  wget "${RELEASE_URL}" -O sslyze.zip && \
  unzip sslyze.zip && \ 
  rm sslyze.zip && \
  apt-get -y purge unzip wget && \
  apt-get -y autoremove --purge && \
  rm -rf /var/lib/apt/lists/*

RUN \
  export uid=1000 gid=1000 && \
  groupadd --gid ${gid} user && \
  useradd --uid ${uid} --gid ${gid} --create-home user

USER user
WORKDIR ${RELEASE_DIR}

ENTRYPOINT ["/usr/bin/python2.7", "sslyze.py"]
CMD ["-h"]
