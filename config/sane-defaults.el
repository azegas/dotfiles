;; I don’t use backup files often as I use git to manage most of my
;; org files. However, I still feel safer when having a backup. I
;; follow the backup configuration from Sacha Chua to enable Emacs’s
;; backups aggressively.

;; Save backup files to a dedicated directory.

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
(add-hook 'before-save-hook 'whitespace-cleanup)
;; y and n are default answers instead of yes and no
(fset 'yes-or-no-p 'y-or-n-p)
; Delete marked region when typing over it
(delete-selection-mode t)
; no more annoying buffer list combinations. Now there are two - C-x b and C-x C-b
; I am making there to be only one
(global-set-key (kbd "C-x C-b") 'switch-to-buffer)
;; Character wrap
(setq fill-column 80)
; automatically wraps words at boundaries
(setq-default global-visual-line-mode nil)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
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
;; Line numbers
;; (global-display-line-numbers-mode 1)
;; (add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
;; (load-theme 'zenburn t)

;; Spell check
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(global-set-key (kbd "<f5>") 'flyspell-mode)
