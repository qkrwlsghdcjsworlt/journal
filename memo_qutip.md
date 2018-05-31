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

#### 실행

```
source activate qutip-env
```

```
pythonw `which ipython`
```


***

#### 설치순서


1. env (Qutip) 설치  
```
conda create -n qutip-env python=3
```

1. env activate  
```
source activate qutip-env
```


1. conda-forge repository 추가  
```
conda config --append channels conda-forge
```


1. Qutip 설치  
```
conda install qutip
```

1. 각종 패키지 설치  
```
conda install matplotlib nose jupyter notebook spyder
```


1. pythonw (framework) 설치  
```
conda install python.app
```

