;; [2021-07-01] “Saveplace” remembers your location in a file when
;; saving files

(use-package saveplace
  :ensure t
  :config
  ;; activate it for all buffers
  (setq-default save-place t)
  (save-place-mode 1))
