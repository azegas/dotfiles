;; absolute path to emacs dir
(setq ag/emacs-dir "~/.emacs.d")
(setq ag/emacs-config-dir "~/.emacs.d/config")
(add-to-list 'custom-theme-load-path (concat ag/emacs-dir "/MISC/"))

;; org location
;; (setq my/org-agenda-files-location "/home/arvy/org/org-agenda-files/")
;; (setq my/org-inbox-file (concat my/org-agenda-files-location "inbox.org"))
;; (setq my/org-journal-file "/home/arvy/org/org-agenda-files/journal.org")
(setq my/org-journal-file "C:\\Users\\arvydas\\OneDrive\\GIT\\org\\org-agenda-files\\journal.org")

;; set default buffer on startup
;; (setq initial-buffer-choice (concat my/org-agenda-files-location "inbox.org")
