;;; ---------------------------------------

;; stolen from https://github.com/Giedriusj1
;; reminds me VScode behavior

(defun ag/create-shell-here ()
  (interactive)
  (let* ((dir default-directory)
	 (shell-name (format "*shell* <%s>" dir))
	 (shell-buffer (get-buffer shell-name)))
    (if shell-buffer
	(switch-to-buffer shell-buffer)
      (shell (generate-new-buffer-name shell-name)))))

(bind-keys* ( "C-`" . ag/create-shell-here))

;;; ---------------------------------------

(defun ag/find-init.el nil
  (interactive)

  (find-file (concat ag/emacs-dir "/init.el")))

;; Easily jump to my package files in dired
(defun ag/find-packages nil
  (interactive)

  (dired ag/emacs-config-dir))

;;; ---------------------------------------

;; [2022-04-05 Tue] Un-fill region. Needed for when wanting to put
;; text content to a website.
(defun ag/unfill-region (beg end)
  "Unfill the region, joining text paragraphs into a single
      logical line.  This is useful, e.g., for use with
      `visual-line-mode'."
  (interactive "*r")
  (let ((fill-column (point-max)))
    (fill-region beg end)))

(define-key global-map "\C-\M-Q" 'ag/unfill-region)

;;; ---------------------------------------

;; Ask before closing Emacs
(defun ag/ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Exit Emacs? "))
      (if (< emacs-major-version 22)
	  (save-buffers-kill-terminal)
	(save-buffers-kill-emacs))
    (message "Canceled exit")))

(global-set-key (kbd "C-x C-c") 'ag/ask-before-closing)

;;; ---------------------------------------

;; a function to kill dired buffers. Kind of works. Or you can use "a"
;; to cycle through dired and it leaves no buffers opened
;; DiredReuseDirectoryBuffer - https://www.emacswiki.org/emacs/DiredReuseDirectoryBuffer
;; KillingBuffers - https://www.emacswiki.org/emacs/KillingBuffers
(defun ag/kill-dired-buffers ()
  (interactive)
  (mapc (lambda (buffer)
	  (when (eq 'dired-mode (buffer-local-value 'major-mode buffer))
	    (kill-buffer buffer)))
	(buffer-list)))

;; can easily check how many buffers got opened
(defun ag/kill-all-dired-buffers ()
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

;; shell-other-window
(defun ag/eshell-other-window ()
  "Open a `shell' in a new window."
  (interactive)
  (let ((buf (eshell)))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-frame buf)))

;;; ---------------------------------------

;; https://rejeep.github.io/emacs/elisp/2010/03/11/duplicate-current-line-or-region-in-emacs.html
;; for html actually found C-c C-e C from web mode
;; but will leave this for other modes probably
(defun ag/duplicate-current-line-or-region (arg)
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
      (dotimes (i arg)
	(goto-char end)
	(newline)
	(insert region)
	(setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))

(global-set-key (kbd "M-c") 'ag/duplicate-current-line-or-region)

;;; ---------------------------------------
