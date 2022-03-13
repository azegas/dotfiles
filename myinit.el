;; Increase the garbage collection threshold to 100MB to reduced startup time.
;; See https://www.reddit.com/r/emacs/comments/3kqt6e
(setq gc-cons-threshold (* 1024 1024 100))
;; Turn off mouse interface early in startup to avoid momentary display
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq visible-bell t)
(blink-cursor-mode 0)
(global-hl-line-mode 1)
(add-to-list 'custom-theme-load-path "/home/arvydas/Dropbox/src/emacs/misc/")
;; (load-theme 'default-black t)
;; show where buffers end.
(setq-default indicate-empty-lines t)
;; Delete marked region when typing over it. Woooow.
(delete-selection-mode t)

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
;; turn off the error message at emacs launch
(setq ad-redefinition-action 'accept)
;; Show startup time on emacs-load
(defun efs/display-startup-time ()
(message "Emacs loaded in %s with %d garbage collections."
(format "%.2f seconds"
(float-time
(time-subtract after-init-time before-init-time)))
gcs-done))

;; no more annoying buffer list combinatios
(global-set-key (kbd "C-x C-b") 'switch-to-buffer)

(add-hook 'emacs-startup-hook #'efs/display-startup-time)

;; Use a persistent "inbox.org" as the initial buffer.
(setq initial-buffer-choice "~/Dropbox/documents/org/inbox.org")

;; writes parens automatically for you
(electric-pair-mode +1)
;; highlight parenthesis
(show-paren-mode 1)
;; Show matching parens
(setq show-paren-delay 0)

;; Easily jump to my main org file
(defun aga-find-current nil
"Find the myinit.org file."
(interactive)
(find-file "~/Dropbox/src/emacs/myinit.org") ;; Ubuntu
;; (find-file "C:\\Users\\Arvydas\\Dropbox\\7.dotfiles\\usable_emacs\\myinit.org") ;; windows
(delete-other-windows))
;; Find my NEW init file
(global-set-key (kbd "C-x <C-backspace>") 'aga-find-current)

;; Easily jump to my main org file
(defun aga-find-old nil
"Find the myinit.org file."
(interactive)
(find-file "~/Dropbox/src/random_dotfiles/emacs + org (summer)/myinit.org") ;; ubuntu
;; (find-file "C:\\Users\\Arvydas\\Dropbox\\7.dotfiles\\emacs + org (summer)\\myinit.org") ;; windows
(delete-other-windows))
;; Find OLD init file
(global-set-key (kbd "C-x <C-home>") 'aga-find-old)

;; open my django docs
(defun django-docs nil
"Find the myinit.org file."
(interactive)
(find-file "~/Dropbox/documents/org/notes/django_notes.org")) ;; ubuntu
(global-set-key [f5] 'django-docs)

(column-number-mode 1)
(size-indication-mode 1)

;; (global-display-line-numbers-mode 1)
(add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; (add-hook 'text-mode-hook 'flyspell-mode)
;; (add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; start wrapping at 80 characterers
(setq fill-column 80)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(setq whitespace-style '(face trailing tabs tab-mark))
(global-whitespace-mode)

(setq make-backup-files nil)
(setq auto-save-list-file-name  nil)
(setq auto-save-default nil)

(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Exit Emacs? "))
      (if (< emacs-major-version 22)
	  (save-buffers-kill-terminal)
	(save-buffers-kill-emacs))
    (message "Canceled exit")))

(when window-system
  (global-set-key (kbd "C-x C-c") 'ask-before-closing))

;; test
(setq-default indent-tabs-mode nil)

;; ;; Initialize package sources
;; (require 'package)

;; (setq package-archives '(("melpa" . "https://melpa.org/packages/")
;;                          ("org" . "https://orgmode.org/elpa/")
;;                          ("elpa" . "https://elpa.gnu.org/packages/")))

;; (package-initialize)
;; (unless package-archive-contents
;;  (package-refresh-contents))


;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

;; (org-babel-load-file (expand-file-name "~/Dropbox/src/emacs/myinit.org"))

;; Save backup files to a dedicated directory.
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)

;; Make numeric backup versions unconditionally.
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  (setq which-key-idle-delay 0.2)
  :config
  (which-key-mode 1))

(use-package try
	:ensure t)

;; (use-package fill-column-indicator
;;   :ensure t)

;; (setq fci-rule-width 1)
;; (setq fci-rule-column 80)

;; (add-hook 'text-mode-hook #'fci-mode)
;; (add-hook 'prog-mode-hook #'fci-mode)

(use-package neotree
:ensure t
:init
(setq neo-smart-open t
	 neo-autorefresh t
	 neo-force-change-root t)
	 (setq neo-theme (if (display-graphic-p) 'icons global))
	 (setq neo-window-width 35)
	 (global-set-key [f8] 'neotree-toggle))

;; Launch neotree when opening emacs. First launch, then switch to another window.
  ;; (defun neotree-startup ()
  ;;   (interactive)
  ;;   (neotree-show)
  ;;   (call-interactively 'other-window))

  ;; (if (daemonp)
  ;;     (add-hook 'server-switch-hook #'neotree-startup)
  ;;     (add-hook 'after-init-hook #'neotree-startup))

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-palenight t))

(use-package doom-modeline
    :ensure t
    :init (doom-modeline-mode 1)
    :custom
    (doom-modeline-irc nil))

(set-face-attribute 'mode-line nil
                    :background "#353644"
                    :foreground "white"
                    :box '(:line-width 2 :color "#353644")
                    :overline nil
                    :underline nil)

(set-face-attribute 'mode-line-inactive nil
                    :background "#565063"
                    :foreground "white"
                    :box '(:line-width 2 :color "#565063")
                    :overline nil
                    :underline nil)

(use-package all-the-icons-ivy-rich
:ensure t
:init (all-the-icons-ivy-rich-mode 1))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode t))

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

(use-package saveplace
  :ensure t
  :config
  ;; activate it for all buffers
  (setq-default save-place t)
  (save-place-mode 1))

(winner-mode +1)

(use-package ace-window
  :ensure t
  :init (setq aw-keys '(?q ?w ?e ?r ?y ?h ?j ?k ?l)
                                        ;aw-ignore-current t ; not good to turn off since I wont be able to do c-o o <current>
              aw-dispatch-always t)
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

(use-package undo-tree
:ensure t
:init
(global-undo-tree-mode))

(use-package rg
  :ensure t
  :config)

;; ace window integration - BUTINA
(use-package super-save
  :ensure t
  :config
  (setq super-save-auto-save-when-idle t)
  (setq super-save-idle-duration 5) ;; after 5 seconds of not typing autosave
  ;; add integration with ace-window
  (add-to-list 'super-save-triggers 'ace-window)
  (super-save-mode +1))

(use-package avy
:ensure t
:bind
(("M-s" . avy-goto-char-timer)
("M-p" . avy-goto-word-1)))
; cool, makes the background darker
(setq avy-background t)

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package ivy
   :defer 0.1
   :diminish
   :bind (("C-c C-r" . ivy-resume)
   ("C-x B" . ivy-switch-buffer-other-window)) ; I never use this
   :custom

   (ivy-count-format "(%d/%d) ")
   ;; nice if you want previously opened buffers to appear after an
   ;; emacs shutdown
   (ivy-use-virtual-buffers t)
   :config (ivy-mode))

   (use-package ivy-rich
   :ensure t
   :init (ivy-rich-mode 1))

(use-package goto-chg
      :ensure t)
(global-set-key [(control ?.)] 'goto-last-change)
(global-set-key [(control ?,)] 'goto-last-change-reverse)

(use-package swiper
:after ivy
:bind (("C-s" . swiper)
      ("C-r" . swiper)))

(use-package dired
  :ensure nil                         ;no need for t, because dired is built in
  :custom ((dired-listing-switches "-agho --group-directories-first")))
(global-set-key (kbd "C-x C-d") 'dired-jump)
;; (global-set-key (kbd "C-x d") 'dired)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package ws-butler
  :ensure t
  :config
  (ws-butler-global-mode t))

(use-package multiple-cursors
  :ensure t)
  ;; :bind (("C-c m" . mc/mark-next-like-this)
  ;;        ("C-c u" . mc/unmark-next-like-this)))
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(use-package hungry-delete
:ensure t
:config
(global-hungry-delete-mode))

(use-package emojify
:ensure t
:hook (after-init . global-emojify-mode))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0) ; lb svarbu, instant suggestion
  ;; (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  ;; (setq company-minimum-prefix-length 2)
  (setq company-tooltip-align-annotations t)
  ;; invert the navigation direction if the the completion popup-isearch-match
  ;; is displayed on top (happens near the bottom of windows)
  (setq company-tooltip-flip-when-above t)
  (global-company-mode))

(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")
(setq elpy-get-info-from-shell t)
(use-package elpy
  :ensure t
  :custom (elpy-rpc-backend "jedi")
  :init
  (elpy-enable))
;; :bind (("M-." . elpy-goto-definition)))
;; (setq elpy-rpc-virtualenv-path 'current)
(set-language-environment "UTF-8")

;; (use-package elpy
;;   :init
;;   (elpy-enable)
;;   :config
;;   (setq python-shell-interpreter "python3"
;;         python-shell-interpreter-args "-i --simple-prompt")
;;   (add-hook 'python-mode-hook 'eldoc-mode)
;;   (setq elpy-rpc-python-command "python3")
;;   (setq elpy-shell-echo-output nil)
;;   (setq python-shell-completion-native-enable nil)
;;   (setq elpy-rpc-backend "jedi")
;;   (setq python-indent-offset 4
;;         python-indent 4))

(use-package company-quickhelp
  :ensure t
  :config
  (company-quickhelp-mode 1)
  (eval-after-load 'company
    '(define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin)))
(setq company-quickhelp-delay 0)

;; (setq pos-tip-foreground-color "#FFFFFF"
;; pos-tip-background-color "#FFF68F")

;; (defun my-python-line ()
;;  (interactive)
;;   (save-excursion
;;   (setq the_script_buffer (format (buffer-name)))
;;   (end-of-line)
;;   (kill-region (point) (progn (back-to-indentation) (point)))
;;   ;(setq the_py_buffer (format "*Python[%s]*" (buffer-file-name)))
;;   (setq the_py_buffer "*Python*")
;;   (switch-to-buffer-other-window  the_py_buffer)
;;   (goto-char (buffer-end 1))
;;   (yank)
;;   (comint-send-input)
;;   (switch-to-buffer-other-window the_script_buffer)
;;   (yank)
;;   )
;; )

;; (eval-after-load "elpy"
;;  '(define-key elpy-mode-map (kbd "C-c <C-return>") 'my-python-line))

(use-package diff-hl
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'diff-hl-mode)
  (add-hook 'org-mode-hook #'diff-hl-mode)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-post-refresh))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x C-g" . magit-status)))

(use-package emmet-mode
  :ensure t
  :config)
(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-engines-alist
        '(("django"    . "\\.html\\'")))
  (setq web-mode-ac-sources-alist
        '(("css" . (ac-source-css-property))
          ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
  (setq web-mode-enable-auto-closing t))
(setq web-mode-enable-auto-quoting t) ; this fixes the quote problem I mentioned
(setq web-mode-enable-current-element-highlight t)

(add-hook 'web-mode 'emmet-mode)

(use-package impatient-mode
  :ensure t
  :commands impatient-mode)

;; to be able to preview .md files
;; from here - https://stackoverflow.com/questions/36183071/how-can-i-preview-markdown-in-emacs-in-real-time
;; But Wait... with markdown-mode installed I can already see the markdown live in my emacs...
(defun markdown-html (buffer)
  (princ (with-current-buffer buffer
           (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://strapdownjs.com/v/0.2/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
         (current-buffer)))

(use-package counsel
:ensure t
:after ivy
:config (counsel-mode))

;; M-x org-agenda-file-list. Go there and click "save the changes"
;; MANUALLY to save to init.el. Otherwise, emacs wont read it on
;; every boot.  Write all org-agenda-files ONCE, do the procedure
;; described in the line above and forget about it. Refiling will
;; work, agenda will work.  if your org agenda files are not there,
;; do C-c C-e on the parentheses below. Evaluate them.
(setq org-agenda-files '("~/Dropbox/documents/org/"))
;; Use year/month/day
;; (setq calendar-date-style 'iso)
;; Stop preparing agenda buffers on startup
(setq org-agenda-inhibit-startup t)
;; when you press C-c C-z on a headline, it makes a note. Specifying the name of that drawyer.
;; C-c C-z - tiesiog make note under a heading
;; to log into drawer with c-c c-z, reikia:
;; m-x customise-variable RET org-log-into-drawer - select LOGBOOK save and apply.
(setq org-log-into-drawer "LOGBOOK")
;; No need to have two places to make notes. "clock" and "Logbook"
;; Put clock and logbook notes into one
(setq org-clock-into-drawer "LOGBOOK")
;; shortcut for opening agenda view
(global-set-key (kbd "C-c a") 'org-agenda)
;; hide any scheduled tasks that are already completed.
;; if I hide, i will forget to archive them.. not good
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-restore-windows-after-quit t)
;; (setq org-hide-emphasis-markers t) ; Hide * and / in org tex.
;; https://github.com/jezcope/dotfiles/blob/master/emacs.d/init-org.org - solved my refile problem
;; sitas geriausias ir paprasciausias krc. veikia puikiai su ivy.
(setq org-refile-targets '((org-agenda-files :maxlevel . 1)))
;; (setq org-refile-targets '(("~/Dropbox/documents/org/gtd.org" :maxlevel . 1)
;;                            ("~/Dropbox/documents/org/someday.org" :level . 1)
;;                            ("~/Dropbox/documents/org/tickler.org" :maxlevel . 1)))
;; quite nice, asks you to write a closing note for a task when it's marked as DONE
(setq org-log-done 'note)
;; This shortcut exists and works already in org files, but I made it
;; available from any buffer!! Useful when editing other type of files
;; and want to jump to your clocked task. Otherwise would have to open
;; agenda first and only then org-clock-goto.
;; C-h k - and writing C-c C-x C-j was very useful. Got name of the key.
(global-set-key (kbd "C-c C-x C-j") 'org-clock-goto)
;; heading indentation
;; do M-x revert-buffer if the changes doesn't appear. Should indent then
(setq org-startup-indented t)
;; RET to follow links
(setq org-return-follows-link t)
;; Prevent setting "done" on he heading if subheadings are not completed
(setq org-enforce-todo-dependencies t)
;; Prefix tasks with parent heading Instead of showing the filename
;; where the task resides, I show the first characters of the parent
;; heading. That way I can use short and generic task names and still
;; understand it in the agenda. No need to repeat the context in the
;; task name anymore.
(defun getlasthead ()
(let ((x (nth 0 (last (org-get-outline-path)))))
(if x
(if (> (string-width x) 15)
(concat "[" (org-format-outline-path (list (substring x 0 15))) "]")
(concat "[" (org-format-outline-path (list x)) "]"))
"")))
(setq org-agenda-prefix-format " %i %-20(getlasthead)%?-15t% s ")
;; keywords for org mode
(setq org-todo-keywords
(quote ((sequence "TODO(t)" "NEXT(n)" "IN-PROGRESS(p)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))))

;; When clocking in, change the state to "in progress", then when clocking out change state to "waiting".
    (setq org-clock-in-switch-to-state "IN-PROGRESS")
    (setq org-clock-out-switch-to-state "WAITING")

    ;; to see all the emacs predifined colors - M-x list-colors-display
    (setq org-todo-keyword-faces
             (quote (("TODO" :foreground "IndianRed1" :weight bold)
                     ("NEXT" :foreground "DeepSkyBlue2" :weight bold)
                     ("IN-PROGRESS" :foreground "gold1" :weight bold)
                     ("DONE" :foreground "forest green" :weight bold))))

;; ;; dont show habit tasks in "all todos" list.
;;     (defun air-org-skip-subtree-if-habit ()
;;       "Skip an agenda entry if it has a STYLE property equal to \"habit\"."
;;       (let ((subtree-end (save-excursion (org-end-of-subtree t))))
;;         (if (string= (org-entry-get nil "STYLE") "habit")
;;             subtree-end
;;           nil)))

;; ;; defining a function to skip the tasks with priorities in the "all todo's list"
;;       (defun air-org-skip-subtree-if-priority (priority)
;;       "Skip an agenda subtree if it has a priority of PRIORITY.

;;            PRIORITY may be one of the characters ?A, ?B, or ?C."
;;              (let ((subtree-end (save-excursion (org-end-of-subtree t)))
;;                    (pri-value (* 1000 (- org-lowest-priority priority)))
;;                    (pri-current (org-get-priority (thing-at-point 'line t))))
;;                (if (= pri-value pri-current)
;;                    subtree-end
;;                  nil)))

;;   ;; Final agenda view look
;;   (setq org-agenda-custom-commands
;;         '(("a" "Daily agenda and all TODOs"
;;            ((tags "PRIORITY=\"A\""
;;                   ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
;;                    (org-agenda-overriding-header "High-priority unfinished tasks:")))
;;             (agenda "" ((org-agenda-span 3)))
;;             (alltodo ""
;;                      ((org-agenda-skip-function '(or (air-org-skip-subtree-if-habit)
;;                                                      (air-org-skip-subtree-if-priority ?A)
;;                                                      (org-agenda-skip-if nil '(scheduled deadline))))
;;                       (org-agenda-overriding-header "ALL normal priority tasks:")))))))

;; Show agenda + started tasks with "waiting" label
      (setq org-agenda-custom-commands
            '(("a" "Daily agenda and all TODOs"
               ((agenda "" ((org-agenda-span 2)))
               (tags-todo "/+WAITING"
                      ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                       (org-agenda-overriding-header "Started tasks:")))
               (tags-todo "/+NEXT"
                      ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                       (org-agenda-overriding-header "NEXT actions:")))))))

;; ;; Show completed tasks
;;   (add-to-list 'org-agenda-custom-commands
;;                '("f" "Finished tasks only DONE tasks"
;;                  agenda ""
;;                  ((org-agenda-start-on-weekday 1)
;;                   (org-agenda-start-with-log-mode '(closed))
;;                   (org-agenda-skip-function '(org-agenda-skip-entry-if 'notregexp "^\\*\\* DONE ")))))
;; (org-agenda-archives-mode t)

(use-package org-habit
  :ensure nil
  :config)
;; (setq org-habit-show-habits-only-for-today t))
(setq org-habit-graph-column 72) ;push little further to the rigth

(setq org-log-note-clock-out t)
  ;; Clock out when moving task to a done state
  (setq org-clock-out-when-done t)
  ;; Resume clocking task when emacs is restarted
  (org-clock-persistence-insinuate)
  ;; Save the running clock and all clock history when exiting Emacs, load it on startup
  (setq org-clock-persist t)
  ;; Resume clocking task on clock-in if the clock is open
  (setq org-clock-in-resume t)
  ;; Do not prompt to resume an active clock, just resume it
  (setq org-clock-persist-query-resume nil)

;; clocktable example
;; displays weekdays
;; #+BEGIN: clocktable :maxlevel 3 :scope file :step day :tstart "<-1w>" :tend "<now>" :compact t
;; #+BEGIN: clocktable :maxlevel 5 :compact nil :emphasize t :scope subtree :timestamp t :link t :header "#+NAME: 2022_Vasaris\n"
;; #+BEGIN: clocktable :maxlevel 1 :compact t :emphasize t :timestamp t :link t
;; #+BEGIN: clocktable :maxlevel 5 :compact t :sort (1 . ?a) :emphasize t :scope subtree :timestamp t :link t

;; To create an estimate for a task or subtree start column mode with C-c C-x C-c and collapse the tree with c
                                        ; Set default column view headings: Task Effort Clock_Summary
(setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

                                        ; global Effort estimate values
                                        ; global STYLE property values for completion
(setq org-global-properties (quote (("Effort_ALL" . "0 0:10 0:30 1:00 2:00 3:00 4:00")
                                    ("STYLE_ALL" . "habit"))))

(global-set-key [f9] 'org-agenda-filter-by-effort)

;; useful org-capture document - https://orgmode.org/manual/Template-expansion.html
;; setting up the templates for c-c c
;; genius. that effort.

;; MANY small files below
(define-key global-map "\C-cc" 'org-capture)
;; (setq org-capture-templates '(
;; ("a" "Arvydas.dev" entry (file+headline "~/Dropbox/documents/org/arvydasdev.org" "arvydas.dev") "* TODO %?\n%^{Effort}p")
;; ("e" "Emacs" entry (file+headline "~/Dropbox/documents/org/src_emacs.org" "Emacs") "* TODO %?\n%^{Effort}p")
;; ("s" "Smuti Fruti" entry (file+headline "~/Dropbox/documents/org/src_smutifruti.org" "Smuti Fruti") "* TODO %?\n%^{Effort}p")
;; ("f" "Facebook_django" entry (file+headline "~/Dropbox/documents/org/src_facebook_django.org" "Facebook_django") "* TODO %?\n%^{Effort}p")
;; ("p" "Personal" entry (file+headline "~/Dropbox/documents/org/personal.org" "Personal") "* TODO %?\n%^{Effort}p")
;; ("d" "Diary" entry (file+datetree "~/Dropbox/documents/org/notes/diary.org" "Diary") "* %U %^{Title}\n%?")))
;; ("p" "Planned" entry (file+headline "~/Dropbox/1.planai/tickler.org" "Planned") "* %i%? %^{SCHEDULED}p" :prepend t)
;; ("r" "Repeating" entry (file+headline "~/Dropbox/1.planai/tickler.org" "Repeating") "* %i%? %^{SCHEDULED}p")))

;; ONE BIG FILE BELOW
(setq org-capture-templates '(
                              ("i" "Inbox" entry (file+headline "~/Dropbox/documents/org/inbox.org" "Inbox") "* TODO %?\n%^{Effort}p")
                              ("t" "Tickler" entry (file+headline "~/Dropbox/documents/org/tickler.org" "Tickler") "* %? \n%^{SCHEDULED}p")
                              ("e" "Emacs" entry (file+headline "~/Dropbox/documents/org/emacs.org" "Emacs") "* TODO %?\n%^{Effort}p")
                              ("s" "Smuti Fruti" entry (file+headline "~/Dropbox/documents/org/smuti_fruti.org" "Smuti Fruti") "* TODO %?\n%^{Effort}p")
                              ("f" "Facebook" entry (file+headline "~/Dropbox/documents/org/facebook.org" "Facebook") "* TODO %?\n%^{Effort}p")
                              ("d" "Diary" entry (file+datetree "~/Dropbox/documents/org/references/diary.org" "Diary") "* %U %^{Title}\n%?")))

;; headings, jeigu ka
      ;; '(org-level-1 ((t (:inherit outline-1 :height 1.1)
    ;; when editing code blocks, treat them with proper indentation

  ;; https://orgmode.org/manual/Editing-Source-Code.html
    (setq org-src-fontify-natively t)
    (setq org-src-tab-acts-natively t)
  ;; timer
(setq org-clock-sound "~/Dropbox/src/emacs/misc/bell.wav")

(setq erc-server "irc.libera.chat"
      erc-nick "Arvydas"
      erc-port 6697
      erc-user-full-name "This and that"
      erc-track-shorten-start 8
      erc-autojoin-channels-alist '(("irc.libera.chat" "#systemcrafters" "#emacs")))
      ;; erc-kill-buffer-on-part t
      ;;       erc-auto-query 'bury)

(setq erc-autojoin-channels-alist
        '(("irc.libera.chat" "#emacs" "#wiki" "#nethack")))

;;;============================================================================
;;;
;;; Build interface to look how I want it to look
;;; what about a new line
;;;
;;;============================================================================

;; (use-package smooth-scroll
;;    :ensure t)
;; (smooth-scroll-mode t)
;; (global-set-key [(control  down)]  'scroll-up-1)
;; (global-set-key [(control  up)]    'scroll-down-1)
;; (global-set-key [(control  left)]  'scroll-right-1)
;; (global-set-key [(control  right)] 'scroll-left-1)

;; (use-package smooth-scrolling
;;   :ensure t)

;; (use-package python-mode
;;   :ensure t
;;   :hook (python-mode . lsp-deferred)
;;   :custom
;;   (python-shell-interpreter "python3"))

;; (defun efs/lsp-mode-setup ()
;;   (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
;;   (lsp-headerline-breadcrumb-mode))

;; (use-package lsp-mode
;;   :ensure t
;;   :commands (lsp lsp-deferred)
;;   :hook (lsp-mode . efs/lsp-mode-setup)
;;   :init
;;   (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
;;   :config
;;   (lsp-enable-which-key-integration t))

;; ;; enable docstring popup, tree at the top and other ui stuff
;; (use-package lsp-ui
;;   :ensure t
;;   :hook (lsp-mode . lsp-ui-mode)
;;   :custom
;;   (lsp-ui-doc-enable t)
;;   (lsp-ui-doc-position 'at-point)
;;   (lsp-ui-doc-show-with-cursor t)
;;   (lsp-ui-doc-delay 0.5))

;; ;; removed some stuff according to [[https://www.youtube.com/watch?v=Lu5XXoRjKUQ][this video]]
;; ;; Suggestions from official docs for performance
;; (setq gc-cons-threshold 100000000)
;; (setq lsp-completion-provider :capf)
;; (setq lsp-idle-delay 0.500)
;; (setq lsp-log-io nil)

;; ;; Annoying stuff
;; (setq lsp-enable-links nil)
;; (setq lsp-signature-render-documentation nil)
;; (setq lsp-headerline-breadcrumb-enable nil)
;; (setq lsp-ui-doc-enable nil)
;; (setq lsp-completion-enable-additional-text-edit nil)

;; (use-package dumb-jump
;;   :bind (("M-g o" . dumb-jump-go-other-window)
;;          ("M-g j" . dumb-jump-go)
;;          ("M-g x" . dumb-jump-go-prefer-external)
;;          ("M-g z" . dumb-jump-go-prefer-external-other-window))
;;   :config
;;   (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
;; :init
;; (dumb-jump-mode)
;;   :ensure)

;; (use-package move-text
;;   :ensure t)
;; (move-text-default-bindings)

;; (use-package iedit
;; :ensure t
;;   :bind (("C-;" . iedit-mode)))

;; (use-package popwin
;; :ensure t
;; :config
;; (popwin-mode 1))

;; (use-package eww
;;   :commands eww eww-follow-link
;;   :init
;;   (setq browse-url-browser-function 'eww-browse-url)
;;   (setq eww-search-prefix "http://www.google.com/search?q=")

;;   (defun eww-wiki (text)
;;     "Function used to search wikipedia for the given text."
;;     (interactive (list (read-string "Wiki for: ")))
;;     (eww (format "https://en.m.wikipedia.org/wiki/Special:Search?search=%s"
;;                  (url-encode-url text))))

;;   :bind (("C-c w w" . eww)
;;          ("C-c w i" . eww-wiki)
;;          ("C-c w l" . eww-follow-link)))

;;   ;; Eww is cool, but pls open links in chrome. ty
;;   (setq browse-url-browser-function 'browse-url-generic
;;   browse-url-generic-program "google-chrome")

(use-package yasnippet                  ; Snippets
  :ensure t)
  (yas-global-mode 1)
(use-package yasnippet-snippets         ; Collection of snippets
  :ensure t)

;; (use-package markdown-mode
;;   :ensure t
;;   :commands (markdown-mode gfm-mode)
;;   :mode (("README\\.md\\'" . gfm-mode)
;;         ("\\.md\\'" . markdown-mode)
;;         ("\\.markdown\\'" . markdown-mode))
;;   :init (setq markdown-command "multimarkdown"))
