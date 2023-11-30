;; -------------------------------------------------------------------
;; AG
(global-set-key (kbd "C-x <C-backspace>") 'ag/find-init.el)
(global-set-key (kbd "C-x <C-home>") 'ag/find-packages)
(define-key global-map "\C-\M-Q" 'ag/unfill-region)
;; (global-set-key (kbd "C-x C-c") 'ag/ask-before-closing)
(global-set-key (kbd "M-c") 'ag/duplicate-current-line-or-region)
(global-set-key (kbd "M-`") 'ag/open-inbox-file)
;; -------------------------------------------------------------------
;; RANDOM
(global-set-key (kbd "<f5>") 'flyspell-mode)
(global-set-key (kbd "C-x C-d") 'dired-jump)
(global-set-key (kbd "C-`") 'open-denote-dir-in-dired)
(global-set-key (kbd "M-[") 'goto-last-change)
(global-set-key (kbd "M-]") 'goto-last-change-reverse)
;; -------------------------------------------------------------------
;; ACE-WINDOW
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
;; -------------------------------------------------------------------
;; CONSULT
;; C-c bindings in `mode-specific-map'
;; Global keybindings
(global-set-key (kbd "C-c M-x") 'consult-mode-command)
(global-set-key (kbd "C-c h") 'consult-history)
(global-set-key (kbd "C-c k") 'consult-kmacro)
(global-set-key (kbd "C-c m") 'consult-man)
(global-set-key (kbd "C-c i") 'consult-info)
(global-set-key [remap Info-search] 'consult-info)
;; C-x bindings in `ctl-x-map'
(global-set-key (kbd "C-x M-:") 'consult-complex-command) ;; orig. repeat-complex-command
(global-set-key (kbd "C-x b") 'consult-buffer)            ;; orig. switch-to-buffer
(global-set-key (kbd "C-x 4 b") 'consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
(global-set-key (kbd "C-x 5 b") 'consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
(global-set-key (kbd "C-x t b") 'consult-buffer-other-tab)    ;; orig. switch-to-buffer-other-tab
(global-set-key (kbd "C-x r b") 'consult-bookmark)            ;; orig. bookmark-jump
(global-set-key (kbd "C-x p b") 'consult-project-buffer)      ;; orig. project-switch-to-buffer
;; Custom M-# bindings for fast register access
(global-set-key (kbd "M-#") 'consult-register-load)
(global-set-key (kbd "M-'") 'consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
(global-set-key (kbd "C-M-#") 'consult-register)
;; Other custom bindings
(global-set-key (kbd "M-y") 'consult-yank-pop)                ;; orig. yank-pop
;; M-g bindings in `goto-map'
(global-set-key (kbd "M-g e") 'consult-compile-error)
(global-set-key (kbd "M-g f") 'consult-flymake)               ;; Alternative: consult-flycheck
(global-set-key (kbd "M-g g") 'consult-goto-line)             ;; orig. goto-line
(global-set-key (kbd "M-g M-g") 'consult-goto-line)           ;; orig. goto-line
(global-set-key (kbd "M-g o") 'consult-outline)               ;; Alternative: consult-org-heading
(global-set-key (kbd "M-g m") 'consult-mark)
(global-set-key (kbd "M-g k") 'consult-global-mark)
(global-set-key (kbd "M-g i") 'consult-imenu)
(global-set-key (kbd "M-g I") 'consult-imenu-multi)
;; M-s bindings in `search-map'
(global-set-key (kbd "M-s d") 'consult-find)                  ;; Alternative: consult-fd
(global-set-key (kbd "M-s c") 'consult-locate)
(global-set-key (kbd "M-s g") 'consult-grep)
(global-set-key (kbd "M-s G") 'consult-git-grep)
(global-set-key (kbd "M-s r") 'consult-ripgrep)
(global-set-key (kbd "M-s l") 'consult-line)
(global-set-key (kbd "M-s L") 'consult-line-multi)
(global-set-key (kbd "M-s k") 'consult-keep-lines)
(global-set-key (kbd "M-s u") 'consult-focus-lines)
;; Isearch integration
(global-set-key (kbd "M-s e") 'consult-isearch-history)
(global-set-key (kbd "M-e") 'consult-isearch-history)         ;; orig. isearch-edit-string
(global-set-key (kbd "M-s e") 'consult-isearch-history)       ;; orig. isearch-edit-string
(global-set-key (kbd "M-s l") 'consult-line)                  ;; needed by consult-line to detect isearch
(global-set-key (kbd "M-s L") 'consult-line-multi)            ;; needed by consult-line to detect isearch
;; Minibuffer history
(define-key minibuffer-local-map (kbd "M-s") 'consult-history)   ;; orig. next-matching-history-element
(define-key minibuffer-local-map (kbd "M-r") 'consult-history)   ;; orig. previous-matching-history-element

;; -------------------------------------------------------------------
;; DENOTE

;; Key bindings for Denote commands in various contexts.
(global-set-key (kbd "C-c n n") #'denote)
(global-set-key (kbd "C-c n c") #'denote-region) ; "contents" mnemonic
(global-set-key (kbd "C-c n N") #'denote-type)
(global-set-key (kbd "C-c n d") #'denote-date)
(global-set-key (kbd "C-c n z") #'denote-signature) ; "zettelkasten" mnemonic
(global-set-key (kbd "C-c n s") #'denote-subdirectory)
(global-set-key (kbd "C-c n t") #'denote-template)

;; If you intend to use Denote with a variety of file types, it is
;; easier to bind the link-related commands to the `global-map', as
;; shown here.  Otherwise follow the same pattern for `org-mode-map',
;; `markdown-mode-map', and/or `text-mode-map'.
(global-set-key (kbd "C-c n i") #'denote-link) ; "insert" mnemonic
(global-set-key (kbd "C-c n I") #'denote-add-links)
(global-set-key (kbd "C-c n b") #'denote-backlinks)
(global-set-key (kbd "C-c n f f") #'denote-find-link) ; CONFLICTS WITH PLAIN ORG WIKI!!
(global-set-key (kbd "C-c n f b") #'denote-find-backlink)

;; Note that `denote-rename-file' can work from any context, not just
;; Dired bufffers.  That is why we bind it here to the `global-map'.
(global-set-key (kbd "C-c n r") #'denote-rename-file)
(global-set-key (kbd "C-c n R") #'denote-rename-file-using-front-matter)

;; Key bindings specifically for Dired mode.
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "C-c C-d C-i") #'denote-link-dired-marked-notes)
  (define-key dired-mode-map (kbd "C-c C-d C-r") #'denote-dired-rename-files)
  (define-key dired-mode-map (kbd "C-c C-d C-k") #'denote-dired-rename-marked-files-with-keywords)
  (define-key dired-mode-map (kbd "C-c C-d C-R") #'denote-dired-rename-marked-files-using-front-matter))

;; -------------------------------------------------------------------
;; HELPFUL
(global-set-key (kbd "C-h f") 'helpful-callable)
(global-set-key (kbd "C-h v") 'helpful-variable)
(global-set-key (kbd "C-h k") 'helpful-key)
(global-set-key (kbd "C-c C-d") 'helpful-at-point)
(global-set-key (kbd "C-h F") 'helpful-function)
(global-set-key (kbd "C-h C") 'helpful-command)
;; -------------------------------------------------------------------
;; MAGIT
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x C-g") 'magit-status)
;; -------------------------------------------------------------------
;; MULTIPLE-CURSORS
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; -------------------------------------------------------------------
;; ORG
(define-key global-map "\C-cc" 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
;; -------------------------------------------------------------------
