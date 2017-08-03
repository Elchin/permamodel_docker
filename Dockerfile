FROM ubuntu:16.04
MAINTAINER elchin.jafarov@gmail.com

RUN  apt-get -q update && \
  apt-get -qy dist-upgrade 
RUN apt-get install -qy curl git
RUN apt-get install -qy vim cmake gfortran build-essential

# install python dependencies
#RUN mkdir mini && cd mini

#RUN curl https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -o miniconda.sh

#RUN bash ./miniconda.sh -f -b -p $(pwd)/conda

#RUN PATH=$(pwd)/conda/bin:$PATH
#RUN conda install -y ipython  # miniconda doesn't come with ipython

#RUN conda install -y nose
#RUN conda install -y numpy

#RUN git clone https://github.com/permamodel/permamodel.git
#RUN cd permamodel
#RUN python setup.py develop
ADD ./mini.sh /mini.sh
RUN chmod u+x /mini.sh

ADD ./start.sh /start.sh
RUN chmod u+x /start.sh

# build info
RUN echo "Timestamp:" `date --utc` | tee /image-build-info.txt

CMD ["/start.sh"]
