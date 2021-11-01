---
title: "memo for triqs"
mainfont: NanumGothic
output:
  html_document: default
  pdf_document:
    latex_engine: xelatex
  word_document: default
---





***



DMFT 계산을 할 수 있는 TRIQS 를 설치하면서 몇가지 메모를 한다. 


***



## 성공 (2021. 10. 28)

가장 속 편한 방법은 ubuntu 에 설치하면 쉽게 설치할 수 있음.


    sudo apt-get install cmake git hdf5-tools jupyter-notebook\
        libboost-dev libgmp-dev libfftw3-dev libhdf5-dev \
        python3-dev python3-mako python3-matplotlib \
        python3-mpi4py python3-numpy python3-scipy

를 기본적으로 설치한다.


    #!/bin/bash

    # Set this variable to your desired install directory
    INSTALL_PREFIX=$(pwd)/install

    # Set the number of cores for the compilation
    NCORES=4

    # Clone the git repository of triqs
    git clone https://github.com/TRIQS/triqs triqs.src

    # Use cmake to configure the triqs build process    
    mkdir -p triqs.build && cd triqs.build
    cmake ../triqs.src -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX

    # Build, test and install triqs
    make -j$NCORES && make test && make install
    cd ../

    # Load the triqs installation into your environment
    source $INSTALL_PREFIX/share/triqsvars.sh

    echo 
    echo "If you want to automatically load triqs into your environment,"
    echo "please add the following line to your ~/.bash_profile (or ~/.zprofile):"
    echo "source $INSTALL_PREFIX/share/triqsvars.sh"


여기까지 에러메세지없이 설치가 끝남.


>
    gedit ~/.bashrc

    source $INSTALL_PREFIX/share/triqsvars.sh

추가하면 됨.

### dft-tools

    git clone https://github.com/TRIQS/dft_tools dft_tools.src
    

__여기에서 unstable version 의 sumk_dft.py, elk.py, elkconverter 폴더를 복사해야된다.__ 

https://github.com/TRIQS/dft_tools/tree/unstable  에서 
/python/triqs_dft_tools/sumk_dft.py,
/python/triqs_dft_tools/converters/elktools,
/python/triqs_dft_tools/converters/elk.py 를 복사해서
위 소스코드 폴더에 넣는다. 

    mkdir dft_tools.build && cd dft_tools.build
    cmake ../dft_tools.src
    make
    make test
    make install
    
### CTHYB (impurity solver)

    git clone https://github.com/TRIQS/cthyb cthyb.src
    mkdir cthyb.build && cd cthyb.build
    cmake ../cthyb.src -DMeasureG2=OFF
    make
    make test
    make install
    
    



-------
#### 성공함. (아주 예전의 성공.  이것은 기록으로 남겨둠.)

source code 로부터 install 하는데 성공했다.

설치중 문제는 `h5py` 를 설치할 때 주의가 필요하다. 

pip install h5py

을 사용하면 binary 로 설치가 되는데, pip 에서 제공하는 HDF5 버전이랑 컴퓨터에 깔려있는 HDF5 버전이 호환되지 않아서 문제가 생긴다. 

그래서 h5py 홈페이지 가서 source code 를 다운 받아서 설치해야된다. 

`HDF5` 와 `mpi` 를 설정할 것인지 말것인지 하는 옵션이 있다. 

이때

HDF5 는 설정하고 mpi 설정하지 않으면 잘 설치가 된다. 

`jupyter 설정`

/Users/parkjinhong/Library/Jupyter/kernels/python2/kernel.json

/Users/parkjinhong/.jupyter/jupyter_notebook_config.py 

여기에 설정이 있음.

하지만 그런 설정 필요없이

```
ipytriqs_notebook 
```

을 쓰는게 맘편하다. 



***



#### 성공함.

2018/05/16 (수)  

* 결국이 이것도 docker 로 설치해보자.

docker (ubuntu) + miniconda 로 설치하려고 했는데 실패. python 을 설치할 것이 아니라, 처음 부터 miniconda를 설치해보자.

--> 성공했다. 순서는


```
docker pull ubuntu
```

```
docker run -t -i ubuntu /bin/bash
```

```
apt-get update
```

```
apt-get install libboost-all-dev cmake git g++ libgfortran3 gfortran openmpi-bin openmpi-common \
     openmpi-doc libopenmpi-dev libblas-dev liblapack-dev libfftw3-dev libgmp-dev \
     hdf5-tools libhdf5-serial-dev python-h5py python-dev python-numpy python-scipy python-jinja2 \
     python-virtualenv python-matplotlib python-tornado python-zmq python-mpi4py python-mako \
```

```
apt-get install python-notebook
```

```
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 --slave /usr/bin/g++ g++ /usr/bin/g++-7
```


이 순서로 하고

```
git clone https://github.com/TRIQS/triqs.git triqs.src
```

```
mkdir triqs.build && cd triqs.build
```

```
cmake -DCMAKE_INSTALL_PREFIX=path_to_install_directory ../triqs.src
```

```
make
make test
make install
```

하면 설치된다.

문제는 $Display  설정이 되어있지 않다는 점인데, 좀 더 알아봐야된다.



***

***

***

#### 실패한 것 기록

이것이 기본 cmake 명령어.

```
cmake -DCMAKE_INSTALL_PREFIX=path_to_install_directory ../triqs.src
```

***

기존에 설치된 python은 h5py의 hdf5 버전이 c-compiler hdf5 버전과 달라서 cmake 가 되지 않는다. 그래서 기존의 python이 아니라 miniconda를 설치해야된다.  

***

miniconda 를 `(/Users/parkjinhong/miniconda2/bin/python)` 에 설치한다.

다음 python interpreter로 miniconda python을 설정하는데 그방법은

/Users/parkjinhong/Dropbox/2-study/my_project/Triqs/triqs.build/CMakeCache.txt 에서

PYTHON_INTERPRETER:UNINITIALIZED=/Users/parkjinhong/miniconda2/bin/python 으로 직접 수정한다.


***

Using the clang compiler 이라는 부분에서 cxx clang 을 추가하는 명령어를 찾았다.

```
CXX=clang++ cmake -DCMAKE_INSTALL_PREFIX=path_to_install_directory ../triqs.src
```
이것으로 compile 했는데, make test 하면 전부 compile 된것은 아니였다. 절반만 compile 되었다.

어쨌든 make install 할 수 있는데, 이렇게 하면 triqs 는 설치된다.

그때의 폴더는 `triqs.build/path_to_install_directory` 이고 명령어는   `triqs.build/path_to_install_directory/bin/pytriqs` 이다.


***
tutorial 을 해보면 첫번째 Green's function tutorial 은 잘 실행이 되는데,  사각격자의 tight-binding model은 실해되지 않는다. ㅜㅜ



***

혹시 실행안되는 이유가 clang 을 써서 그렇지 않을까?  gcc compiler 를 쓰면 어떨지 궁금하다.






