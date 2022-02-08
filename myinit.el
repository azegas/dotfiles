;; Who I am

  ;; be able to create directories in neotree
  (global-set-key (kbd "C-c d") 'make-directory)

  (setq user-full-name "Arvydas Gasparaviciusn")
  (setq user-mail-address "arvydas.gaspa@gmail.com")
  ;; the blinking cursor is nothing, but an annoyance
  (blink-cursor-mode 0)

  ;; highlight the current line
  (global-hl-line-mode 1)

  ;; writes parens automatically for you
  (electric-pair-mode +1)  

  (menu-bar-mode -1)            ; Disable the menu bar
  (tool-bar-mode -1)          ; Disable the toolbar
  (toggle-scroll-bar -1) ; turn off scrollbar
  (show-paren-mode 1) ; highlight parenthesis

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
  ;; (load-theme 'wombat t)
  (load-theme 'ample t)
  ;; (load-theme 'waher t)
  ;; (load-theme 'spacegray t)
  ;; (load-theme 'ample t)

;; startup & default view
;; copied from old config, dont remember what any of it does below
  (custom-set-variables
   '(org-hide-leading-stars t)
   '(org-startup-folded (quote t))	;PAGALIAU!!!
   '(org-startup-indented t)
   '(org-startup-indented t)	        ;this is amazing, no need to care about pressing TAB (when diary f.x.) "Org Indent Mode"
   '(org-startup-with-inline-images t)
   '(org-startup-with-latex-preview t)
   '(org-confirm-babel-evaluate nil)
   '(org-src-fontify-natively t)
   '(org-export-with-toc nil)
   )

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
  (find-file "~/Dropbox/org/django.org")) ;; ubuntu
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
  '((?x aw-delete-window " Ace - Delete Window")
      (?m aw-swap-window " Ace - Swap Window")
      (?n aw-flip-window)
      (?h aw-split-window-vert " Ace - Split Vert Window")
      (?v aw-split-window-horz " Ace - Split Horz Window")
      (?i delete-other-windows " Ace - Maximize Window")
      (?o delete-other-windows))
  "List of actions for `aw-dispatch-default'.")

(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  (setq which-key-idle-delay 0.2)
  :config
  (which-key-mode 1))

;; saveplace remembers your location in a file when saving files
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

;; Counsel, a collection of Ivy-enhanced versions of common Emacs commands.
(use-package counsel
:ensure t
:after ivy
:config (counsel-mode))

;; Company provides autosuggestion/completion in buffers (writing code, pathing to files, etc).
;; press <f1> to display the documentation for the selected candidate
;; or C-w to see its source
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

(setq default-directory "~/Dropbox/1.planai/")
;; ;Backups
;; (setq backup-directory-alist '(("." . "~/Dropbox/7.dotfiles/usable_emacs/MyEmacsBackups")))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; install git first on emacs - https://www.youtube.com/watch?v=ZMgLZUYd8Cw
;; use personal access token
;; add this to terminal to save the token for furher use
;; git config --global credential.helper store
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

;; simple explanation https://github.com/skeeto/impatient-mode
;; M-x httpd-start - or maybe directory would be nice
;; M-x impatient-mode - on EACH and EVERY file (css, js and hmtl)
(use-package impatient-mode
  :ensure t
  :commands impatient-mode)

;; Ivy is a generic completion mechanism for Emacs.
(use-package ivy
:defer 0.1
:diminish
:bind (("C-c C-r" . ivy-resume)
("C-x B" . ivy-switch-buffer-other-window))
:custom

(ivy-count-format "(%d/%d) ")
;; nice if you want before opened buffers to appear after a close
(ivy-use-virtual-buffers t)
:config (ivy-mode))

(use-package ivy-rich
:ensure t
:init (ivy-rich-mode 1))

;; Swiper, an Ivy-enhanced alternative to Isearch.
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

;; jeigu neveikia icons - prasau, paaiskinimas
;; https://github.com/seagle0128/all-the-icons-ivy-rich
(use-package all-the-icons-ivy-rich
:ensure t
:init (all-the-icons-ivy-rich-mode 1))

; deletes all the whitespace when you hit backspace or delete
  (use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

;; SU WEB MODE KRC PRADEDA flycheck nebeveikti ir emmet durniuoja
;; for quickly entering HTML
;; c-j to autocomplete 
;; cheat sheet - https://docs.emmet.io/cheat-sheet/
(use-package emmet-mode
:ensure t
:config
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode)) ;; enable Emmet's css abbreviation.

;; for facebook auto posting
(use-package emojify
:ensure t 
:hook (after-init . global-emojify-mode))

;; sudo apt install ripgrep M-x rg and search away nice video
;; https://www.youtube.com/watch?v=4qLD4oHOrlc&ab_channel=ProtesilaosStavrou
;; added ripgrep
(use-package rg
  :ensure t
  :config)

;; Never lose your cursor again
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

(setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "SIANDIEN(s)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

;; M-x org-agenda-file-list. Go there and save the changes to init.el
;; if your org agenda files are not there, do C-c C-e on the parentheses below. Evaluate them.
(setq org-agenda-files '("~/Dropbox/documents/org/seima.org"
                         "~/Dropbox/documents/org/inbox.org"
                         "~/Dropbox/documents/org/diary.org"))

;; Stop preparing agenda buffers on startup
(setq org-agenda-inhibit-startup t)

;; shortcut for opening agenda view
(global-set-key (kbd "C-c a") 'org-agenda)

;; not 100% remember what these do, but lets keep it
(setq org-log-into-drawer "LOGBOOK")
(setq org-directory "~/Dropbox/documents/org/")
(setq org-archive-location "::datetree/")
(setq org-agenda-restore-windows-after-quit t)
;; (setq org-hide-emphasis-markers t) ; Hide * and / in org tex.

;; https://github.com/jezcope/dotfiles/blob/master/emacs.d/init-org.org - solved my refile problem
;; sitas geriausias ir paprasciausias krc. veikia puikiai su ivy.
(setq org-refile-targets '((org-agenda-files :maxlevel . 6)))

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
(setq org-clock-into-drawer "CLOCK")
;; quite nice, tells you when the task has been finished when you say DONE on it
(setq org-log-done t)

# C-c C-z - tiesiog make note under a heading
# to log into drawer with c-c c-z, reikia:
# m-x customise-variable RET org-log-into-drawer - select LOGBOOK save and apply.

;; setting up the templates for c-c c
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates '(("i" "Inbox" entry
                               (file+headline "~/Dropbox/documents/org/inbox.org" "Inbox")
			       "* %i%?")
                               ("s" "Seima" entry
                               (file+headline "~/Dropbox/1.planai/seima.org" "Seima to-do")
			       "* %i%?")
                               ("v" "Versliukas" entry
                               (file+headline "~/Dropbox/2.versliukas/versliukas.org" "Versliukas to-do")
			       "* %i%?")
                               ("o" "Obelsdumas" entry
                               (file+headline "~/Dropbox/3.client_websites/obelsdumas/obelsdumas.org" "Obelsdumas to-do")
			       "* %i%?")
                               ("j" "Julija.consulting" entry
                               (file+headline "~/Dropbox/3.client_websites/julija.consulting/julija.consulting.org" "Julija.consulting to-do")
			       "* %i%?")
			      ("d" "Diary" entry
 			       (file+datetree "~/Dropbox/1.planai/diary.org" "Diary")
			       "* %U %^{Title} %?")
                              ("p" "Planned" entry
                               (file+headline "~/Dropbox/1.planai/tickler.org" "Planned")
                               "* %i%? %^{SCHEDULED}p" :prepend t)
                              ("r" "Repeating" entry
                               (file+headline "~/Dropbox/1.planai/tickler.org" "Repeating")
                               "* %i%? %^{SCHEDULED}p")))
