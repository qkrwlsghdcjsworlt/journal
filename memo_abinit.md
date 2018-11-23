---
title: "memo for abinit"
mainfont: NanumGothic
output:
  html_document: default
  pdf_document:
    latex_engine: xelatex
  word_document: default
---



***

연구실에 있는 컴퓨터 설정이 바뀌었다. 
miniconda env 에 설치되어있는 abipy 가 anaconda3 에 env 설정 없이 설치되었다.

terminal 에서 `abinit -b`
와 `abicheck.py` 를 실행시키면 작동하는 것을 확인할 수 있다. 

```
_project/Abinit/abinit-master/tests/tutorial/Input/Work/ 
```
에 1번 튜토리얼을 진행중이다.

***

#### 실행

```
source activate abipy3.6
```


***

2018/6/03(일)  

abinit 을

```
brew tap brewsci/science
brew install abinit
```

을 통해서 설치하려고 노력했는데 실패했다. **슬프다.**


슬펐지만, 포기하지 않고 miniconda 를 통해서 설치했고, 첫번째 투토리얼 실행에 성공했다.

libnetcdf 의 버전을

```
conda install libnetcdf=4.4.1.1
```

로 설치하면 에러메세지를 해결할 수 있다.




***

2018/5/16(수)  

* mac으로 깔 생각할 게 아니라 docker 로 설치하자. 그럴려면 macbook 용량이 커야된다. 돈을 모아서 500기가짜리 ssd를 구입하자. 

***



***

2018/5/15(화) 현재 macport 를 이용해서 abinit 설치는 안 된다.

***

현재 해법은 miniconda 를 깔고 package 를 받아서 쓰는 것이다.  

https://github.com/abinit/abipy

***

abinit 을 miniconda 로 깔려고 하다가 miniconda 에 envs 를 설정하는 방법에 대해서 익숙해지는데, 이후를 위해서 간단히 메모를 한다.

~/.condarc

에 channels 이 저장된다.

abipy를 설치하려면

```
conda config --add channels conda-forge
conda config --add channels matsci
conda config --add channels abinit
```

이 channel 로 저장되어 있어야된다.

***

***


그전에 먼저 abipy3.6 채널을 만들자.

```
conda create --name abipy3.6 python=3.6
```

그다음 `abipy3.6` 를 activate 하자.

```
source activate abipy3.6
```

channels 를 추가하자.

```
conda config --add channels conda-forge
conda config --add channels matsci
conda config --add channels abinit
```

abipy 를 설치하자.

```
conda install abipy -c abinit
```

abinit 를 설치하자.

```
conda install abinit -c abinit
```

문제는 여기서

```
abinit --version
```
를 실행하면 된다고 하는데 에러메세지가 뜬다.

다른 문제는 ipython notebook 리 py3.6 버전이 없다는 것이다.




***
