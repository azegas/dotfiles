;; [2021-07-01] A package that displays the available keybindings in a
;; popup. The package is pretty useful, as Emacs seems to have more
;; keybindings than I can remember at any given point. For example
;; press Ctrl+c or Ctrl+x in a buffer and you will see the possible
;; commands

(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  (setq which-key-idle-delay 0.2)
  :config
  (which-key-mode 1))
