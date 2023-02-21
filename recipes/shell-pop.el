;;; shell-pop.el
;;; Commentary:
;; any_comments?
;;; Code:

(use-package shell-pop
  :ensure t
  :bind (("C-2" . shell-pop))
  :config
  (setq shell-pop-full-span t))         ;basically shell window is fullwidht instead of current buffer size(when split)

;; c-u 2 binding - to launch multiple shell buffers, but then how to close each? :p

;;; shell-pop.el ends here
