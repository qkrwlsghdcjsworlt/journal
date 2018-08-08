---
title: "memo for TBTK"
mainfont: NanumGothic
output:
  html_document: default
  pdf_document:
    latex_engine: xelatex
  word_document: default
---





***

tight-binding 계산, DFT 계산, DMFT 계산을 염두에 둔 TBTK 프로그램을 _project 에 설치했다. 큰 어려움 없이 make 하는데 성공했다.


***

### 실행법

```
cd /Users/parkjinhong/Dropbox/_project/TBTK/TBTKApplications
TBTKCreateAppliaction MyFirstApplication
cd MyFirstApplication
cmake .
make
./build/Application
```

를 실행하면 `/Users/parkjinhong/Dropbox/_project/TBTK/TBTKApplications/MyFirstApplication/src`
에 있는 main.cpp 를 실행하게 된다.


---------------------------------

### 설치순서

1. git 에서 다운로드 
	```		
git clone http://github.com/dafer45/TBTK
	```

1. TBTK 폴더로 이동  
	```
cd TBTK
	```

1. version 관리  
	```
git checkout v1.0.0
	```

1. build 폴더 만들기

	```
mkdir TBTKBuild
cd TBTKBuild
	```
	
1. make

	```
cmake ..
make
sudo make install
	```
	
1. create Application

	```
cd ..
mkdir TBTKApplications
cd TBTKApplications
TBTKCreateAppliaction MyFirstApplication
cd MyFirstApplication
cmake .
	```
	
	
	를 하면 arpack 이 없다는 메세지가 뜰 수 있는데 그럴때
	
1. Arpack 설치	
	```
brew install arpack
	```
	
1. make

	```
make
./build/Application
	```
	
	를 하면 libjpeg.#.dylib 가 없다는 메세지가 뜰수 있는데 그럴땐
	
1. wxmac 업그래이드 또는 설치

	```
brew upgrade wxmac
	```

	or
	
	```
brew install wxmac
	```
	