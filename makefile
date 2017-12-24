all:
	Rscript -e "rmarkdown::render('index.Rmd')"
	open -a Safari http://localhost:4000
	jekyll serve --baseurl '' --watch

r:
	Rscript -e "rmarkdown::render('index.Rmd')"

upload:
	git config user.name “qkrwlsghdcjsworlt”;git config user.email “astatina@gmail.com”;eval `ssh-agent`;ssh-add ~/.ssh/id_rsa_todo;ssh -vT git@github-todo;git add .;git commit -m “update”;git push origin gh-pages

pull:
	eval `ssh-agent`;ssh-add ~/.ssh/id_rsa_todo;ssh -vT git@github-todo;git pull origin gh-pages

open:
	open -a /Applications/Aquamacs.app ./index.Rmd
