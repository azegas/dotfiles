;; Who I am

(require 'json)

(setq user-full-name "Arvydas Gasparaviciusn")
(setq user-mail-address "arvydas.gaspa@gmail.com")

;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode 0)

;; Show where buffers end.
(setq-default indicate-empty-lines t)

;; be able to create directories in neotree
(global-set-key (kbd "C-c d") 'make-directory)
;; This shortcut exists and works already in org files, but I made it
;; available from any buffer!! Useful when editing other type of files
;; and want to jump to your clocked task. Otherwise would have to open
;; agenda first and only then org-clock-goto.
;; C-h k - and writing C-c C-x C-j was very useful. Got name of the key.
(global-set-key (kbd "C-c C-x C-j") 'org-clock-goto)

;; start wrapping at 80 characters?
(setq fill-column 80)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Show how many characters in a buffer
;; nice, just add whatever you like to the modeline
;; link of variables http://doc.endlessparentheses.com/Var/mode-line-format
(add-to-list 'global-mode-string '(" %i"))

;; Eww is cool, but pls open links in chrome. ty
(setq browse-url-browser-function 'browse-url-generic
browse-url-generic-program "google-chrome")

;; column-number in mode-line.
(column-number-mode 1)

;; file size indication in mode-line.
(size-indication-mode 1)

;; Disable indent-tabs-mode omg, a lifesaver in org mode.  Usually I
;; would be able to get to left border, but now it prevents me from
;; doing so. Meaning - everything is aligned perfectly, no more - [ ]
;; out of order and tempate dates are out of order, not aligned... perfect!!
;; actually, not sure what this does, lol. Everything is aligned anyw
(setq-default indent-tabs-mode nil)

;; or do
;; (global-set-key (kbd "C-c q") 'auto-fill-mode)

;; Be aware of whitespace.
(setq whitespace-style '(face trailing tabs tab-mark))
(global-whitespace-mode)

;; maximize my Emacs frame on start-up
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;disable splash screen and startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; highlight the current line
(global-hl-line-mode 1)

;; Delete marked region when typing over it. Woooow.
(delete-selection-mode t)

;; writes parens automatically for you
(electric-pair-mode +1)

(menu-bar-mode -1)            ; Disable the menu bar
(tool-bar-mode -1)          ; Disable the toolbar
(toggle-scroll-bar -1) ; turn off scrollbar
(show-paren-mode 1) ; highlight parenthesis

;; no need for this.. geting "Warning: desktop file appears to be in
;; use by PID xxx" error.. neotree is not an "unclosable" buffer anymore.. fuck it.
;; (setq desktop-save-mode 1)
;; (setq desktop-path '("~/.emacs.d/.cache/"))
;; (desktop-read)


;; Show matching parens
(setq show-paren-delay 0)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Set up the visible bell
(setq visible-bell t)

;; nice scrolling
(setq scroll-margin 0
scroll-conservatively 100000
scroll-preserve-screen-position 1)

;; never lose the layout c-c left/right
(winner-mode 1)

;; ; display line numbers - finally...
;; (global-display-line-numbers-mode 1)

;; (load-theme 'zenburn t)

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

(use-package ace-window
    :ensure t
    :init (setq aw-keys '(?q ?w ?e ?r ?y ?h ?j ?k ?l)
;		aw-ignore-current t ; not good to turn off since I wont be able to do c-o o <current>
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

(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  (setq which-key-idle-delay 0.2)
  :config
  (which-key-mode 1))

(use-package saveplace
  :ensure t
  :config
  ;; activate it for all buffers
  (setq-default save-place t)
  (save-place-mode 1)
)

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package undo-tree
:ensure t
:init
(global-undo-tree-mode))

(use-package counsel
:ensure t
:after ivy
:config (counsel-mode))

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

;; Automatically generated backups
(setq backup-directory-alist '(("." . "~/Dropbox/documents/org/emacs_backups/emacs_backups/")))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x C-g" . magit-status)))

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
    ;;	     ("M-g f" . avy-goto-line)
		 ("M-p" . avy-goto-word-1)))
;;  You can check the avy home page for their recommended configuration which you get by configuring this way instead:
    ;; (use-package avy
    ;; :ensure t
    ;; :config
    ;; (avy-setup-default))
    (setq avy-background t) ; cool, makes the background darker

(use-package move-text
  :ensure t)
(move-text-default-bindings)

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

(use-package ivy
:defer 0.1
:diminish
:bind (("C-c C-r" . ivy-resume)
("C-x B" . ivy-switch-buffer-other-window)) ; I never use this
:custom

(ivy-count-format "(%d/%d) ")
;; nice if you want before opened buffers to appear after a close
(ivy-use-virtual-buffers t)
:config (ivy-mode))

(use-package ivy-rich
:ensure t
:init (ivy-rich-mode 1))

(use-package swiper
:after ivy
:bind (("C-s" . swiper)
       ("C-r" . swiper)))

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
  (defun neotree-startup ()
    (interactive)
    (neotree-show)
    (call-interactively 'other-window))

  (if (daemonp)
      (add-hook 'server-switch-hook #'neotree-startup)
      (add-hook 'after-init-hook #'neotree-startup))

(use-package all-the-icons-ivy-rich
:ensure t
:init (all-the-icons-ivy-rich-mode 1))

(use-package hungry-delete
:ensure t
:config
(global-hungry-delete-mode))

(use-package emmet-mode
:ensure t
:config
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode)) ;; enable Emmet's css abbreviation.

(use-package emojify
:ensure t 
:hook (after-init . global-emojify-mode))

(use-package rg
  :ensure t
  :config)

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

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config
  (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
:init
(dumb-jump-mode)
  :ensure
)

;; M-x org-agenda-file-list. Go there and click "save the changes" MANUALLY to save to init.el. Otherwise, emacs wont read it on every boot.
;; Write all org-agenda-files ONCE, do the procedure described in the line above and forget about it. Refiling will work, agenda will work.
;; if your org agenda files are not there, do C-c C-e on the parentheses below. Evaluate them.

;; (setq org-agenda-files '("~/Dropbox/documents/org/seima.org"
;; "~/Dropbox/documents/org/refile.org"
;; "~/Dropbox/documents/org/smutifruti.org"
;; "~/Dropbox/documents/org/dpd.org"
;; "~/Dropbox/documents/org/facebook_django.org"
;; "~/Dropbox/documents/org/personal.org"
;; "~/Dropbox/documents/org/arvydasdev.org"
;; "~/Dropbox/documents/org/diary.org"))


(setq org-agenda-files '("~/Dropbox/documents/org/"))

;;Initial visbility doesn't want to work with global variable, so
;; better set #+STARTUP: fold and alike in each file
;; (setq org-startup-folded t)

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
(setq org-refile-targets '((org-agenda-files :maxlevel . 4)))

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
;; quite nice, asks you to write a closing note for a task when it's marked as DONE
(setq org-log-done 'note)

(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("laptop" . ?l)))


;; useful org-capture document - https://orgmode.org/manual/Template-expansion.html
;; setting up the templates for c-c c
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates '(
("a" "Arvydas.dev" entry (file+headline "~/Dropbox/documents/org/arvydasdev.org" "arvydas.dev") "* TODO %?\n%U%^{Effort}p")
("e" "Emacs" entry (file+headline "~/Dropbox/documents/org/src_emacs.org" "Emacs") "* TODO %?\n%U%^{Effort}p")
("s" "Smuti Fruti" entry (file+headline "~/Dropbox/documents/org/src_smutifruti.org" "Smuti Fruti") "* TODO %?\n%U%^{Effort}p")
("f" "Facebook_django" entry (file+headline "~/Dropbox/documents/org/src_facebook_django.org" "Facebook_django") "* TODO %?\n%U%^{Effort}p")
("p" "Personal" entry (file+headline "~/Dropbox/documents/org/personal.org" "Personal") "* TODO %?\n%U%^{Effort}p")
("d" "Diary" entry (file+datetree "~/Dropbox/documents/org/notes/diary.org" "Diary") "* %U %^{Title}\n%?")
("r" "Refile" entry (file+headline "~/Dropbox/documents/org/refile.org" "Refile")"* TODO %?\n%U%^{Effort}p"))) ;; genius. that effort.
;; ("p" "Planned" entry (file+headline "~/Dropbox/1.planai/tickler.org" "Planned") "* %i%? %^{SCHEDULED}p" :prepend t)
;; ("r" "Repeating" entry (file+headline "~/Dropbox/1.planai/tickler.org" "Repeating") "* %i%? %^{SCHEDULED}p")))

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


;; dont show habit tasks in "all todos" list.
  (defun air-org-skip-subtree-if-habit ()
    "Skip an agenda entry if it has a STYLE property equal to \"habit\"."
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (if (string= (org-entry-get nil "STYLE") "habit")
	  subtree-end
	nil)))

	;; defining a function to skip the tasks wiht priorities in the "all todo's list"
    (defun air-org-skip-subtree-if-priority (priority)
    "Skip an agenda subtree if it has a priority of PRIORITY.

	 PRIORITY may be one of the characters ?A, ?B, or ?C."
	   (let ((subtree-end (save-excursion (org-end-of-subtree t)))
		 (pri-value (* 1000 (- org-lowest-priority priority)))
		 (pri-current (org-get-priority (thing-at-point 'line t))))
	     (if (= pri-value pri-current)
		 subtree-end
	       nil)))

;; Final agenda view look
(setq org-agenda-custom-commands
      '(("a" "Daily agenda and all TODOs"
	 ((tags "PRIORITY=\"A\""
		((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
		 (org-agenda-overriding-header "High-priority unfinished tasks:")))
	  (agenda "" ((org-agenda-span 'day)))
	  (alltodo ""
		   ((org-agenda-skip-function '(or (air-org-skip-subtree-if-habit)
						   (air-org-skip-subtree-if-priority ?A)
						   (org-agenda-skip-if nil '(scheduled deadline))))
		    (org-agenda-overriding-header "ALL normal priority tasks:")))))))

(use-package org-habit
  :ensure nil
  :config)
  ;; (setq org-habit-show-habits-only-for-today t))

;; (require 'org-habit)
(setq org-habit-graph-column 50) ;push little further to the rigth
;; (setq org-habit-following-days 0)
;; (setq org-habit-preceding-days 30)

;; To create an estimate for a task or subtree start column mode with C-c C-x C-c and collapse the tree with c
; Set default column view headings: Task Effort Clock_Summary
(setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

; global Effort estimate values
; global STYLE property values for completion
(setq org-global-properties (quote (("Effort_ALL" . "0 0:10 0:30 1:00 2:00 3:00 4:00")
                                    ("STYLE_ALL" . "habit"))))

(global-set-key [f9] 'org-agenda-filter-by-effort)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")
(setq elpy-get-info-from-shell t)
(use-package elpy
  :ensure t
  ;; :custom (elpy-rpc-backend "jedi")
  :init
  (elpy-enable))

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

(use-package iedit
:ensure t
  :bind (("C-;" . iedit-mode)))

(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode t))

(use-package ws-butler
  :ensure t
  :config
  (ws-butler-global-mode t))

(use-package popwin
:ensure t
:config
(popwin-mode 1))

(use-package eww
  :commands eww eww-follow-link
  :init
  (setq browse-url-browser-function 'eww-browse-url)
  (setq eww-search-prefix "http://www.google.com/search?q=")

  (defun eww-wiki (text)
    "Function used to search wikipedia for the given text."
    (interactive (list (read-string "Wiki for: ")))
    (eww (format "https://en.m.wikipedia.org/wiki/Special:Search?search=%s"
                 (url-encode-url text))))

  :bind (("C-c w w" . eww)
         ("C-c w i" . eww-wiki)
         ("C-c w l" . eww-follow-link)))

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-palenight t)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

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

(use-package yasnippet                  ; Snippets
  :ensure t)
  (yas-global-mode 1)
(use-package yasnippet-snippets         ; Collection of snippets
  :ensure t)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
