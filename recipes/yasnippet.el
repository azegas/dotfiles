;;; programming.el --- programming stuff
;;; Commentary:
;; [2022-02-13 Sk] "[[https://www.youtube.com/watch?v=YDuqSwyZvlY][Yasnippet]]" - expand to a switch statement with placeholders. Tab
;; between the placeholders & type actual values. like in [[https://www.youtube.com/watch?v=mflvdXKyA_g&list=PL-mFLc7R_MJdX0MxrqXEV4sM87hmVEkRw&index=2&t=67s][this]] video.
;; I am kind of too new to programming to be using snippets, but its nice,
;; keeping this plugin for now.  It installs kind of many
;; snippets... hope that doesn't slow emacs down. Shouldnt...
;; You can also create your own snippet... possibly even for .org files.
;; many examples here - https://notabug.org/arkhan/dots.old/src/master/emacs/.emacs.d/snippets
;;; Code:

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))


(cond ((eq system-type 'windows-nt)
       ;; Windows-specific code goes here.
       (setq yas-snippet-dirs '("c:\\Users\\arvga\\.arvydas\\src\\emacs\\snippets"))
       )
      ((eq system-type 'gnu/linux)
       ;; Linux-specific code goes here.
       (setq yas-snippet-dirs '("~/.emacs.d/snippets/"))
       ))

(use-package yasnippet-snippets
  :disabled t)

;;; yasnippet.el ends here
