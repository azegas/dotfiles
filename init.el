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
(dolist (element '("sane-defaults.el"
		   "directories.el"
		   "key-bindings.el"
		   "magit.el"
		   "projectile.el"
		   "ivy.el"))

  (load (concat "~/.emacs.d/config/" element)))

(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)
