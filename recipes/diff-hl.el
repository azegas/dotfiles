;;; diff-hl.el --- diff stuff
;;; Commentary:
;; [2022-03-08 An]
;; https://github.com/dgutov/diff-hl
;;; Code:

(use-package diff-hl
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode #'diff-hl-mode)
  (add-hook 'prog-mode-hook #'diff-hl-mode)
  (add-hook 'org-mode-hook #'diff-hl-mode)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-post-refresh)
  (add-hook 'prog-mode-hook #'diff-hl-margin-mode)
  (add-hook 'org-mode-hook #'diff-hl-margin-mode)
  (add-hook 'dired-mode-hook 'diff-hl-margin-mode))

;;; diff-hl.el ends here
