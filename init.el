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

;; absolute path to emacs dir
(setq ag/emacs-dir "~/.emacs.d")
;; absolute path to emacs config dir
(setq ag/emacs-config-dir "~/.emacs.d/config")

;; define my agenda file
(defvar my/inbox-agenda-file "20231128T133226--inbox-task-file__planning.org")
;; ----------------------------------------------------------------------------

;; Let's load our config
(dolist (element '(
		   "ace-window.el"
		   "company.el"
		   "consult.el"
		   "custom.el"
		   "denote.el"
		   "goto-chg.el"
		   "helpful.el"
		   "jumps.el"
		   ;; "keycast.el"
		   "magit.el"
		   ;; "multiple-cursors.el"
		   "org.el"
		   "sane-defaults.el"
		   "saveplace.el"
		   "undo-tree.el"
		   "vertico.el"
		   "visuals.el"
		   "which-key.el"
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

;; --------------------------------------
;; DENOTE FIX ON WSL START


;; make sure to make a symlink like like described in -
;; [[denote:20231126T012052][make denote faster on wsl]] for
;; ¨/Documents/notes/¨ to work:
(setq denote-directory (expand-file-name "~/GIT/notes/"))
;; just because the location is of WINDOWS space and we are in WSL
;; Ubuntu space, denote will work slower
;; to avoid this, can possibly make a job to copy daily at 00:00 or
;; w/e the files from wsl location to onedrive location. That way
;; denote will be lighting speed and also all the denote files will be
;; in onedrive cloud just in case
;; (setq denote-directory (expand-file-name "/mnt/c/Users/arvydas/OneDrive/GIT/notes"))

;; DENOTE FIX ON WSL END
;; --------------------------------------

;; ----------------------------------------------------------------------------
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b40f11c174e7e475508f1e2c1cfca354d37212494c143a494f27239c7d71a294" default))
 '(package-selected-packages
   '(helpful company which-key consult yasnippet vertico undo-tree orderless modus-themes magit diff-hl denote counsel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
