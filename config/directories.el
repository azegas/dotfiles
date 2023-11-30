;; absolute path to emacs dir
(setq ag/emacs-dir "~/.emacs.d")
;; absolute path to emacs config dir
(setq ag/emacs-config-dir "~/.emacs.d/config")
;; set denote directory
(setq denote-directory (expand-file-name "/home/arvy/GIT/notes/"))
;; define my agenda file
(defvar ag/inbox-file (expand-file-name "20231128T133226--inbox-task-file__planning.org" denote-directory))


(setq org-agenda-files '(
			 "/home/arvy/GIT/notes/20231128T133226--inbox-task-file__planning.org"
			 ;; "/home/arvy/GIT/notes/20231128T133226--inbox-task-file__planning.org_archive"
			 ))

;; -------------------------------------------------------------------

;; make MISC folder as a place where emacs looks for additional custom
;; themes
(add-to-list 'custom-theme-load-path (concat ag/emacs-dir "/MISC/"))

;; set default buffer on startup
;; (setq initial-buffer-choice (concat ag/org-agenda-files-location "inbox.org")

(setq yas-snippet-dirs (concat ag/emacs-dir "/snippets/"))
