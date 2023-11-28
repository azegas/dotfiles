;; make MISC folder as a place where emacs looks for additional custom
;; themes
(add-to-list 'custom-theme-load-path (concat ag/emacs-dir "/MISC/"))

;; ¨Highly accessible themes for GNU Emacs, conforming with the
;; highest standard for colour contrast between background and
;; foreground values (WCAG AAA)¨

(use-package modus-themes
  :ensure t
  :config
  (load-theme 'modus-vivendi-tinted)

  (define-key global-map (kbd "<f5>") #'modus-themes-toggle))
