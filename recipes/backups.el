;;; backups.el --- backups stuff
;;; Commentary:
;; I don’t use backup files often as I use git to manage most of my org
;; files. However, I still feel safer when having a backup. I follow the
;; backup configuration from Sacha Chua to enable Emacs’s backups
;; aggressively.
;; Save backup files to a dedicated directory.
;;; Code:

;; (setq backup-directory-alist '(("." . "~/Dropbox/src/emacs/backups")))
;; (setq delete-old-versions -1)

;; ;; Make numeric backup versions unconditionally.
;; (setq version-control t)
;; (setq vc-make-backup-files t)
;; (setq auto-save-file-name-transforms '((".*" "~/Dropbox/src/emacs/auto-save-list/" t)))

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

;; (setq make-backup-files nil)
;; (setq auto-save-list-file-name  nil)
;; (setq auto-save-default nil)

;;; backups.el ends here
