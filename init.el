;;; -*- lexical-binding: t -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; delays loading the package until one of its declared features is
;; needed. This can help in speeding up Emacs startup time by loading
;; packages only when necessary
(setq use-package-always-defer t)

;; Let's load our config
(dolist (element '(
		   "sane-defaults.el"
		   "directories.el"
		   "key-bindings.el"
		   "magit.el"
		   "projectile.el"
		   "ivy.el"
		   "custom.el"
		   "yasnippet.el"
		   ))

  (load (concat "~/.emacs.d/config/" element)))

(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
	   (format "%.2f seconds"
		   (float-time
		    (time-subtract after-init-time before-init-time)))
	   gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(undo-tree dired-git-info treemacs goto-chg ace-window avy rg diff-hl ws-butler hungry-delete yasnippet move-text volatile-highlights rainbow-delimiters beacon which-key use-package projectile magit helpful counsel browse-kill-ring amx all-the-icons-ivy-rich))
 '(safe-local-variable-values
   '((eval when
	   (require 'rainbow-mode nil t)
	   (rainbow-mode 1)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
