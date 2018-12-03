all:
	Rscript -e "rmarkdown::render('index.md')"
	Rscript -e "rmarkdown::render('journal.md')"

r:
	Rscript -e "rmarkdown::render('index.md')"
	Rscript -e "rmarkdown::render('journal.md')"
	Rscript -e "rmarkdown::render('Z2_number.md')"
	Rscript -e "rmarkdown::render('questions.md')"
	Rscript -e "rmarkdown::render('memo_triqs.md')"
	Rscript -e "rmarkdown::render('memo_qe.md')"
	Rscript -e "rmarkdown::render('memo_iridates.md')"
	Rscript -e "rmarkdown::render('memo_abinit.md')"
	Rscript -e "rmarkdown::render('memo_pythtb.md')"
	Rscript -e "rmarkdown::render('memo_qutip.md')"
	Rscript -e "rmarkdown::render('memo_alpscore.md')"
	Rscript -e "rmarkdown::render('journal_club.md')"
	Rscript -e "rmarkdown::render('emacs.md')"
	Rscript -e "rmarkdown::render('ref_iridates.md')"
	Rscript -e "rmarkdown::render('ED.md')"
	Rscript -e "rmarkdown::render('memo_TBTK.md')"
	Rscript -e "rmarkdown::render('memo_Lado.md')"
	Rscript -e "rmarkdown::render('memo_clang-openmpi-boost.md')"
	Rscript -e "rmarkdown::render('memo_mpich.md')"
	Rscript -e "rmarkdown::render('memo_ELK.md')"


upload:
	git config user.name “qkrwlsghdcjsworlt”;git config user.email “astatina@gmail.com”;eval `ssh-agent`;ssh-add ~/.ssh/id_rsa_todo;ssh -vT git@github-todo;git add .;git commit -m “update”;git push origin gh-pages

pull:
	eval `ssh-agent`; ssh-add ~/.ssh/id_rsa_todo; ssh -vT git@github-todo; git pull origin gh-pages

open:
	open -a /Applications/Aquamacs.app ./index.Rmd



ipython:
	ipython notebook
