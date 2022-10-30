;;; treemacs.el --- yes
;;; Commentary:
;; nafik installina hydra ir pan
;;; Code:

;; keybindings
;; ? - hydra help or tree-hydra-advanced

(use-package treemacs
  :ensure t
  :config
    ;; Don't follow the cursor
  (treemacs-follow-mode -1)
  (treemacs-git-mode 'deferred)
  :bind ("C-t" . treemacs-select-window))

;; jump to treemacs window with ace mode
;; didn't manage this to work, need to  do "after" somehow
;; https://github.com/doomemacs/doomemacs/issues/1177
;; (setq aw-ignored-buffers (delq 'treemacs-mode aw-ignored-buffers))

;;; treemacs.el ends here
