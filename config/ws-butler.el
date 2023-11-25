;; Removing whitespace automatically [2022-01-01 Št] “Ws-butler” -
;; whitespace butler - clean up whitespace automatically on saving
;; buffer.

(use-package ws-butler
  :ensure t
  :config
  (ws-butler-global-mode t))
