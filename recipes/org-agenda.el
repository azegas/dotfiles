;;; agenda.el --- agenda stuff
;;; Commentary:
;; M-x org-agenda-file-list. Go there and click "save the changes"
;; MANUALLY to save to init.el. Otherwise, Emacs wont read it on
;; every boot.  Write all org-agenda-files ONCE, do the procedure
;; described in the line above and forget about it. Refiling will
;; work, agenda will work.  if your org agenda files are not there,
;; do C-c C-e on the parentheses below. Evaluate them.
;;; Code:

(setq org-agenda-custom-commands
      '(("z" todo ""
         ((org-agenda-skip-function
           '(org-agenda-skip-entry-if 'regexp "tickler"))))
        ("b" todo "VELIAU")
        ("n" tags "pkc")
        ("a" "Daily agenda and all TODOs"
         ((agenda "" ((org-agenda-span 7)))
          (tags-todo "/+WAITING"
                     ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                      (org-agenda-overriding-header "Started tasks:")))))))

;; System locale to use for formatting time values. Show 2022-02-02 instead of 02/02/22
(setq system-time-locale "C")         ; Make sure that the weekdays in the
                                      ; time stamps of your Org mode files and
                                        ; in the agenda appear in English.

(setq org-agenda-inhibit-startup t)     ; Stop preparing agenda buffers on startup
(global-set-key [f9] 'org-agenda-filter-by-effort)
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-restore-windows-after-quit t)
(setq org-agenda-show-future-repeats nil) ;don't show repeating tasks in the future

;; (setq org-agenda-files (directory-files-recursively "~/Dropbox/documents/org/roam/" "\.org$"))
(setq org-refile-targets '((org-agenda-files :maxlevel . 1)))

;;; agenda.el ends here
