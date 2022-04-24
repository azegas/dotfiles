;;; jump.Eli --- stuff for a breezy navigation around emacs
;;; Commentary:
;; jumping
;;; Code:

;; Easily jump to my main org file
(defun aga-find-current nil
  "Find the myinit.org file."
  (interactive)
  (dired "~/.emacs.d/recipes/") ;; Ubuntu
  (delete-other-windows))
;; Find myinit.org  file
(global-set-key (kbd "C-x <C-backspace>") 'aga-find-current)

(defun aga-find-init.el nil
  "Find the init.el file."
  (interactive)
    (find-file "~/.emacs.d/init.el") ;; Ubuntu
  (delete-other-windows))
;; Find init.el file
(global-set-key (kbd "C-x <C-home>") 'aga-find-init.el)

;; [2021-07-01]"Undo tree" lets me to return to the file stage before any
;; modifications were made. Keybind - C-x u.
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))
(setq undo-tree-auto-save-history nil)

;; [2021-07-01] "Rg" - rip grep. Helps to search for a term through many files. Super
;; useful when need to change something on many files.  Installation:
;; Sudo apt install ripgrep M-x rg and search away Tut: nice video
;; https://www.youtube.com/watch?v=4qLD4oHOrlc&ab_channel=ProtesilaosStavrou
(use-package rg
  :ensure t
  :commands rg)

;; [2021-07-01] "Avy" lets me jump to to a specific letter or a word quickly. M-s and
;; I can type a word, it will immeaditely jump to it on any opened and
;; visible buffer.  See https://github.com/abo-abo/avy for more info.
(use-package avy
  :ensure t
  :bind
  (("M-s" . avy-goto-char-timer)
   ("M-p" . avy-goto-word-1)))
(setq avy-background t)                 ; cool, makes the background darker

;; [2021-07-01] "Projectile" allows me to have a list of my projects under one
;; pkeybind - C-c p p. I can then open a project and my working directory
;; will remain to that project that I opened. With a shortcut C-c p f I
;; can look thrugh ALL the files of that particular project
;; directory. Super useful, makes the buffers way tidier.
(use-package projectile
  :ensure t
  :bind (("C-c p" . projectile-command-map)) ;trying to load this after the command gets invoked the first time, but for some reasons it works only I press it the second time
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy)
  (setq projectile-sort-order 'recently-active)
  (setq projectile-project-search-path '("~/Dropbox/src/")))

;; [2021-07-01] "Ivy" is a generic completion mechanism for Emacs.
;; C-c f, M-x basically. Other packages use it as well.
(use-package ivy
  :defer 0.1
  :diminish
  :bind (("C-c C-r" . ivy-resume)
         ("C-x B" . ivy-switch-buffer-other-window)) ; I never use this
  :custom
  (ivy-count-format "(%d/%d) ")
  ;; nice if you want previously opened buffers to appear after an
  ;; emacs shutdown
  (ivy-use-virtual-buffers nil)           ; dont know about that... off for now
  :config (ivy-mode))

(use-package ivy-rich
  :after ivy
  :ensure t
  :init (ivy-rich-mode 1))

;; [2022-02-24 Kt] Perfect! Can now cycle through the last changes in the buffer. Very
;; useful when doing some C-s in the buffer and then want to come back to
;; the last modified location. Great! If trying to use it in org file -
;; doesn't work. Does ''org-cycle-agenda-files' instead when doing the reverse.
(use-package goto-chg
  :ensure t)
(global-set-key (kbd "M-[") 'goto-last-change)
(global-set-key (kbd "M-]") 'goto-last-change-reverse)

;; [2021-07-01] "Swiper" - an Ivy-enhanced alternative to Isearch. Instead of regular
;; C-s C-r. Relies on Ivy, but Ivy doens't rely on Swiper.
(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

;; [2022-03-11 Pn]
(use-package dired
  :ensure nil                         ;no need for t, because dired is built in
  :custom ((dired-listing-switches "-agho --group-directories-first"))) ;sort directories first
(global-set-key (kbd "C-x C-d") 'dired-jump) ;open dired buffer in current location
(define-key dired-mode-map (kbd "f") 'dired-find-alternate-file)
;; (global-set-key (kbd "C-x d") 'dired)

;; [2022-03-11 Pn] Adding more colors to dired buffers
(use-package diredfl
  :ensure t
  :after (dired)
  :config
  (diredfl-global-mode 1))

;; [2022-03-11 Pn] [[https://github.com/clemera/dired-git-info][dired-git-info]]. This Emacs packages provides a minor mode which shows
;; git information inside the dired buffer.
(use-package dired-git-info
  :ensure t
  :after dired)
;; Bind the minor mode command in dired
(with-eval-after-load 'dired
  (define-key dired-mode-map ")" 'dired-git-info-mode))
;; Don’t hide normal Dired file info
(setq dgi-auto-hide-details-p nil)
;; Enable automatically in every Dired buffer (if in Git repository)
(add-hook 'dired-after-readin-hook 'dired-git-info-auto-enable)

;; [2022-04-01 Fri] amx: An alternative M-x interface for Emacs. Sort by most recent commands.
;; https://github.com/DarwinAwardWinner/amx
(use-package amx
  :ensure t
  :defer 0.5
  :config (amx-mode))

;;; jump.el ends here
