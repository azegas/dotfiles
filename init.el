;;; -*- lexical-binding: t -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Let's load our config
(dolist (element '(
		   "ace-window.el"
		   "amx.el"
		   "avy.el"
		   "browse-kill-ring.el"
		   "company.el"
		   "custom.el"
		   "directories.el"
		   "dired.el"
		   "goto-chg.el"
		   "helpful.el"
		   "hungry-delete.el"
		   "ivy.el"
		   "key-bindings.el"
		   "magit.el"
		   "multiple-cursors.el"
		   "projectile.el"
		   "rg.el"
		   "sane-defaults.el"
		   "saveplace.el"
		   "undo-tree.el"
		   "which-key.el"
		   "ws-butler.el"
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
