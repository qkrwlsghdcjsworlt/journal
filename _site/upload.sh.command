#vi build.sh

	Rscript -e "rmarkdown::render('/Users/parkjinhong/Dropbox/github/journal/index.md')"
	Rscript -e "rmarkdown::render('/Users/parkjinhong/Dropbox/github/journal/journal.md')"
	Rscript -e "rmarkdown::render('/Users/parkjinhong/Dropbox/github/journal/emacs.md')"
	Rscript -e "rmarkdown::render('/Users/parkjinhong/Dropbox/github/journal/questions.md')"
	Rscript -e "rmarkdown::render('/Users/parkjinhong/Dropbox/github/journal/journal_club.md')"
	Rscript -e "rmarkdown::render('/Users/parkjinhong/Dropbox/github/journal/memo_iridates.md')"
	Rscript -e "rmarkdown::render('/Users/parkjinhong/Dropbox/github/journal/memo_triqs.md')"
	Rscript -e "rmarkdown::render('/Users/parkjinhong/Dropbox/github/journal/memo_qe.md')"
	Rscript -e "rmarkdown::render('/Users/parkjinhong/Dropbox/github/journal/memo_abinit.md')"