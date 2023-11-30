;; -------------------------------------------------------------------
;; COMPANY
;turn off company auto-completion in eshell, because it adds annoying
;spaces after each completion.. like ls, sucks
(add-hook 'eshell-mode-hook (lambda () (company-mode -1)) 'append)
(add-hook 'shell-mode-hook (lambda () (company-mode -1)) 'append)
(add-hook 'org-mode-hook (lambda () (company-mode -1)) 'append)
;; -------------------------------------------------------------------
;; CONSULT
;; Enable automatic preview at point in the *Completions* buffer. This is
;; relevant when you use the default completion UI.
(add-hook 'completion-list-mode #'consult-preview-at-point-mode)
;; -------------------------------------------------------------------
;; DENOTE
;; highlights filename and tags
(add-hook 'dired-mode-hook #'denote-dired-mode)
;; -------------------------------------------------------------------
;; DIFF-HL
(add-hook 'emacs-lisp-mode #'diff-hl-mode)
(add-hook 'prog-mode-hook #'diff-hl-mode)
(add-hook 'org-mode-hook #'diff-hl-mode)
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-post-refresh)
(add-hook 'prog-mode-hook #'diff-hl-margin-mode)
(add-hook 'org-mode-hook #'diff-hl-margin-mode)
(add-hook 'dired-mode-hook 'diff-hl-margin-mode)
;; -------------------------------------------------------------------
;; FLYSPELL
;; spell check
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
;; -------------------------------------------------------------------
;; ORG
;; Make the indentation look nicer in org mode. Pull the second level
;; and higher level headings from the left side
(add-hook 'org-mode-hook 'org-indent-mode)
;; Hook to display the agenda in a single window by deleting all the
;; other windows
(add-hook 'org-agenda-finalize-hook 'delete-other-windows)
;; -------------------------------------------------------------------
;; RANDOM HOOKS
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; Line numbers
;; (global-display-line-numbers-mode 1)
;; (add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
;; Hide rights/size/created info, etc in dired buffer. To see details
;; again, in dired do ¨(¨
(add-hook 'dired-mode-hook #'dired-hide-details-mode)
;; highlight the selected line in dired
(add-hook 'dired-mode-hook #'hl-line-mode)
