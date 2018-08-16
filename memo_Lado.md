---
title: "memo for quantum-honeycomp"
mainfont: NanumGothic
output:
  html_document: default
  pdf_document:
    latex_engine: xelatex
  word_document: default
---





***
anaconda3 설치하기

`brew install gcc`


기존의 path 를 수정하기

```
# export PATH="/usr/local/opt/llvm/bin:$PATH"

# export PATH="/usr/local/opt/llvm/bin:$PATH"
# export CC=/opt/local/bin/mpicc-mpich-mp
# export CXX=/opt/local/bin/mpicxx-mpich-mp
# export LDFLAGS="-L/opt/local/lib/mpich-mp"
# export CPPFLAGS="-I/opt/local/include/mpich-mp"
export PATH="/usr/bin:$PATH"
# export FC=/opt/local/bin/mpif77-mpich-mp
# export FC90=/opt/local/bin/mpif90-mpich-mp
export PATH="/Users/parkjinhong/anaconda3/bin:$PATH"
export PATH="/Users/parkjinhong/Dropbox/_project/_Lado/quantum-honeycomp-master/quantum-honeycomp-0.14.7/bin:$PATH"
export QHROOT="/Users/parkjinhong/Dropbox/_project/_Lado/quantum-honeycomp-master/quantum-honeycomp-0.14.7"
```


***

