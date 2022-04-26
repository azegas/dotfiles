;;; general.el --- general stuff
;;; Commentary:
;; random stuff that provides some functionalities
;;; Code:

;;; ---------------------------------------

;; startup stuff
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq use-package-compute-statistics t) ; M-x use-package-report
;; (setq initial-buffer-choice "~/Dropbox/documents/org/roam/Inbox.org")
;; (setq initial-buffer-choice (lambda () (org-roam-dailies-goto-today "d") (current-buffer)))
;; (setq initial-buffer-choice (lambda () (org-agenda nil "a") (current-buffer)))

;;; ---------------------------------------

;; Increase the garbage collection threshold to 100MB to reduced startup time.
;; See https://www.reddit.com/r/emacs/comments/3kqt6e
(setq-default large-file-warning-threshold 100000000) ; set warning of opening large files to 100MB
(setq gc-cons-threshold (* 1024 1024 100))
(setq gc-cons-threshold 80000000)

;; [2021-07-01] Winner Mode is a global minor mode. When activated, it allows you to
;; “undo” (and “redo”) changes in the window configuration with the key
;; commands C-c left and C-c right.
(winner-mode +1)
(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode t)               ; Delete marked region when typing over it
(setq ad-redefinition-action 'accept)   ; turn off the error message at emacs launch
(setq-default sentence-end-double-space nil) ; Do not add double space after periods
(global-set-key (kbd "C-x C-b") 'switch-to-buffer) ; no more annoying buffer list combinatios
(setq-default indent-tabs-mode nil)     ; idk man, advised

;; Character wrap
(setq fill-column 80)
(setq-default global-visual-line-mode nil) ; automatically wraps words at boundaries
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; White-space
(setq whitespace-style '(face trailing tabs tab-mark))
(global-whitespace-mode)

;; Add note tag to C-c C-z
;; Upon adding a note to a heading - add a tag automatically
(defun ndk/org-mark-headline-for-note ()
  (let ((tags (org-get-tags nil t)))
    (unless (seq-contains tags "note")
      (progn
        (outline-back-to-heading)
        (org-set-tags (cons "note" tags))))))

;;; ---------------------------------------

(defun my/org-add-note ()
  (interactive)
  (org-add-note)                    ; call the original function
  (ndk/org-mark-headline-for-note)) ; then call the function above to add the tag

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c C-z") #'my/org-add-note))

;;; ---------------------------------------

(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)

;;; ---------------------------------------

;; [2022-04-05 Tue] Un-fill region. Needed for when wanting to put
;; text content to a website.
(defun unfill-region (beg end)
  "Unfill the region, joining text paragraphs into a single
      logical line.  This is useful, e.g., for use with
      `visual-line-mode'."
  (interactive "*r")
  (let ((fill-column (point-max)))
    (fill-region beg end)))

;; Handy key definition
(define-key global-map "\C-\M-Q" 'unfill-region)

;;; ---------------------------------------

;; Ask before closing Emacs
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

;;; ---------------------------------------

;; a function to kill dired buffers. Kind of works. Or you can use "a"
;; to cycle through dired and it leaves no buffers opened
;; DiredReuseDirectoryBuffer - https://www.emacswiki.org/emacs/DiredReuseDirectoryBuffer
;; KillingBuffers - https://www.emacswiki.org/emacs/KillingBuffers
(defun kill-dired-buffers ()
  (interactive)
  (mapc (lambda (buffer)
          (when (eq 'dired-mode (buffer-local-value 'major-mode buffer))
            (kill-buffer buffer)))
        (buffer-list)))

;; can easily check how many buffers got opened
(defun kill-all-dired-buffers ()
  "Kill all dired buffers."
  (interactive)
  (save-excursion
    (let ((count 0))
      (dolist (buffer (buffer-list))
        (set-buffer buffer)
        (when (equal major-mode 'dired-mode)
          (setq count (1+ count))
          (kill-buffer buffer)))
      (message "Killed %i dired buffer(s)." count))))

;;; ---------------------------------------

;; [2021-07-01] A package that displays the available keybindings in a
;; popup. The package is pretty useful, as Emacs seems to have more
;; keybindings than I can remember at any given point.
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  (setq which-key-idle-delay 0.2)
  :config
  (which-key-mode 1))

;; [2022-04-01 Fri] amx: An alternative M-x interface for Emacs. Sort by most recent commands.
;; https://github.com/DarwinAwardWinner/amx
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

;; [2022-03-13 Sk]
(use-package csv-mode
  :ensure t
  :mode "\\.csv\\'")

;; shell-other-window
(defun eshell-other-window ()
  "Open a `shell' in a new window."
  (interactive)
  (let ((buf (eshell)))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-frame buf)))

;;; general.el ends here
