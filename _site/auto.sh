#!/bin/sh


while [ 1 ]; do
    eval "Rscript -e \"rmarkdown::render('index.Rmd')\""
sleep 10
done
