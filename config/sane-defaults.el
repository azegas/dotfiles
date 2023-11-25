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
(load-theme 'zenburn t)

;;; ---------------------------------------

;; [2022-03-18 Pn] Are you tired of using the endless keystrokes of
;; C-y M-y M-y M-y … to get at that bit of text you killed
;; thirty-seven kills ago? Ever wish you could just look through
;; everything you’ve killed recently to find out if you killed that
;; piece of text that you think you killed, but you’re not quite sure?
;; If so, then browse-kill-ring is the Emacs extension for you.

;; persists over emacs sessions!!! (after restart)

;; Shortcut - M-y to browse-kill-ring

(use-package browse-kill-ring
  :ensure t
  :config
  (browse-kill-ring-default-keybindings)
  )

;; [2021-07-01] A package that displays the available keybindings in a
;; popup. The package is pretty useful, as Emacs seems to have more
;; keybindings than I can remember at any given point. For example
;; press Ctrl+c or Ctrl+x in a buffer and you will see the possible
;; commands

(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  (setq which-key-idle-delay 0.2)
  :config
  (which-key-mode 1))

;; [2022-04-01 Fri] amx: An alternative M-x interface for Emacs. Sort
;; by most recent commands. https://github.com/DarwinAwardWinner/amx
;; useful for when you want to run the same command in a row, you
;; don't have to type it each and every time after pressing M-x

(use-package amx
  :ensure t
  :defer 0.5
  :config (amx-mode))

;; [2022-03-15 An] Improves *help* buffer. Way more info than with
;; regular help.

(use-package helpful
  :ensure t
  :bind
  (("C-h f" . helpful-callable)
   ("C-h v" . helpful-variable)
   ("C-h k" . helpful-key)
   ("C-c C-d" . helpful-at-point)
   ("C-h F" . helpful-function)
   ("C-h C" . helpful-command)))

;; [2021-07-01] “Saveplace” remembers your location in a file when
;; saving files

;; (use-package saveplace
;;   :ensure t
;;   :config
;;   ;; activate it for all buffers
;;   (setq-default save-place t)
;;   (save-place-mode 1))

;; [2021-07-01] “Beacon” - never lose your cursor again. Flashes the
;; cursor location when switching buffers. Don’t get lost bro.

(use-package beacon
  :ensure t
  :config
  (progn
    (setq beacon-blink-when-point-moves-vertically nil) ; default nil
    (setq beacon-blink-when-point-moves-horizontally nil) ; default nil
    (setq beacon-blink-when-buffer-changes t) ; default t
    (setq beacon-blink-when-window-scrolls t) ; default t
    (setq beacon-blink-when-window-changes t) ; default t
    (setq beacon-blink-when-focused nil) ; default nil

    (setq beacon-blink-duration 0.3) ; default 0.3
    (setq beacon-blink-delay 0.3) ; default 0.3
    (setq beacon-size 20) ; default 40
    ;; (setq beacon-color "yellow") ; default 0.5
    (setq beacon-color 0.5) ; default 0.5

    (add-to-list 'beacon-dont-blink-major-modes 'term-mode)

    (beacon-mode 1)))

;; Fonts
;; (cond ((eq system-type 'windows-nt)
;;      ;; Windows-specific code goes here.
;;      (set-face-attribute 'default nil :height 130)
;;      )
;;     ((eq system-type 'gnu/linux)
;;      ;; Linux-specific code goes here.
;;      (set-face-attribute 'default nil :height 130)
;;      ))

;; Transparency
;; [2022-03-14 Pr] Transparency
;; (set-frame-parameter (selected-frame) 'alpha '(95 . 95))
;; (add-to-list 'default-frame-alist '(alpha . (95 . 95)))

;; after pasting f.x - block that you have pasted will be highlihted
;; until cursor moves useful to see the boundries of the copied and
;; pasted block

(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode t))

;; Move-text
;; moving text in ORG files with M + up/down

(use-package move-text
  :ensure t
  :config
  (move-text-default-bindings))

;; [2022-01-01 Št] “Hungry delete” - deletes all the whitespace when
;;  you hit backspace or delete.

(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

;; Removing whitespace automatically [2022-01-01 Št] “Ws-butler” -
;; whitespace butler - clean up whitespace automatically on saving
;; buffer.

(use-package ws-butler
  :ensure t
  :config
  (ws-butler-global-mode t))

;; Spell check

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(global-set-key (kbd "<f5>") 'flyspell-mode)


;; multiple-cursors.el — select same words inside the buffer and
;; replace them wow

(use-package multiple-cursors
  :ensure t
  :commands multiple-cursors
  :bind (("C->" . mc/mark-next-like-this)
	 ("C-<" . mc/unmark-next-like-this)
	 ("C-c C-<" . mc/mark-all-like-this)))
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;; [2021-07-01] “Rg” - rip grep. Helps to search for a term through
;; many files. Super useful when need to change something on many
;; files.
;; M-x rg and search away Tut: nice video
;; https://www.youtube.com/watch?v=4qLD4oHOrlc&ab_channel=ProtesilaosStavrou

(use-package rg
  :ensure t
  :commands rg)


;; Jump to specific position.

;; [2021-07-01] “Avy” lets me jump to to a specific letter or a word
;; quickly. M-s and I can type a word, it will immeaditely jump to it
;; on any opened and visible buffer. See
;; https://github.com/abo-abo/avy for more info.

(use-package avy
  :ensure t
  :bind
  (("M-s" . avy-goto-char-timer)
   ("M-p" . avy-goto-word-1)))

;; make the background darker
(setq avy-background t)


;; [2021-07-01] “Ace windows” helps me to switch windows easily. Main
;; keybind - C-x o and then the commands that follow below.

(use-package ace-window
  :ensure t
  :init (setq aw-keys '(?q ?w ?e ?r ?y ?h ?j ?k ?l)
					;aw-ignore-current t ; not good to turn off since I wont be able to do c-o o <current>
	      aw-dispatch-always nil)     ;t means it applies a letter even if there are only two windows. not needed.
  :bind (("C-x o" . ace-window)
	 ("M-O" . ace-swap-window)
	 ("C-x v" . aw-split-window-horz)))

(defvar aw-dispatch-alist
  '((?x aw-delete-window "Delete Window")
    (?m aw-swap-window "Swap Windows")
    (?M aw-move-window "Move Window")
    (?c aw-copy-window "Copy Window")
    (?f aw-switch-buffer-in-window "Select Buffer")
    (?n aw-flip-window)
    (?u aw-switch-buffer-other-window "Switch Buffer Other Window")
    (?c aw-split-window-fair "Split Fair Window")
    (?h aw-split-window-vert "Split Vert Window")
    (?v aw-split-window-horz "Split Horz Window")
    (?o delete-other-windows)
    ;; (?o delete-other-windows "Delete Other Windows")
    ;; (?o delete-other-windows " Ace - Maximize Window")
    (?? aw-show-dispatch-help))
  "List of actions for `aw-dispatch-default'.")


;; Go to last/previous change [2022-02-24 Kt] Perfect! Can now cycle
;; through the last changes in the buffer. Very useful when doing some
;; C-s in the buffer and then want to come back to the last modified
;; location. Great! If trying to use it in org file - doesn’t
;; work. Does ”org-cycle-agenda-files’ instead when doing the reverse.

(use-package goto-chg
  :ensure t)
(global-set-key (kbd "M-[") 'goto-last-change)
(global-set-key (kbd "M-]") 'goto-last-change-reverse)

;; ? - hydra help or tree-hydra-advanced

;; (use-package treemacs
;;   :ensure t
;;   :config
;;     ;; Don't follow the cursor
;;   (treemacs-follow-mode -1)
;;   (treemacs-git-mode 'deferred)
;;   :bind
;;   ("C-`" . treemacs-select-window)
;;   )

;; all the treemacs configuration options and their defaults

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
	  treemacs-deferred-git-apply-delay        0.5
	  treemacs-directory-name-transformer      #'identity
	  treemacs-display-in-side-window          t
	  treemacs-eldoc-display                   'simple
	  treemacs-file-event-delay                2000
	  treemacs-file-extension-regex            treemacs-last-period-regex-value
	  treemacs-file-follow-delay               0.2
	  treemacs-file-name-transformer           #'identity
	  treemacs-follow-after-init               t
	  treemacs-expand-after-init               t
	  treemacs-find-workspace-method           'find-for-file-or-pick-first
	  treemacs-git-command-pipe                ""
	  treemacs-goto-tag-strategy               'refetch-index
	  treemacs-header-scroll-indicators        '(nil . "^^^^^^")
	  treemacs-hide-dot-git-directory          t
	  treemacs-indentation                     2
	  treemacs-indentation-string              " "
	  treemacs-is-never-other-window           nil
	  treemacs-max-git-entries                 5000
	  treemacs-missing-project-action          'ask
	  treemacs-move-forward-on-expand          nil
	  treemacs-no-png-images                   nil
	  treemacs-no-delete-other-windows         t
	  treemacs-project-follow-cleanup          nil
	  treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
	  treemacs-position                        'left
	  treemacs-read-string-input               'from-child-frame
	  treemacs-recenter-distance               0.1
	  treemacs-recenter-after-file-follow      nil
	  treemacs-recenter-after-tag-follow       nil
	  treemacs-recenter-after-project-jump     'always
	  treemacs-recenter-after-project-expand   'on-distance
	  treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
	  treemacs-project-follow-into-home        nil
	  treemacs-show-cursor                     nil
	  treemacs-show-hidden-files               t
	  treemacs-silent-filewatch                nil
	  treemacs-silent-refresh                  nil
	  treemacs-sorting                         'alphabetic-asc
	  treemacs-select-when-already-in-treemacs 'move-back
	  treemacs-space-between-root-nodes        t
	  treemacs-tag-follow-cleanup              t
	  treemacs-tag-follow-delay                1.5
	  treemacs-text-scale                      nil
	  treemacs-user-mode-line-format           nil
	  treemacs-user-header-line-format         nil
	  treemacs-wide-toggle-width               70
	  treemacs-width                           35
	  treemacs-width-increment                 1
	  treemacs-width-is-initially-locked       t
	  treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode -1)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))

    (pcase (cons (not (null (executable-find "git")))
		 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
	("C-`"       . treemacs-select-window)
	("C-x t 1"   . treemacs-delete-other-windows)
	("C-x t t"   . treemacs)
	("C-x t d"   . treemacs-select-directory)
	("C-x t B"   . treemacs-bookmark)
	("C-x t C-t" . treemacs-find-file)
	("C-x t M-t" . treemacs-find-tag)))

;; (use-package treemacs-evil
;;   :after (treemacs evil)
;;   :ensure t)

;; (use-package treemacs-projectile
;;   :after (treemacs projectile)
;;   :ensure t)

;; (use-package treemacs-icons-dired
;;   :hook (dired-mode . treemacs-icons-dired-enable-once)
;;   :ensure t)

;; (use-package treemacs-magit
;;   :after (treemacs magit)
;;   :ensure t)

;; (use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
;;   :after (treemacs persp-mode) ;;or perspective vs. persp-mode
;;   :ensure t
;;   :config (treemacs-set-scope-type 'Perspectives))

;; (use-package treemacs-tab-bar ;;treemacs-tab-bar if you use tab-bar-mode
;;   :after (treemacs)
;;   :ensure t
;;   :config (treemacs-set-scope-type 'Tabs))

;; jump to treemacs window with ace mode
;; didn't manage this to work, need to  do "after" somehow
;; https://github.com/doomemacs/doomemacs/issues/1177
;; (setq aw-ignored-buffers (delq 'treemacs-mode aw-ignored-buffers))






(use-package dired
  :ensure nil                         ;no need for t, because dired is built in
  :custom ((dired-listing-switches "-agho --group-directories-first"))) ;sort directories first
(global-set-key (kbd "C-x C-d") 'dired-jump) ;open dired buffer in current location
;; (define-key dired-mode-map (kbd "f") 'dired-find-alternate-file)
;; (global-set-key (kbd "C-x d") 'dired)

;; [2022-03-11 Pn] Adding more colors to dired buffers
;; 22-05-19 isjungiau spalvas - maziau lago
;; (use-package diredfl
;;   :ensure t
;;   :after (dired)
;;   :config
;;   (diredfl-global-mode 1))

;; [2022-03-11 Pn]
;; [[https://github.com/clemera/dired-git-info][dired-git-info]]. This
;; Emacs packages provides a minor mode which shows git information
;; inside the dired buffer.

(use-package dired-git-info
  :ensure t
  :after dired)

;; Bind the minor mode command in dired

;; (with-eval-after-load 'dired
;;   (define-key dired-mode-map ")" 'dired-git-info-mode))

;; Dont hide normal Dired file info

;; (setq dgi-auto-hide-details-p nil)

;; Enable automatically in every Dired buffer (if in Git repository)
;; (add-hook 'dired-after-readin-hook 'dired-git-info-auto-enable)


;; [2021-07-01] “Company” provides autosuggestion/completion in
;; buffers (writing code, pathing to files, etc). press <f1> to
;; display the documentation for the selected candidate or C-w to see
;; its source tas dropdown su suggestions, works perfectly wiht elisp
;; out of the box

(use-package company
  :after lsp-mode
  :config
  ; lb svarbu, instant suggestion
  (setq company-idle-delay 0)
  ;; (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t)
  ; flip when narrow place
  (setq company-tooltip-flip-when-above nil)
  (global-company-mode))

;turn off company auto-completion in eshell, because it adds annoying spaces after each completion.. like ls, sucks
(add-hook 'eshell-mode-hook (lambda () (company-mode -1)) 'append)

;; turn off company mode in org major mode. Annoying suggestions with each word.
(defun jpk/org-mode-hook ()
  (company-mode -1))
(add-hook 'org-mode-hook #'jpk/org-mode-hook)

;; makes lsp crash - https://github.com/emacs-lsp/lsp-mode/discussions/3781#discussioncomment-3992134
;; (use-package company-quickhelp
;;   :ensure t
;;   :config
;;   (company-quickhelp-mode 1)
;;   (eval-after-load 'company
;;     '(define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin)))
;; (setq company-quickhelp-delay 0)

;; [2021-07-01]”Undo tree” lets me to return to the file stage before
;; any modifications were made. Keybind - C-x u.

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))
(setq undo-tree-auto-save-history nil)
