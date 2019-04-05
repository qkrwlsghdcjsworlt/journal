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

예화가 Alpscore 로 DMRG 를 했다. 나도 따라해보자.  [예화 논문 Ye-Hua alps PRB 2017.pdf](/Users/parkjinhong/Dropbox/2-study/my_project/cuprate/_yehua/_ref/Ye-Hua alps PRB 2017.pdf)

#### Wiki pages

[http://alps.comp-phys.org/mediawiki/index.php/Download_and_install_ALPS_2](http://alps.comp-phys.org/mediawiki/index.php/Download_and_install_ALPS_2)

dmg 파일로 설치하면 /opt/alps 에 설치된다. 그후에는 $PATH 설정을 해주어야지 제대로 사용할 수 있다.



***

그동안 binary 파일을 가져다 설치도 해보고 source 로 설치도 해보고 했는데, 다 실패했었다. 오늘 2019년 4월 5일에서야 비로서 설치에 성공했는데, 그 방법을 memo 해야겠다. 

전반적으로 내가 cmake 에 대한 이해가 부족해서 벌어진 일이다. cmake 로 설치가 안 되더라도 CMakeCache.txt 파일을 수정해서 설치를 진행할 수 있다. 

그리고 boost 는 미리 설치하면 안 된다. 

1. alps-with-boost 소스파일을 다운 받는다.

1. 그리고 alps 폴더에 build 폴더를 만들고 

```
cmake ..
```

여기서 당연히 에러가 생긴다. 에러인 즉슨 boost 관련에러이다. 이때 에러메세지를 보고 CMakeCache.txt 를 수정한다.

그리고 CXX_FLAGS 를 검색해서 `-std=c++11` 를 추가해주고

fortran build 도 ON 하자. 

그리고 c compiler 는 /Library/Developer/CommandLineTools/usr/bin/cc 보다는 /usr/bin/cc /usr/bin/c++ 로 하자.

그리고 나서 다시


```
cmake ..
```

를 하면 드디어 `Makefile` 이 만들어진다.

이제 

```
make
```

 과
 

```
make test
```


```
make install 
```


를 해주면 `/opt/alps/` 에 설치가 된다. 그러면 

~/.bash_profile 

에 

export ALPS_HOME="/opt/alps/"

를 해주면 튜토리얼들을 깰 수가 있다. 


물론 여기서도 compile 이 잘 안 되는데, 이때는 /opt/alps/share/ 폴더에 있는 cmake 파일들과 include.mk 파일들을 잘 만져줘야된다. 아 복잡한 alps 여....




 
 


***

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


***

github 에서 alpscore tutorial 을 받아서 compile 해보았는데 작동하지 않았다. 아마도 tutorials 은 기존의 폴더안에있는것부터 성공한 다음에 다른 tutorial 도 같이 해보자.


***

alps 는 binary 로 설치하고 boost 는 source 로 설치하면 어떨까?

