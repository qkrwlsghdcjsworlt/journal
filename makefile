all:
	open -a opera http://localhost:4000
	jekyll serve --baseurl '' --watch

upload:
	git config user.name “qkrwlsghdcjsworlt”;git config user.email “astatina@gmail.com”;eval `ssh-agent`;ssh-add ~/.ssh/id_rsa_todo;ssh -vT git@github-todo;git add .;git commit -m “update”;git push -u origin gh-pages

pull:
	eval `ssh-agent`;ssh-add ~/.ssh/id_rsa_todo;ssh -vT git@github-todo;git pull origin gh-pages
