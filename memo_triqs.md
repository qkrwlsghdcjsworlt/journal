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








