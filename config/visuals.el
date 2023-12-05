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

;; Accelerate scrolling with the trade-off of sometimes delayed accurate fontification.
(setq fast-but-imprecise-scrolling t)

;; Use a bar cursor by default.
(setq-default cursor-type 'bar)

;; -------------------------------------------------------------------

;; (use-package pixel-scroll
;;   :hook
;;   (org-mode-hook . pixel-scroll-precision-mode))

;; (setq scroll-step            1
;;       scroll-conservatively  10000)


(use-package smooth-scrolling
  :ensure t)

(smooth-scrolling-mode 1)
