;;; hungry-delete.el --- faster delete
;;; Commentary:
;; useful
;;; Code:

;; [2022-01-01 Št] "Hungry delete" - deletes all the whitespace when you hit backspace or
;; delete.
(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

;;; hungry-delete.el ends here
