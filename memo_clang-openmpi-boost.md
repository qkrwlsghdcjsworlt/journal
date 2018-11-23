---
title: "memo for clang + openmpi + boost + boost mpi"
mainfont: NanumGothic
output:
  html_document: default
  pdf_document:
    latex_engine: xelatex
  word_document: default
---

build 할 때 가장 중요한 것은 같은 컴파일러로 라이브러리를 build 하는 것이다. 예를 들어 clang 으로 parallel 라이브러리(openmpi or mpich)를 build 했다면 boost 라이브러리 또한 clang 으로 build 해야된다. 만약에 clang 으로 build 한 parallel 라이브러리 위에 gcc 로 boost 라이브러리를 build하려면 에러가 난다.

목표는 boost+mpi 라이브러리 를 mac 에 설치하는 것이다. llvm clang 으로 parallel 라이브러리랑 boost 라이브러리를 설치하려고 한다. 이에 대한 메모를 남겨본다.

boost 설치시 참고 페이지  
[https://solarianprogrammer.com/2018/08/07/compiling-boost-gcc-clang-macos/](https://solarianprogrammer.com/2018/08/07/compiling-boost-gcc-clang-macos/)

[http://stellar.cct.lsu.edu/files/hpx_0.9.5/html/hpx/tutorial/getting_started/macos_installation.html](http://stellar.cct.lsu.edu/files/hpx_0.9.5/html/hpx/tutorial/getting_started/macos_installation.html)


***

#### llvm clang 설치

```
brew install --with-toolchain llvm
```

이렇게 하면 
```
/usr/local/Cellar/llvm/7.0.0/Toolchains/LLVM7.0.0.xctoolchain/usr/
```
아래에 `bin` `lib` `include` 폴더가 설치된다.

`clang-7` 에 대한 flag 는

```
LDFLAGS="-L/usr/local/Cellar/llvm/7.0.0/Toolchains/LLVM7.0.0.xctoolchain/usr/lib -Wl,-rpath,/usr/local/Cellar/llvm/7.0.0/Toolchains/LLVM7.0.0.xctoolchain/usr/lib"
```

```
CPPFLAGS="-I/usr/local/Cellar/llvm/7.0.0/Toolchains/LLVM7.0.0.xctoolchain/usr/include -I/usr/local/Cellar/llvm/7.0.0/Toolchains/LLVM7.0.0.xctoolchain/usr/include/c++/v1/"
```
가 되겠다.

***

#### openmpi 설치

clang을 설치했으니 이것으로 openmpi 를 설치하자.

설치는 ~/openmpi 폴더를 만들어서 설치하고자 한다.

```
./configure CC=/usr/local/Cellar/llvm/7.0.0/Toolchains/LLVM7.0.0.xctoolchain/usr/bin/clang-7 CXX=/usr/local/Cellar/llvm/7.0.0/Toolchains/LLVM7.0.0.xctoolchain/usr/bin/clang++ CPP=/usr/local/Cellar/llvm/7.0.0/Toolchains/LLVM7.0.0.xctoolchain/usr/bin/clang-cpp FCC=gfortran-8 F77=gfortran-8 F90=gfortran-8 --enable-mpi-thread-multiple --prefix=/Users/parkjinhong/local LDFLAGS="-L/usr/local/Cellar/llvm/7.0.0/Toolchains/LLVM7.0.0.xctoolchain/usr/lib -Wl,-rpath,/usr/local/Cellar/llvm/7.0.0/Toolchains/LLVM7.0.0.xctoolchain/usr/lib" CPPFLAGS="-I/usr/local/Cellar/llvm/7.0.0/Toolchains/LLVM7.0.0.xctoolchain/usr/include -I/usr/local/Cellar/llvm/7.0.0/Toolchains/LLVM7.0.0.xctoolchain/usr/include/c++/v1/"
```

```
make

make install 
```

을 수행하면 

```
--prefix=/Users/parkjinhong/local
```
여기에 `bin` `lib` `include` 가 설치된다.


***

#### boost mpi 설치

먼저 bootstrap 을 다음과 같이 실행한다.

```
./bootstrap.sh --prefix=/Users/parkjinhong/local/boost --with-toolset=clang
```

`--prefix` 에 나와 있듯이 `/Users/parkjinhong/local/boost` 에 boost mpi 를 설치하려고 한다.

`project-config.jam` 파일을 다음과 같이 수정한다.


```
if ! clang in [ feature.values <toolset> ]
{
    using clang
     : "/usr/local/Cellar/llvm/7.0.0/Toolchains/LLVM7.0.0.xctoolchain/usr/bin/clang++" ; 
}

project : default-build <toolset>clang ;

# Python configuration
import python ;
if ! [ python.configured ]
{
    using python : 3.6 : /Users/parkjinhong/anaconda3 ;
}
using mpi : /Users/parkjinhong/local/bin/mpicc ;

```

다음 순서로 build 하면
```
./b2 clean

./b2 toolset=clang cxxflags="-stdlib=libc++" linkflags="-stdlib=libc++"

./b2 install
```

`/Users/parkjinhong/local/boost` 에 boost 라이브러리가 설치된다.



