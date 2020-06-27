---
title: "memo for Wannier Tool"
mainfont: NanumGothic
output:
  html_document: default
  pdf_document:
    latex_engine: xelatex
  word_document: default
---





***

makefile 에

```
f90  = gfortran-mp-9 -cpp                                              
```
를 적절하게 수정하고

```
\# blas and lapack libraries
libs = -L/opt/local/lib/ -llapack -lblas -lopenblas
```

openblas 를 추가해주면 된다.

***

	