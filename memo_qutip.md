---
title: "memo for Qutip"
mainfont: NanumGothic
output:
  html_document: default
  pdf_document:
    latex_engine: xelatex
  word_document: default
---





***

Quantum dots 에 대한 다양한 계산이 가능한 Qutip 설치과정이다. 


***

홈페이지.  

[http://qutip.org/index.html](http://qutip.org/index.html)


***

실행



***

#### 설치순서

```
conda create -n qutip-env python=3
```


```
source activate qutip-env
```

```
conda config --append channels conda-forge
```

```
conda install qutip
```


```
conda install matplotlib nose jupyter notebook spyder
```

```
conda install python.app
```

