;;; rjsx-mode.el --- react highlighting
;;; Commentary:
;; < starts tag and < closes
;;; Code:

(use-package rjsx-mode
  ;; Real support for JSX
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

;;; rjsx-mode.el ends here
