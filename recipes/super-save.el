;;; super-save.el --- autosaving buffers for me
;;; Commentary:
;; no
;;; Code:

(use-package super-save
  :ensure t
  ;; :disabled t                           ;fuck that, losing lots of work with this at pkc
  :config
  (setq super-save-auto-save-when-idle t)
  (setq super-save-idle-duration 5) ;; after 5 seconds of not typing autosave
  ;; add integration with ace-window
  (add-to-list 'super-save-triggers 'ace-window)
  (super-save-mode +1))

;;; super-save.el ends here
