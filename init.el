;;; init.el --- Main init
;;; Commentary:
;; Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; andbrighter: it simply makes everything else vanish. – Neal
;; Stephenson, In the Beginning was the Command Line (1998)
;;; Code:

;; -*- lexical-binding: t; -*-

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages")
                         ("elpa" .  "https://elpa.gnu.org/packages/" )))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; (org-babel-load-file (expand-file-name "~/Dropbox/src/emacs/myinit.org"))

(load "~/.emacs.d/recipes/visuals.el")
(load "~/.emacs.d/recipes/jump.el")
(load "~/.emacs.d/recipes/backups.el")
(load "~/.emacs.d/recipes/windows.el")
(load "~/.emacs.d/recipes/general.el")
(load "~/.emacs.d/recipes/org.el")
(load "~/.emacs.d/recipes/org_clock.el")
(load "~/.emacs.d/recipes/org_roam.el")
;; (load "~/.emacs.d/recipes/org_capture.el")
(load "~/.emacs.d/recipes/org_agenda.el")
(load "~/.emacs.d/recipes/writing.el")
(load "~/.emacs.d/recipes/programming.el")
(load "~/.emacs.d/recipes/web.el")
(load "~/.emacs.d/recipes/macros.el")
;; (load "~/.emacs.d/recipes/pop_eshell.el")
(load "~/.emacs.d/recipes/communications.el")

;;; init.el ends here
(put 'dired-find-alternate-file 'disabled nil)
