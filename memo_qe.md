---
title: "memo for quantum-espresso"
mainfont: NanumGothic
output:
  html_document: default
  pdf_document:
    latex_engine: xelatex
  word_document: default
---





***

MacPort 홈페이지를 보다가 quantum espresso 를 package 형태로 바로 설치할 수 있어서 메모를 해둔다.

***

```
sudo port install quantum-espresso
```

명령어로 실행을 하면 에러가 뜨는데,  scalarpack 설치하다가 다른 패키지가 설치되어있지 않다는 에러 메세지 이다.

이럴때는

```
sudo port install ld64 +ld64_xcode
```
명령어로 다음 패키지를 설치하면 scalarpack 이 설치가 되고, quantum espresso 역시 /opt/local/bin 에 설치된다.

이때 /opt/local/bin 폴더에는 quantum-espresso 폴더는 따로 없고 실행파일 예를 들면, pw.x 가 파일로 설치되어있다.


나의 mac은 /opt/local/bin 이 path 로 설정이 되어있기 때문에 따로 $PATH를 추가하지 않아도 터미널에 pw.x 를 입력하면 quantum-espresso 출력파일이 나오는 것을 확인할 수 있다.

그말은 하드 드라이브에 설치된 quantum espresso 파일들을 삭제해도 된다는 말이겠다.
























