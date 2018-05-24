---
title: "memo for pythTB"
mainfont: NanumGothic
output:
  html_document: default
  pdf_document:
    latex_engine: xelatex
  word_document: default
---





***

Tight-binding 계산을 할 수 있는 pythTB 패키지를 miniconda3 python2.7 버전으로 설치했다. 


***

```
source activate pythtb_test

pythonw `which ipython`
```


---------------------------------

2018/05/24 (목)  


jupyter 노트북을 사용해서 pythtb 사용하는 것은 포기해야 될 것인가?

pythonw ******.py 을 실행하면 결과가 나오긴한다.

```
pythonw `which ipython`


In [1]: %matplotlib osx

In [2]: import matplotlib.pyplot as plt

In [3]: plt.plot([1,2,3,2,1])
```
이 방법을 쓰면 ipython 을 이용해서 notebook 형태로 쓰는 것이 가능하다.




---------------------------------

conda env 만드는 법 정리

---------------------------------


jupyter 로 pythtb (tight-binding python 패키지)를 사용하려고 하는데, 계속 에러가 나서 찾아보던 중, python 이 사용하는 sys path 와 jupyter 가 사용하는 sys path 가 다를 수도 있다는 것을 알았다. 그에 대한 해결책.

[https://www.lucypark.kr/blog/2013/02/10/when-python-imports-and-ipython-does-not/](https://www.lucypark.kr/blog/2013/02/10/when-python-imports-and-ipython-does-not/)

그리고 `conda` 로 env 만들고

```
$ conda create -n py36_test -y python=3.6 jupyter
$ source activate py36_test
(py36_test) $ which jupyter
/home/schowell/anaconda3/envs/py36_test/bin/jupyter
(py36_test) $ jupyter notebook
```
출처:  
[https://stackoverflow.com/questions/39604271/conda-environments-not-showing-up-in-jupyter-notebook](https://stackoverflow.com/questions/39604271/conda-environments-not-showing-up-in-jupyter-notebook)


env 확인하고  
```
conda info --envs
```


env 지우는 방법
```
conda remove --name myenv --all
```

출처:  
[https://conda.io/docs/user-guide/tasks/manage-environments.html#removing-an-environment](https://conda.io/docs/user-guide/tasks/manage-environments.html#removing-an-environment)


다른 큰 문제는 matplotlib.pyplot 를 쓰기 위해서는 framework python을 써야 되는데, conda 같은 경우는 framework 가 아니라고 한다. 그래서 MacOS 에 내재된 python을 쓰것인가 계속 miniconda 버전의 python 을 쓸것인가 를 정해야되는데, miniconda 버전의 python을 쓰게 될 경우 python을 쓰는 것이 아니라 `pythonw` 를 쓰면 framework 로 인식하기 때문에 무사히 쓸 수 있다.  

다음에 할 일은 jupyter 에 어떻게 쓸것인가하는 것인데,

아래 두개의 웹사이트를 보고 해야해야될 것이다.  

[https://matplotlib.org/faq/osx_framework.html](https://matplotlib.org/faq/osx_framework.html)

[https://github.com/mapio/jupyter-virtualenv-osx](https://github.com/mapio/jupyter-virtualenv-osx)


Matplotlib 패키지를 사용할 때는 보통 다음과 같이 주 패키지는 mpl 이라는 별칭(alias)으로 임포트하고 pylab 서브패키지는 plt 라는 다른 별칭으로 임포트하여 사용하는 것이 관례이므로 여기에서도 이러한 방법을 사용한다.

```
import matplotlib as mpl
import matplotlib.pylab as plt
```

주피터 노트북을 사용하는 경우에는 다음처럼 매직(magic) 명령으로 노트북 내부에 그림을 표시하도록 지정해야 한다.
```
%matplotlib inline
```
