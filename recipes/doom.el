;;; doom.el --- doom theme + modeline
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
  (load-theme 'doom-palenight t))

(use-package doom-modeline
  :ensure t
  :init
  (setq doom-modeline-env-enable-python t)
  (setq doom-modeline-env-enable-go nil)
  (setq doom-modeline-buffer-encoding 'nondefault)
  (setq doom-modeline-hud t)
  (setq doom-modeline-persp-icon nil)
  (setq doom-modeline-persp-name nil)
  :config
  (setq doom-modeline-minor-modes nil)
  (setq doom-modeline-buffer-state-icon nil)
  (doom-modeline-mode 1)
  :custom
  (doom-modeline-irc t))

;;; doom.el ends here
