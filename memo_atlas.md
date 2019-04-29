---
title: "memo for atlas"
mainfont: NanumGothic
output:
  html_document: default
  pdf_document:
    latex_engine: xelatex
  word_document: default
---


atlas 설치법

[https://mbudisic.wordpress.com/2010/08/12/installing-atlas-with-full-lapack-on-64-bit-linux/](https://mbudisic.wordpress.com/2010/08/12/installing-atlas-with-full-lapack-on-64-bit-linux/)



***

Installing ATLAS with full LAPACK on 64 bit Linux
Posted on 2010-08-12 | 11 Comments
This is a walkthrough guide to installing ATLAS 3.8.3 with full LAPACK on 64 bit Linux. Hope you’ll find it useful.

**Edit**: Kind commenters pointed out that this guide works only for ATLAS 3.8.3.


1. Erase any LAPACK, BLAS and ATLAS distributions that might be on the system. In particular, shared libraries that might crept into lib directories on the path.


1. create a “master” directory to hold both Lapack and Atlas installations

1. download STABLE versions of LAPACK and ATLAS into the master directory


1. unpack LAPACK and enter its directory


1. copy make.inc.example to make.inc and edit make.inc – essential things to set are correct include directories and  -fPIC -m64 -fPIC flags for compilers (OPTS and NOOPT flags), and correct locations for gfortran libraries


1. edit Makefile — uncomment the lib line that has blaslib included. this will make a local copy of blas. Since we’ll be replacing it later with ATLAS it’s easiest to use this local one. So the “lib:” line reads something like lib: blaslib variants lapacklib tmglib


1. run make


1. go to the master directory decompress ATLAS, and create a build directory for it IN THE MASTER, not in ATLAS, e.g., BUILD


1. go to BUILD directory and run the  ../ATLAS/configure script with following options set:


* --with-netlib-lapack should point to the lapackXXX.a file that was compiled in LAPACK directory, so something like ../lapack/lapack_LINUX.a


* –prefix set to wherever the install target is. Note that ATLAS’s configure ignores $PREFIX/share/config.site file, so you’ll have to set those up manually


* bittage  -b 64
flags for ALL compilers -Fa alg '-fPIC -m64 -fPIC'


1. This will generate a Make.inc that will most likely need to be edited.

* ICC, SMC, GOODGCC and other compilers have to have correct fPIC and m64 flags

* F77 should be gfortran and F77SYSLIB need to be set to correct position where libgfortran library is

* FLAPACK lib needs to point at the recently generated LAPACK .a library


1. run make (without threading – ATLAS does that automagically) and then make check


1. go to lib/ and create shared libraries — make shared and make ptshared


1. go to BUILD directory and run “make install” – this installs just the static libraries


1. manually copy lib/*.so to the $PREFIX/lib directory and set their permissions to 0644


1. HOPEFULLY this is it. However, there might be some issues when compiling, with linking shared libraries. If that happens, it might be necessary to manually link shared libraries from static ones. It seems that default “make” procedure ends up linking statically to internal libraries (libc I believe), which causes possible complaints later.
To relink manually, go to BUILD/lib/ directory and create another directory, to keep things tidy. Say “libbuild”. Enter libbuild directory and create the following script

```
#!/usr/bin/env bash
echo $1
ar -x ../lib$1.a
gcc --shared -L/home/mbudisic/lib -L/home/mbudisic/gcc-4.5.0/lib64 -L/home/mbudisic /gcc-4.5.0/lib -o ../lib$1.so -lgfortran -lm -lpthread *.o
rm *.o
```

This script will decompress a static library and link it properly if run with “atlas”, “cblas”, “f77blas”, “lapack”, “ptcblas” and “ptf77blas” as arguments. When done, again copy all *.so libraries to where the rest of shared libraries can be found.