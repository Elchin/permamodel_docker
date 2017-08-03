FROM ubuntu:16.04
MAINTAINER elchin.jafarov@gmail.com

RUN  apt-get -q update && \
  apt-get -qy dist-upgrade 
RUN apt-get install -qy curl git
#RUN curl https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -o miniconda.sh
#RUN git clone <the model code>

ENV EXAMPLE foo

ADD ./start.sh /start.sh
RUN chmod u+x /start.sh

# build info
RUN echo "Timestamp:" `date --utc` | tee /image-build-info.txt

CMD ["/start.sh"]
