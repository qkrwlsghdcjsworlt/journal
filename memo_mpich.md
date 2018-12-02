---
title: "memo for mpich"
mainfont: NanumGothic
output:
  html_document: default
  pdf_document:
    latex_engine: xelatex
  word_document: default
---

>
./configure CC=gcc-8 FCC=gfortran-8 CXX=c++-8 FC=gfortran-8 --enable-mpi-thread-multiple

>
make all

>
make install