;;; doom-themes.el --- doom theme
;;; Commentary:
;; [2022-03-18 Pn] so far There is nothing better and cleaner than -
;; "Doom-modeline". It converts a basic looking, all cramped modeline into a
;; nice and clean one with only the necessary info and icons displayed.
;; So far so good, liking it.
;;; Code:

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; (load-theme 'doom-palenight t)
  (load-theme 'doom-gruvbox t))

;;; doom-themes.el ends here
