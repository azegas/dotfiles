;;; -*- lexical-binding: t -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Make sure we install any packages that aren't on the system (no need to write :ensure t anymore)
(setq use-package-always-ensure t)

;; delays loading the package until one of its declared features is needed. This can help in speeding up Emacs startup time by loading packages only when necessary
(setq use-package-always-defer t)

;; Let's load our config
(dolist (element '("key-bindings.el"
                   "behaviour.el"
                   "magit.el"))

  (measure-time (load (concat "~/.emacs.d/config/" element))))

(add-hook 'server-after-make-frame-hook
	  (lambda ()
	    (message (concat "emacs uptime: " (emacs-uptime)))))

(message (concat (format "Emacs took %.2f seconds to start" (float-time (time-subtract after-init-time before-init-time)))
		 (if (fboundp 'native-compile-async) " With native compiler!")))