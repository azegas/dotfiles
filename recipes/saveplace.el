;;; saveplace.el --- mmh
;;; Commentary:
;; [2021-07-01] "Saveplace" remembers your location in a file when saving files
;;; Code:

(use-package saveplace
  :ensure t
  :config
  ;; activate it for all buffers
  (setq-default save-place t)
  (save-place-mode 1))

;;; saveplace.el ends here
