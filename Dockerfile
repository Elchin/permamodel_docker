FROM ubuntu:16.04
MAINTAINER elchin.jafarov@gmail.com

ARG PLEX_PASS='false'
ARG PLEX_TOKEN=''

#RUN git clone <the model code>
RUN  apt-get -q update && \
  apt-get -qy dist-upgrade && \
  apt-get install -qy curl

RUN  curl https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -o miniconda.sh

ENV EXAMPLE

CMD ['start.sh']
