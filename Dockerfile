FROM ubuntu:16.04
MAINTAINER elchin.jafarov@gmail.com

RUN  apt-get -q update && \
  apt-get -qy dist-upgrade 
RUN apt-get install -qy curl git
RUN apt-get install -qy vim
RUN apt-get install -y cmake
RUN apt-get install -y gfortran
RUN apt-get install -y build-essential
RUN git clone https://github.com/permamodel/permamodel.git

ENV EXAMPLE foo

ADD ./start.sh /start.sh
RUN chmod u+x /start.sh

# build info
RUN echo "Timestamp:" `date --utc` | tee /image-build-info.txt

CMD ["/start.sh"]
