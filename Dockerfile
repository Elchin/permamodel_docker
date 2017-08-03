FROM ubuntu:16.04
MAINTAINER elchin.jafarov@gmail.com

RUN  apt-get -q update && \
  apt-get -qy dist-upgrade 
RUN apt-get install -qy curl git
RUN apt-get install -qy vim cmake gfortran build-essential

# install python dependencies
ADD ./mini.sh /mini.sh
RUN chmod u+x /mini.sh

CMD ["/mini.sh"]

ADD ./start.sh /start.sh
RUN chmod u+x /start.sh

# build info
RUN echo "Timestamp:" `date --utc` | tee /image-build-info.txt

CMD ["/start.sh"]
