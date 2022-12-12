;;; highlight-indentation.el --- Minor modes for highlighting indentation

;;; Code:
(use-package highlight-indentation
  :ensure t
  :defer t
  :custom-face
  (highlight-indentation-face ((t (:foreground "IndianRed"))))
  :hook
  ((c++-mode
    c-mode
    emacs-lisp-mode
    fish-mode
    java-mode
    js-mode
    lisp-interaction-mode
    markdown-mode
    python-mode
    rust-mode
    scala-mode
    sh-mode
    web-mode
    yaml-mode) . highlight-indentation-mode)
)

;;; highlight-indentation.el ends here
