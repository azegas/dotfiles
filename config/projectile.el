;; [2021-07-01] “Projectile” allows me to have a list of my projects
;; under one pkeybind - C-c p p. I can then open a project and my
;; working directory will remain to that project that I opened. With
;; a hortcut C-c p f I can look thrugh ALL the files of that
;; particular project directory. Super useful, makes the buffers way
;; tidier.

(use-package projectile
  :ensure t
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy)
  (setq projectile-sort-order 'recently-active))
