;;; -*- lexical-binding: t -*-
;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; Profile emacs startup
(add-hook 'emacs-startup-hook
    (lambda ()
      (message "*** Emacs loaded in %s with %d garbage collections."
         (format "%.2f seconds"
           (float-time
      (time-subtract after-init-time before-init-time)))
         gcs-done)))

(setq use-package-compute-statistics t)

(setq ag/emacs-dir "~/.emacs.d")

(defun tangle-init ()
  "If the current buffer is init.org the code-blocks are tangled,
   and the tangled file is compiled."
  (when (equal (buffer-file-name)
   (expand-file-name (concat  "init.org")))
   (expand-file-name (concat user-emacs-directory "init.org")))
    ;; Avoid running hooks when tangling.
    (let ((prog-mode-hook nil))
(org-babel-tangle)
(byte-compile-file (concat user-emacs-directory "init.el"))))

(add-hook 'after-save-hook 'tangle-init)

(require 'use-package)
;; always add :ensure t to each package. I like to better add the :ensure t myself
;; (setq use-package-always-ensure t)

(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("GNU ELPA"     . 10)
        ("MELPA"        . 5)
        ("MELPA Stable" . 0)))

(defun ag/find-init.org nil
  (interactive)
  (find-file (concat ag/emacs-dir "/init.org")))
(global-set-key (kbd "C-x <C-backspace>") 'ag/find-init.org)

(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(global-unset-key (kbd "C-z"))

(setq make-backup-files nil       ; Stop creating backup~ files
      auto-save-default nil             ; Stop creating #autosave# files
      inhibit-startup-screen t          ; No splash screen please
      initial-scratch-message nil       ; Clean scratch buffer
      kill-whole-line t                 ; C-k kills line including its newline
      ring-bell-function 'ignore        ; Quiet
      scroll-margin 1                   ; Space between cursor and top/bottom
      show-paren-delay 0
      sentence-end-double-space nil     ; No double space
      confirm-kill-emacs 'y-or-n-p      ; y and n instead of yes and no when quitting
      read-extended-command-predicate #'command-completion-default-include-p ; Hide M-x commands which does not work in the current buffer.
      )

(setq-default
 fill-column 79                   ;Maximum line width
 auto-fill-function 'do-auto-fill ;Auto-fill-mode everywhere
 calendar-week-start-day 1        ;self explanatory
 )

(fset 'yes-or-no-p 'y-or-n-p)

(defvar emacs-autosave-directory
  (concat user-emacs-directory "autosaves/")
  "This variable dictates where to put auto saves. It is set to a
  directory called autosaves located wherever your .emacs.d/ is
  located.")

;; Sets all files to be backed up and auto saved in a single directory.
(setq backup-directory-alist
      `((".*" . ,emacs-autosave-directory))
      auto-save-file-name-transforms
      `((".*" ,emacs-autosave-directory t)))

(add-hook 'before-save-hook 'whitespace-cleanup)

(add-hook 'text-mode-hook 'turn-on-auto-fill)

(defun ag/unfill-region (beg end)
  "Unfill the region, joining text paragraphs into a single
    logical line.  This is useful, e.g., for use with
    `visual-line-mode'."
  (interactive "*r")
  (let ((fill-column (point-max)))
    (fill-region beg end)))

(define-key global-map "\C-\M-Q" 'ag/unfill-region)

(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (_ arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))

(global-set-key (kbd "M-c") 'duplicate-current-line-or-region)

(defvar ag/custom-bindings-map (make-keymap)
  "A keymap for custom bindings.")

(dolist (mode
         '(tool-bar-mode                ; No toolbars, more room for text
           scroll-bar-mode              ; No scroll bars either
           menu-bar-mode                ; No menu bar as well
           blink-cursor-mode))          ; Disable blinking cursor
  (funcall mode 0))

(add-to-list 'custom-theme-load-path (concat ag/emacs-dir "/MISC/"))

(setq custom-safe-themes t)

(load-theme 'zenburn)

(use-package smooth-scrolling
  :ensure t)

;; Accelerate scrolling with the trade-off of sometimes delayed accurate fontification.
(setq fast-but-imprecise-scrolling t)

;; (add-to-list 'default-frame-alist '(internal-border-width . 24))

;; (global-display-line-numbers-mode 1)
;; (add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(setq-default cursor-type 'bar)

(dolist (mode
         '(column-number-mode           ; Show column number in mode line
           size-indication-mode         ; file size indication in mode-line
           electric-pair-mode           ; closes parens automatically for you
           smooth-scrolling-mode        ; Smooth scrolling
           show-paren-mode              ; Highlight matching parentheses
           global-hl-line-mode          ; Highlight the line you are on in all buffers
           ))
  (funcall mode 1))

(dolist (mode
         '(abbrev-mode                  ; E.g. sopl -> System.out.println
           delete-selection-mode        ; Replace selected text
           dirtrack-mode                ; directory tracking in *shell*
           global-so-long-mode          ; Mitigate performance for long lines
           recentf-mode                 ; Recently opened files
           winner-mode                  ; ctrl+c+left/right redoes/undoes the window layouts
           ))
  (funcall mode 1))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package ace-window
  :ensure t)

(setq aw-keys '(?q ?w ?e ?r ?y ?h ?j ?k ?l))
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "M-0") 'ace-swap-window)
(global-set-key (kbd "C-x v") 'aw-split-window-horz)

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

(use-package denote
  :ensure t

  ;; Denote DOES NOT define any key bindings. I just pick some of the bindings
  ;; from "Sample configuration" here - https://protesilaos.com/emacs/denote and
  ;; bind them. There are way more available functions in the docs.
  :bind (:map ag/custom-bindings-map
              ("C-c n n" . #'denote)  ;create new denote note
              ("C-c n i" . #'denote-link) ; add a link to another denote file
              ("C-c n I" . #'denote-add-links) ; add ALL denote files related to your chose keywords
              ("C-c n b" . #'denote-backlinks) ; LIST all files where current file is mentioned
              ("C-c n f f" . #'denote-find-link) ; FIND all links to other denote files
              ("C-c n f b" . #'denote-find-backlink) ; FIND all files where current file is mentioned
              )
  :hook (dired-mode . denote-dired-mode) ; highlights the filename and tags
  :config
  (setq denote-infer-keywords t)	;newly created keywords to go denote keyword list
  (setq denote-sort-keywords t)		;sort denote keywords
  ;; Automatically rename Denote buffers using the
  ;; `denote-rename-buffer-format'. Instead of full filename with date
  ;; and time and tags - show only filename
  (denote-rename-buffer-mode 1)
  )

(setq denote-directory (expand-file-name "/home/arvy/GIT/notes/")) ;Set denote directory

(setq denote-org-front-matter
"#+title:      %s
#+date:       %s
#+filetags:   %s
#+identifier: %s
#+STARTUP:    overview
")

(setq org-startup-indented t)

(setq org-cycle-emulate-tab 'white)

(setq org-return-follows-link t)

(setq org-src-window-setup `split-window-below)

(with-eval-after-load 'org
  (bind-key "C-c ." #'org-time-stamp-inactive org-mode-map))

;; (add-hook 'org-mode-hook 'org-indent-mode)

(setq org-src-preserve-indentation nil)

(setq org-src-tab-acts-natively t)
(setq org-src-fontify-natively t)

(setq org-log-done 'time)

(setq ag/task-file "/home/arvy/GIT/notes/tasks.org")
(setq ag/somedaymaybe-file "/home/arvy/GIT/notes/somedaymaybe.org")

(setq org-agenda-files `(,ag/task-file ,ag/somedaymaybe-file))

(define-key ag/custom-bindings-map (kbd "C-c a") 'org-agenda)

(setq org-todo-keywords
(quote ((sequence "TODO(t)" "PROGRESS(p)" "|" "DONE(d)" "CANCELLED(c)"))))

(setq org-todo-keyword-faces
      '(
        ("PROGRESS" . (:foreground "yellow" :weight bold))
        ))

;; (setq org-agenda-prefix-format '(
;;          (agenda  . "  • ")
;;          (timeline  . " • ")
;;          (todo  . " • ")
;;          (tags  . " • ")
;;          (search . " • ")
;;          ))

(add-hook 'org-agenda-finalize-hook 'delete-other-windows)

(setq org-agenda-custom-commands
      '(
        ;; ("x" agenda)
        ;; ("u" tags "+boss-urgent")
        ;; ("v" tags-todo "+boss-urgent")
        ;; ("U" tags-tree "+boss-urgent")
        ;; ("f" occur-tree "\\<FIXME\\>")
        ;; ("h" . "HOME+Name tags searches") ;description for "h" prefix
        ;; ("hl" tags "+home+Lisa")
        ;; ("hp" tags "+home+Peter")
        ;; ("hk" tags "+home+Kim")
        ("p" . "Project searches") ;description for "h" prefix
        ("pi" tags "inbox")
        ("pe" tags "emacs")
        ("pl" tags "lifeapi")
        ("pq" tags "quotes")
        ("pa" tags "arvydasdev")
        ("pp" tags "pagalbagyvunams")
        ("pc" tags "cdp")
        ("ps" tags "smutifruti")
        ("po" tags "obelsdumas")
        ))

(setq org-refile-targets '((org-agenda-files :maxlevel . 1)))

(define-key ag/custom-bindings-map (kbd "\C-cc") 'org-capture)

(setq org-capture-templates '(
                              ("t" "Tasks")
                              (
                               "ti"
                               "Inbox"
                               entry
                               (file+headline ag/task-file "Inbox")
                               "* TODO %^{Title}\n:PROPERTIES:\nCAPTURED: %U\nWHERE: %a\nINSERT: %i\n:END:\n\n%?"
                               )
                              (
                               "te"
                               "Emacs"
                               entry
                               (file+headline ag/task-file "Emacs")
                               "* TODO %^{Title}\n:PROPERTIES:\nCAPTURED: %U\nWHERE: %a\nINSERT: %i\n:END:\n\n%?"
                               )
                              (
                               "tl"
                               "Lifeapi"
                               entry
                               (file+headline ag/task-file "Lifeapi")
                               "* TODO %^{Title}\n:PROPERTIES:\nCAPTURED: %U\nWHERE: %a\nINSERT: %i\n:END:\n\n%?"
                               )
                              (
                               "tq"
                               "Quotes"
                               entry
                               (file+headline ag/task-file "Quotes")
                               "* TODO %^{Title}\n:PROPERTIES:\nCAPTURED: %U\nWHERE: %a\nINSERT: %i\n:END:\n\n%?"
                               )
                              (
                               "ta"
                               "Arvydasdev"
                               entry
                               (file+headline ag/task-file "Arvydasdev")
                               "* TODO %^{Title}\n:PROPERTIES:\nCAPTURED: %U\nWHERE: %a\nINSERT: %i\n:END:\n\n%?"
                               )
                              (
                               "tp"
                               "PagalbaGyvunams"
                               entry
                               (file+headline ag/task-file "PagalbaGyvunams")
                               "* TODO %^{Title}\n:PROPERTIES:\nCAPTURED: %U\nWHERE: %a\nINSERT: %i\n:END:\n\n%?"
                               )
                              (
                               "tp"
                               "Core Django Project"
                               entry
                               (file+headline ag/task-file "Core Django Project")
                               "* TODO %^{Title}\n:PROPERTIES:\nCAPTURED: %U\nWHERE: %a\nINSERT: %i\n:END:\n\n%?"
                               )
                              ("s" "Someday")
                              (
                               "sw"
                               "Watch"
                               entry
                               (file+headline ag/somedaymaybe-file "Watch")
                               "* TODO %?\n:PROPERTIES:\nCAPTURED: %U\n:END:\n\n"
                               )
                              (
                               "sm"
                               "Movies"
                               entry
                               (file+headline ag/somedaymaybe-file "Movies")
                               "* TODO %?\n:PROPERTIES:\nCAPTURED: %U\n:END:\n\n"
                               )
                              (
                               "sv"
                               "Visit"
                               entry
                               (file+headline ag/somedaymaybe-file "Visit")
                               "* TODO %?\n:PROPERTIES:\nCAPTURED: %U\n:END:\n\n"
                               )
                              (
                               "sb"
                               "Buy"
                               entry
                               (file+headline ag/somedaymaybe-file "Buy")
                               "* TODO %?\n:PROPERTIES:\nCAPTURED: %U\n:END:\n\n"
                               )
                              (
                               "sB"
                               "Books"
                               entry
                               (file+headline ag/somedaymaybe-file "Books")
                               "* TODO %?\n:PROPERTIES:\nCAPTURED: %U\n:END:\n\n"
                               )
                              (
                               "sh"
                               "Home"
                               entry
                               (file+headline ag/somedaymaybe-file "Home")
                               "* TODO %?\n:PROPERTIES:\nCAPTURED: %U\n:END:\n\n"
                               )
                              (
                               "sp"
                               "Photography"
                               entry
                               (file+headline ag/somedaymaybe-file "Photography")
                               "* TODO %?\n:PROPERTIES:\nCAPTURED: %U\n:END:\n\n"
                               )
                              (
                               "si"
                               "Project Ideas"
                               entry
                               (file+headline ag/somedaymaybe-file "Project Ideas")
                               "* TODO %?\n:PROPERTIES:\nCAPTURED: %U\n:END:\n\n"
                               )
                              (
                               "sc"
                               "Code"
                               entry
                               (file+headline ag/somedaymaybe-file "Code")
                               "* TODO %?\n:PROPERTIES:\nCAPTURED: %U\n:END:\n\n"
                               )
                              (
                               "sq"
                               "Quotes"
                               entry
                               (file+headline ag/somedaymaybe-file "Quotes")
                               "* TODO %?\n:PROPERTIES:\nCAPTURED: %U\n:END:\n\n"
                               )
                              ))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x C-g" . magit-status)))

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode 1))

;; Activates diff-hl, highlighting changes in version-controlled files directly
;; in the buffer, providing visual cues for modifications using different
;; colors or markings, helping to track changes made to files in various
;; programming modes or buffers.
(add-hook 'emacs-lisp-mode #'diff-hl-mode)
(add-hook 'prog-mode-hook #'diff-hl-mode)
(add-hook 'org-mode-hook #'diff-hl-mode)

;;  Integrates diff-hl within Dired mode, displaying file status indicators
;;  (e.g., added, modified, deleted) directly within the Dired buffer,
;;  facilitating quick identification of changes in the directory listing based
;;  on version control status.
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

;; An essential hook for magit, updates the diff-hl indicators in the Magit
;; status buffer after a refresh, ensuring the displayed file changes align
;; with the status shown in magit.
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-post-refresh)

;;  Enhances diff-hl by displaying indicators in the left margin of the buffer,
;;  providing a concise overview of changes made to version-controlled files,
;;  aiding in identifying modifications in programming and org buffers.
(add-hook 'prog-mode-hook #'diff-hl-margin-mode)
(add-hook 'org-mode-hook #'diff-hl-margin-mode)
(add-hook 'dired-mode-hook 'diff-hl-margin-mode)

(use-package vertico
  :ensure t
  :init
  (vertico-mode)

  ;; Show more candidates
  (setq vertico-count 10)
  )

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1))

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode 1)
  (corfu-popupinfo-mode 1)
  (corfu-history-mode)
  :config
  (setq corfu-cycle t
  corfu-auto t
  corfu-auto-delay 0
  corfu-auto-prefix 2
  corfu-popupinfo-delay 0.5))

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless basic partial-completion)
        completion-category-defaults nil
        orderless-component-separator "[ |]"
        completion-category-overrides '((file (styles partial-completion)))))

;; (use-package consult
;;   :ensure t
;;   :bind (:map ag/custom-bindings-map
;;               ("C-x b" . consult-buffer)
;;               ("C-c m" . consult-man)
;;               ("C-c r" . consult-ripgrep)))

;; Example configuration for Consult
(use-package consult
  :ensure t
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind (;; C-c bindings in `mode-specific-map'
         ("C-c M-x" . consult-mode-command) ;cool, lists all the various mode commands available in the current buffer
         ("C-c h" . consult-history)
         ("C-c k" . consult-kmacro)
         ("C-c m" . consult-man)
         ("C-c i" . consult-info)

         ([remap Info-search] . consult-info)
         ;; C-x bindings in `ctl-x-map'
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ;; ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer(too many options tbh)
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ("C-x t b" . consult-buffer-other-tab)    ;; orig. switch-to-buffer-other-tab
         ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ;; M-g bindings in `goto-map'
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ;; ("M-g i" . consult-imenu)
         ;; ("M-g I" . consult-imenu-multi)

         ;; M-s bindings in `search-map'
         ("M-s d" . consult-find)                  ;; Alternative: consult-fd
         ("M-s c" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
         ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)                 ;; orig. next-matching-history-element
         ("M-r" . consult-history))                ;; orig. previous-matching-history-element

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)
  )

;; overriding some default consult keybindings
(define-key ag/custom-bindings-map (kbd "C-r") 'consult-ripgrep) ; Remaping the default "M-s r" for ripgrep
(define-key ag/custom-bindings-map (kbd "C-q") 'consult-imenu) ; Remaping the default "M-s r" for ripgrep

;; Enable automatic preview at point in the *Completions* buffer. This is
;; relevant when you use the default completion UI.
;; DONT REMEMBER WHAT THIS IS, turning off for now
;; (add-hook 'completion-list-mode #'consult-preview-at-point-mode)

(use-package swiper
  :ensure t
  :bind ("C-s" . swiper))

(add-hook 'dired-mode-hook #'auto-revert-mode)
(add-hook 'dired-mode-hook #'hl-line-mode)	; highlight the selected line
(add-hook 'dired-mode-hook #'dired-hide-details-mode) ;Hide rights/size/created info, etc in dired buffer. To see details again click left bracket
(setq dired-listing-switches "-al --group-directories-first") ; Sort by directoreis first in dired
;; Always copy/delete recursively
(setq dired-recursive-copies  'always)
(setq dired-recursive-deletes 'top)

(global-set-key (kbd "C-x C-d") 'dired-jump)

(put 'dired-find-alternate-file 'disabled nil)

;; The following use-package snippet includes a list of all of
;; treemacs’ configuration options in their default setting.
;; Setting them, or activating the minor modes yourself is not
;; necessary, they are only listed here to encourage
;; discoverability.

(use-package treemacs
  :defer t
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
          treemacs-workspace-switch-cleanup        nil
          treemacs-follow-mode t
          treemacs-filewatch-mode t
          treemacs-fringe-indicator-mode 'always
          treemacs-hide-gitignored-files-mode t))
  :bind (:map ag/custom-bindings-map
              ("M-`" . #'treemacs-select-window))
  )

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package perspective
  :ensure t
  :bind (
         ("C-x k" . persp-kill-buffer*)
         )
  :custom
  (persp-mode-prefix-key (kbd "C-z"))
  :init
  (persp-mode))

(use-package vterm
  :defer t				; deferring until I use it with vterm-toggle
  :init
  (setq vterm-max-scrollback 100000)
  ;; using Fish as default vterm bash. Fish(Friendly interactive shell) is
  ;; basically buffed bash shell. Syntax highlighting, autocompletion, aliases
  ;; More about fish - https://www.youtube.com/watch?v=C2a7jJTh3kU&ab_channel=LukeSmith
  (setq vterm-shell "fish"))

(use-package vterm-toggle
  :ensure t
  :bind(:map ag/custom-bindings-map
             ("C-`" . vterm-toggle)		; toggles vterm window
             ("C-<return>" . vterm-toggle-insert-cd) ; insert current dir and enter it when in vterm shell
             ))

(use-package lorem-ipsum
  :defer t)

(use-package multiple-cursors
  :ensure t
  :bind (:map ag/custom-bindings-map
              ("C->" . mc/mark-next-like-this)
              ("C-<" . mc/mark-previous-like-this)
              ("C-c C-<" . mc/mark-all-like-this)))

(use-package expand-region
  :ensure t
  :bind (:map ag/custom-bindings-map
              ("M-=" . er/expand-region)))

(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  (setq which-key-idle-delay 0.2)
  :config
  (which-key-mode 1))

(use-package helpful
  :ensure t
  :bind (:map ag/custom-bindings-map
              ("C-h f" . helpful-callable)
              ("C-h v" . helpful-variable)
              ("C-h k" . helpful-key)
              ("C-h k" . helpful-key)
              ("C-c C-d" . helpful-at-point)
              ("C-h F" . helpful-function)
              ("C-h C" . helpful-command)))

(use-package yasnippet
  :ensure t
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
  (yas-global-mode 1))

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode)
  :config
  (setq undo-tree-auto-save-history nil))

(use-package saveplace
  :ensure t
  :config
  ;; activate it for all buffers
  (setq-default save-place t)
  (save-place-mode 1))

(use-package goto-chg
  :ensure t
  :bind (:map ag/custom-bindings-map
              ("M-[" . 'goto-last-change)
              ("M-]" . 'goto-last-change-reverse)))

(define-minor-mode custom-bindings-mode
  "A mode that activates custom-bindings."
  :init-value t
  :keymap ag/custom-bindings-map)
