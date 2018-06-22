---
title: "~ preference files"
mainfont: NanumGothic
output:
  html_document: default
  pdf_document:
    latex_engine: xelatex
  word_document: default
---



***

~/.zshrc 파일

export PATH="/usr/local/opt/llvm/bin:$PATH"
export CC=/usr/local/opt/llvm/bin/clang
export CXX=/usr/local/opt/llvm/bin/clang++
export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export PATH=$HOME/.local/environment-modules/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.local/Tcl/lib:$LD_LIBRARY_PATH
source $HOME/.local/environment-modules/init/zsh

***












***

Options - Customize Aquamacs - Saved options - Revert - Erase Customizations -text-mode 검색 - word wrapping check



***

---

#### emacs 설정파일


```
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "/Users/parkjinhong/Dropbox/github/jmax/elpa/auctex-12.1.0")
(add-to-list 'load-path "/Users/parkjinhong/Dropbox/github/jmax/elpa/auctex-latexmk-1.0.2")

(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))  
(setq exec-path (append exec-path '("/Library/TeX/texbin/")))


(require 'auctex-latexmk)
(auctex-latexmk-setup)

;; AucTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

;; Use Skim as viewer, enable source <-> PDF sync
;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
(add-hook 'LaTeX-mode-hook (lambda ()
(push
    '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
    :help "Run latexmk on file")
    TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background  
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
'(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))(setq TeX-view-program-list
 '(("PDF Viewer" "/usr/bin/open -a Skim.app %o")))
 (global-linum-mode t)
(setq linum-format "%4d \u2502 ") ;; separation


; 한글 폰트 깨짐
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)
(set-file-name-coding-system 'cp949-dos)

;; shift+space 한영변환 해제 
(global-unset-key (kbd "S-SPC"))


;마우스 스크롤 속도 천천히
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)


;;unfill

;; unfill-paragraph
(defun xah-unfill-paragraph ()
"Replace newline chars in current paragraph by single spaces.
This command does the inverse of `fill-paragraph'.

URL `http://ergoemacs.org/emacs/emacs_unfill-paragraph.html'
Version 2016-07-13"
(interactive)
(let ((fill-column most-positive-fixnum))
(fill-paragraph)))

;; unfill-region
(defun xah-unfill-region (start end)
"Replace newline chars in region by single spaces.
This command does the inverse of `fill-region'.

URL `http://ergoemacs.org/emacs/emacs_unfill-paragraph.html'
Version 2016-07-13"
(interactive "r")
(let ((fill-column most-positive-fixnum))
(fill-region start end)))

(global-set-key (kbd "C-x C-p") 'xah-unfill-paragraph) ; Alt+z p
(global-set-key (kbd "C-x C-r") 'xah-unfill-region) ; Alt+z r

;; unfill 

(defun rmd-mode () 
    "ESS Markdown mode for rmd files" 
    (interactive) 
    (require 'poly-R) 
    (require 'poly-markdown) 
    (poly-markdown+r-mode)) 

;;rmd-mode autoload 
    (autoload 'rmd-mode "rmd" "Some documentation." t) 
(add-to-list 'auto-mode-alist '("\\.rmd\\'" . rmd-mode))

;; global disable the question on changed file 
(global-auto-revert-mode -1)


(defun ask-user-about-supersession-threat (fn) 
"blatantly ignore files that changed on disk" 
) 
(defun ask-user-about-lock (file opponent) 
"always grab lock" 
t)

(setq ess-swv-processor 'knitr)

;; transparency
(setq transparency-level 95)
(set-frame-parameter nil 'alpha transparency-level)
(add-hook 'after-make-frame-functions (lambda (selected-frame) (set-frame-parameter selected-frame 'alpha transparency-level)))


(setq default-frame-alist '((width . 180) (height . 30)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; 한프레임당 하나의 buffer 만 가능한 모드.
 '(one-buffer-one-frame-mode t nil (aquamacs-frame-setup))
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ```





