;;; prettier-js.el --- aligning code cleanly/automatically
;;; Commentary:
;; make sure prettier is installed - which prettier
;; if not - npm install -g prettier
;;; Code:

(use-package prettier-js
  :ensure t
  :hook (((js2-mode rjsx-mode) . prettier-js-mode)))

(add-hook 'css-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)

;;; prettier-js.el ends here
