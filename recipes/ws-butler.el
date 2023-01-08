;;; ws-butler.el --- removing whitespace automaticay
;;; Commentary:
;; [2022-01-01 Št] "Ws-butler" - whitespace butler - clean up whitespace automatically on
;; saving buffer.
;;; Code:

(use-package ws-butler
  :ensure t
  :config
  (ws-butler-global-mode t))

;;; ws-butler.el ends here
