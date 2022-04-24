;;; company.el --- auto completion?
;;; Commentary:
;; like it, but don't know what it does exactly
;; [2021-07-01] "Company" provides autosuggestion/completion in buffers (writing code,
;; pathing to files, etc).  press <f1> to display the documentation for
;; the selected candidate or C-w to see its source
;;; Code:

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0) ; lb svarbu, instant suggestion
  ;; (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  ;; (setq company-minimum-prefix-length 2)
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-flip-when-above nil) ; flip when narrow place
  (global-company-mode))

(use-package company-quickhelp
  :ensure t
  :config
  (company-quickhelp-mode 1)
  (eval-after-load 'company
    '(define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin)))
(setq company-quickhelp-delay 0)

;;; company.el ends here
