(use-package denote
  :ensure t)

;; new keywords to denote keyword list
(setq denote-infer-keywords t)
;; sort keywords
(setq denote-sort-keywords t)
;; highlights filename and tags
(add-hook 'dired-mode-hook #'denote-dired-mode)
;; Automatically rename Denote buffers using the
;; `denote-rename-buffer-format'. Instead of full filename with date
;; and time and tags - show only filename
(denote-rename-buffer-mode 1)

;; Define a function to open a specific directory in Dired mode
(defun open-denote-dir-in-dired ()
  (interactive)
  (dired denote-directory))

;; Bind a key to the function
(global-set-key (kbd "C-`") 'open-denote-dir-in-dired)

;; Change front matter(what appears on each note at the top)
;; more things to include here - https://orgmode.org/manual/Export-Settings.html
;; control visibility - https://orgmode.org/manual/Initial-visibility.html

;; I specifically wanted to add the startup thingy, so large note
;; files would not spit all the information into my face when i open
;; that note
(setq denote-org-front-matter
"#+title:      %s
#+date:       %s
#+filetags:   %s
#+identifier: %s
#+STARTUP:    overview
")

;; -------------------------------------------------------------------

(let ((map global-map))
  (define-key map (kbd "C-c n n") #'denote)
  (define-key map (kbd "C-c n c") #'denote-region) ; "contents" mnemonic
  (define-key map (kbd "C-c n N") #'denote-type)
  (define-key map (kbd "C-c n d") #'denote-date)
  (define-key map (kbd "C-c n z") #'denote-signature) ; "zettelkasten" mnemonic
  (define-key map (kbd "C-c n s") #'denote-subdirectory)
  (define-key map (kbd "C-c n t") #'denote-template)
  ;; If you intend to use Denote with a variety of file types, it is
  ;; easier to bind the link-related commands to the `global-map', as
  ;; shown here.  Otherwise follow the same pattern for `org-mode-map',
  ;; `markdown-mode-map', and/or `text-mode-map'.
  (define-key map (kbd "C-c n i") #'denote-link) ; "insert" mnemonic
  (define-key map (kbd "C-c n I") #'denote-add-links)
  (define-key map (kbd "C-c n b") #'denote-backlinks)
  (define-key map (kbd "C-c n f f") #'denote-find-link) ;CONFLICTS WITH PLAIN ORG WIKI!!
  (define-key map (kbd "C-c n f b") #'denote-find-backlink)
  ;; Note that `denote-rename-file' can work from any context, not just
  ;; Dired bufffers.  That is why we bind it here to the `global-map'.
  (define-key map (kbd "C-c n r") #'denote-rename-file)
  (define-key map (kbd "C-c n R") #'denote-rename-file-using-front-matter))

;; Key bindings specifically for Dired.
(let ((map dired-mode-map))
  (define-key map (kbd "C-c C-d C-i") #'denote-link-dired-marked-notes)
  (define-key map (kbd "C-c C-d C-r") #'denote-dired-rename-files)
  (define-key map (kbd "C-c C-d C-k") #'denote-dired-rename-marked-files-with-keywords)
  (define-key map (kbd "C-c C-d C-R") #'denote-dired-rename-marked-files-using-front-matter))

;; (with-eval-after-load 'org-capture
;;   (setq denote-org-capture-specifiers "%l\n%i\n%?")
;;   (add-to-list 'org-capture-templates
;;	       '("n" "New note (with denote.el)" plain
;;		 (file denote-last-path)
;;		 #'denote-org-capture
;;		 :no-save t
;;		 :immediate-finish nil
;;		 :kill-buffer t
;;		 :jump-to-captured t)))

;; Also check the commands `denote-link-after-creating',
;; `denote-link-or-create'.  You may want to bind them to keys as well.
