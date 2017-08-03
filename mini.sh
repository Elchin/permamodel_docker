mkdir mini && cd mini

curl https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -o miniconda.sh

bash ./miniconda.sh -f -b -p $(pwd)/conda

PATH=$(pwd)/conda/bin:$PATH
conda install -y ipython  # miniconda doesn't come with ipython

conda install -y nose
conda install -y numpy

git clone https://github.com/permamodel/permamodel.git
cd permamodel
python setup.py develop
