;;; doom-modeline.el --- doom modeline
;;; Commentary:
;; turning it off, because it covers too much of the tag prompt window
;;; Code:

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
