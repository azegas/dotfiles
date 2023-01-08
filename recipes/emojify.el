;;; emojify.el --- emojis
;;; Commentary:
;; "Emojify" allows to preview emojis in Emacs buffers. Needed for
;; Facebook auto posting
;;; Code:

(use-package emojify
  :ensure t
  :hook (after-init . global-emojify-mode))

;;; emojify.el ends here
