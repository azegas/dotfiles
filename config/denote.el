(use-package denote
  :ensure t)

(setq initial-buffer-choice #'open-denote-dir-in-dired)
;; new keywords to denote keyword list
(setq denote-infer-keywords t)
;; sort keywords
(setq denote-sort-keywords t)
;; Automatically rename Denote buffers using the
;; `denote-rename-buffer-format'. Instead of full filename with date
;; and time and tags - show only filename
(denote-rename-buffer-mode 1)

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
