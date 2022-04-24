;;; ivy.el --- mmh
;;; Commentary:
;; [2021-07-01] "Ivy" is a generic completion mechanism for Emacs.
;; C-c f, M-x basically. Other packages use it as well.
;;; Code:

(use-package ivy
  :defer 0.1
  :diminish
  :bind (("C-c C-r" . ivy-resume)
         ("C-x B" . ivy-switch-buffer-other-window)) ; I never use this
  :custom
  (ivy-count-format "(%d/%d) ")
  ;; nice if you want previously opened buffers to appear after an
  ;; emacs shutdown
  (ivy-use-virtual-buffers nil)           ; dont know about that... off for now
  :config (ivy-mode))

(use-package ivy-rich
  :after ivy
  :ensure t
  :init (ivy-rich-mode 1))

(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

;;; ivy.el ends here
