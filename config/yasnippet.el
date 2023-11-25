;; [2022-02-13 Sk] ”Yasnippet” - expand to a switch statement with
;; placeholders. Tab between the placeholders & type actual
;; values. like in
;; this(https://www.youtube.com/watch?v=mflvdXKyA_g&list=PL-mFLc7R_MJdX0MxrqXEV4sM87hmVEkRw&index=3&t=67s&ab_channel=byuksel)
;; video. I am kind of too new to programming to be using snippets,
;; but its nice, keeping this plugin for now. It installs kind of many
;; snippets… hope that doesn’t slow emacs down. Shouldnt… You can also
;; create your own snippet… possibly even for .org files. many
;; examples here -
;; https://notabug.org/arkhan/dots.old/src/master/emacs/.emacs.d/snippets

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :disabled t)

;; In this code, we assume that yas-snippet-dirs is already a
;; defined list variable. The add-to-list function is then used
;; append the concatenated directory path my/emacs-dir +
;; "/snippets/" to the existing list of directories specified
;; by yas-snippet-dirs.
(setq yas-snippet-dirs (concat ag/emacs-dir "/snippets/"))
