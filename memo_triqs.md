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

```
cmake -DCMAKE_INSTALL_PREFIX=path_to_install_directory ../triqs.src
```


이것이 기본 cmake 명령어.

miniconda 를 설치하고 (/Users/parkjinhong/miniconda2/bin/python) 을 python interpreter로 설정하는데,

/Users/parkjinhong/Dropbox/2-study/my_project/Triqs/triqs.build/CMakeCache.txt 에서

PYTHON_INTERPRETER:UNINITIALIZED=/Users/parkjinhong/miniconda2/bin/python 으로 직접수정해주자.






