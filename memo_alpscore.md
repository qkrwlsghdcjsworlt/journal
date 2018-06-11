---
title: "memo for ALPSCore"
mainfont: NanumGothic
output:
  html_document: default
  pdf_document:
    latex_engine: xelatex
  word_document: default
---





***

예화가 Alpscore 로 DMRG 를 했다. 나도 따라해보자. 

#### Wiki pages

[http://alps.comp-phys.org/mediawiki/index.php/Download_and_install_ALPS_2](http://alps.comp-phys.org/mediawiki/index.php/Download_and_install_ALPS_2)

dmg 파일로 설치하면 /opt/alps 에 설치된다. 그후에는 $PATH 설정을 해주어야지 제대로 사용할 수 있다.


#### github pages

[https://github.com/ALPSCore/ALPSCore/wiki](https://github.com/ALPSCore/ALPSCore/wiki)


***


쉽게 설치하려면 아무래도 conda를 이용하는것이 제일 나아보인다. 


***

#### 실행

```
source activate alpscore
```



***

#### 설치과정

```
conda create -n alpscore -y python=2.7 ipython
```

```
source activate alpscore
```

```
conda install alps
```


~/.zshrc 파일에 다음줄을 추가한다. 
```
export ALPS_HOME=/Users/parkjinhong/miniconda2/envs/alpscore
export ALPS_ROOT_DIR=/Users/parkjinhong/miniconda2/envs/alpscore
```

or
```
export ALPS_HOME=/Users/parkjinhong/miniconda3/envs/alpscore
export ALPS_ROOT_DIR=/Users/parkjinhong/miniconda3/envs/alpscore
```

그리고 기존에 /opt/alps 설치된 alpscore 를 지운다.

```
sudo rm -r /opt/alps
```

이렇게하면 ~/miniconda2/envs/alpscore 에 설치된 source 파일로 cmake 할 수 있다. 


***

#### ALPS tutorial arXiv

[ALPS arXiv.pdf](ref/ALPS arXiv.pdf)
