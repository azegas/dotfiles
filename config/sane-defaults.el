;; I don’t use backup files often as I use git to manage most of my
;; org files. However, I still feel safer when having a backup. I
;; follow the backup configuration from Sacha Chua to enable Emacs’s
;; backups aggressively.

;; Save backup files to a dedicated directory.

; stop creating backup~ files
(setq make-backup-files nil)
; stop creating #autosave# files
(setq auto-save-default nil)
