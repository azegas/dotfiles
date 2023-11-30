;; I don’t use backup files often as I use git to manage most of my
;; org files. However, I still feel safer when having a backup. I
;; follow the backup configuration from Sacha Chua to enable Emacs’s
;; backups aggressively.

;; Save backup files to a dedicated directory.

; M-x use-package-report to see the time of the each loaded package
(setq use-package-compute-statistics t)
; stop creating backup~ files
(setq make-backup-files nil)
; stop creating #autosave# files
(setq auto-save-default nil)
;; ctrl+c+left/right redoes/undoes the window layouts
(winner-mode +1)
;; C-k kills line including its newline
(setq kill-whole-line t)
;; Mouse avoidance. becomes visible again when typing.
(setq make-pointer-invisible t)
;; y and n are default answers instead of yes and no
(fset 'yes-or-no-p 'y-or-n-p)
; Delete marked region when typing over it
(delete-selection-mode t)
;; Character wrap
(setq fill-column 80)
; automatically wraps words at boundaries
(setq-default global-visual-line-mode nil)
; not needed, line numbers show the end of buffer anyway show where
; buffers end.
(setq-default indicate-empty-lines nil)
(setq visible-bell t)
; closes parens automatically for you
(electric-pair-mode +1)
; highlight parenthesis
(show-paren-mode 1)
(setq show-paren-delay 0)
; column-number in mode-line.
(column-number-mode 1)
; file size indication in mode-line
(size-indication-mode 1)
;; (load-theme 'zenburn t)

(setq dired-listing-switches "-agho --group-directories-first")

;; Enable dired-find-alternate-file. In new config it always asks at
;; the beginning to enable this command, since it is disabled. I find
;; it annoying, I always use "a" to open a folder in dired and I will
;; continue doing so. The piece of code below does it so that I don't
;; get prompted "do you really want to use this command" all the time.
(put 'dired-find-alternate-file 'disabled nil)
