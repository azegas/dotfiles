;; This setting tells Emacs to consider all themes as safe and
;; eliminates the prompt for confirmation on whether to load and trust
;; a theme with Lisp code. With this configuration, Emacs will
;; automatically trust and load themes without asking for confirmation
;; each time you start Emacs.
(setq custom-safe-themes t)

;; ¨Highly accessible themes for GNU Emacs, conforming with the
;; highest standard for colour contrast between background and
;; foreground values (WCAG AAA)¨

(use-package modus-themes
  :ensure t
  :config
  (load-theme 'modus-vivendi-tinted))
