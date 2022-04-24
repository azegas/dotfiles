;;; projectile.el --- project stuff
;;; Commentary:
;; [2021-07-01] "Projectile" allows me to have a list of my projects under one
;; pkeybind - C-c p p. I can then open a project and my working directory
;; will remain to that project that I opened. With a shortcut C-c p f I
;; can look thrugh ALL the files of that particular project
;; directory. Super useful, makes the buffers way tidier.
;;; Code:

(use-package projectile
  :ensure t
  :bind (("C-c p" . projectile-command-map)) ;trying to load this after the command gets invoked the first time, but for some reasons it works only I press it the second time
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy)
  (setq projectile-sort-order 'recently-active)
  (setq projectile-project-search-path '("~/Dropbox/src/")))

;;; projectile.el ends here
