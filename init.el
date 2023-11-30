;;; -*- lexical-binding: t -*-

(require 'package)
;; describing what package archives we want to use
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; installing use-package. A package that will later be used to
;; install other emacs packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; ----------------------------------------------------------------------------
;; Addding some configuration that is needed for new emacs
;; installation on a new machine. The things below should be changed
;; for each new installation, since they can differ.
;; ----------------------------------------------------------------------------

;; Let's load our config
(dolist (element '(
		   "ace-window.el"
		   "company.el"
		   "consult.el"
		   "denote.el"
		   "diff-hl.el"
		   "goto-chg.el"
		   "helpful.el"
		   ;; "keycast.el"
		   "magit.el"
		   "multiple-cursors.el"
		   "org.el"
		   "sane-defaults.el"
		   "saveplace.el"
		   "undo-tree.el"
		   "vertico.el"
		   "visuals.el"
		   "which-key.el"
		   "yasnippet.el"

		   ;; loading these last after all the packages have loaded
		   "custom-functions.el"
		   "hooks.el"
		   "key-bindings.el"
		   "directories.el"
		   ))

  (load (concat "~/.emacs.d/config/" element)))

(add-hook 'emacs-startup-hook #'ag/display-startup-time)

;; ----------------------------------------------------------------------------
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b40f11c174e7e475508f1e2c1cfca354d37212494c143a494f27239c7d71a294" default))
 '(org-agenda-files nil)
 '(package-selected-packages
   '(multiple-cursors helpful company which-key consult yasnippet vertico undo-tree orderless modus-themes magit diff-hl denote counsel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
