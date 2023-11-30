;; [2021-07-01]”Undo tree” lets me to return to the file stage before
;; any modifications were made. Keybind - C-x u.

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

(setq undo-tree-auto-save-history nil)
