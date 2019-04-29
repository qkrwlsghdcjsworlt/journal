---
title: "memo for ELK"
mainfont: NanumGothic
output:
  html_document: default
  pdf_document:
    latex_engine: xelatex
  word_document: default
---

### elk-tutorial

[https://sites.google.com/site/tinykpoint/elk-tutorial](https://sites.google.com/site/tinykpoint/elk-tutorial)


### libxc 설치


이 링크[http://www.tddft.org/programs/libxc/download/](http://www.tddft.org/programs/libxc/download/) 에서 **최신 버전** libxc 를 다운 받는다.


다음과 같이 configure 한다음
```
./configure CC=gcc-8 FCC=gfortran-8 CXX=c++-8 FC=gfortran-8 
```

make 하면
```
make
```


`src` 폴더 안에 숨은 폴더 `.libs` 가 생성되고 그안에 `libxc.a` 와 `libxcf90.a` 파일이 있다.

```
libxc-xx.xx.xx/src/.libs
```

`libxc.a` 와 `libxcf90.a` 파일을 `elk/src` 폴더로 복사한다.

그리고 make.inc 파일에는 

```
SRC_libxc = libxcifc_stub.f90
LIB_libxc = libxcf90.a libxc.a
SRC_libxc = libxc_funcs.f90 libxc.f90 libxcifc.f90
```
세개항목 모두 uncomments 한다.





설치후 PATH를 지정해주면 terminal 에서 쉽게 실행할 수 있다. 

```
export OMP_NUM_THREADS=4
export PATH=$PATH:/Users/parkjinhong/_src/_ELK/elk-5.2.14/src
export PATH=$PATH:/Users/parkjinhong/_src/_ELK/elk-5.2.14/utilities/elk-bands


```
