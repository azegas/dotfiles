;;; -*- lexical-binding: t -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Let's load our config
(dolist (element '(
		   "ace-window.el"
		   "avy.el"
		   "browse-kill-ring.el"
		   "company.el"
		   ;; "counsel.el"
		   "custom.el"
		   "directories.el"
		   "dired.el"
		   "goto-chg.el"
		   "helpful.el"
		   "hungry-delete.el"
		   "key-bindings.el"
		   "magit.el"
		   "multiple-cursors.el"
		   "rg.el"
		   "sane-defaults.el"
		   "saveplace.el"
		   "swiper.el"
		   "undo-tree.el"
		   "vertico.el"
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(counsel yasnippet ws-butler which-key vertico undo-tree swiper rg orderless multiple-cursors magit hungry-delete helpful goto-chg dired-git-info diff-hl browse-kill-ring ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "#131818"))))
 '(cursor-orig ((t (:inherit cursor))))
 '(font-lock-builtin-face ((((class color) (min-colors 89)) (:foreground "#ff685d"))))
 '(font-lock-constant-face ((((class color) (min-colors 89)) (:foreground "#ff685d"))))
 '(hl-line ((t (:inherit nil :background "#222222"))))
 '(minibuffer-prompt ((t (:foreground "#ff584d"))))
 '(mode-line ((t (:background "#404040"))))
 '(mode-line-inactive ((t (:background "#101010"))))
 '(org-level-1 ((t (:inherit outline-1 :weight demibold :height 1.2)))))
