;;; visual.el --- visual stuff
;;; Commentary:
;; visual
;;; Code:

(add-to-list 'custom-theme-load-path "~/Dropbox/src/emacs/misc/themes/")
;;(load-theme 'zenburn t)

(cond ((eq system-type 'windows-nt)
       ;; Windows-specific code goes here.
       (set-face-attribute 'default nil :height 130)
       )
      ((eq system-type 'gnu/linux)
       ;; Linux-specific code goes here.
       ))


;; [2022-03-14 Pr] Transparency
;; (set-frame-parameter (selected-frame) 'alpha '(95 . 95))
;; (add-to-list 'default-frame-alist '(alpha . (95 . 95)))

(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(blink-cursor-mode -1)
(global-hl-line-mode 1)
;; not needed, line numbers show the end of buffer anyway
(setq-default indicate-empty-lines nil)   ; show where buffers end.
(setq visible-bell t)

;; Parentheses
(electric-pair-mode +1)                 ; writes parens automatically for you
(show-paren-mode 1)                     ; highlight parenthesis
(setq show-paren-delay 0)               ; Show matching parens

(column-number-mode 1)                  ; column-number in mode-line.
(size-indication-mode 1)                ; file size indication in mode-line

;; Line numbers
;; (global-display-line-numbers-mode 1)
;; (add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; (set-face-attribute 'default nil :family "Consolas" :height 110)

;;; visuals.el ends here
