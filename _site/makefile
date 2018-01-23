all:
	Rscript -e "rmarkdown::render('index.Rmd')"
	Rscript -e "rmarkdown::render('journal.Rmd')"
	open -a Safari file:///Users/parkjinhong/Dropbox/github/journal/index.html
	jekyll serve --baseurl '' --watch

r:
	Rscript -e "rmarkdown::render('index.Rmd')"
	Rscript -e "rmarkdown::render('journal.Rmd')"

upload:
	git config user.name “qkrwlsghdcjsworlt”;git config user.email “astatina@gmail.com”;eval `ssh-agent`;ssh-add ~/.ssh/id_rsa_todo;ssh -vT git@github-todo;git add .;git commit -m “update”;git push origin gh-pages

pull:
	eval `ssh-agent`;ssh-add ~/.ssh/id_rsa_todo;ssh -vT git@github-todo;git pull origin gh-pages

open:
	open -a /Applications/Aquamacs.app ./index.Rmd
