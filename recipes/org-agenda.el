;;; agenda.el --- agenda stuff
;;; Commentary:
;;; Code:

(setq org-agenda-prefix-format '(
  (agenda  . " %i %-12:c%?-12t% s") ;; file name + org-agenda-entry-type
  (agenda  . "  • ")
  ;; (timeline  . "  % s")
  ;; (todo  . " %i %-12:c")
  ;; (tags  . " %i %-12:c")
  ;; (search . " %i %-12:c")
  ))

;; System locale to use for formatting time values. Show 2022-02-02 instead of 02/02/22
(setq system-time-locale "C")         ; Make sure that the weekdays in the
                                      ; time stamps of your Org mode files and
                                        ; in the agenda appear in English.

(setq org-agenda-inhibit-startup t)     ; Stop preparing agenda buffers on startup
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-start-with-log-mode nil) ;shows all CLOSED: tasks in agenda view. kinda cool
(setq org-agenda-skip-scheduled-if-done t)
;; (setq org-agenda-prefix-format "%t %s")
(setq org-agenda-restore-windows-after-quit t)
(setq org-agenda-sticky nil)                ;allows to open multiple
                                          ;agenda views at once, but
                                          ;need a refresh
(setq org-agenda-show-future-repeats nil) ;don't show repeating tasks in the future
(require 'org-habit)
(setq org-agenda-tags-column 90)
(setq org-habit-graph-column 60)
(setq org-agenda-use-tag-inheritance nil) ;good, shows in agenda if t,
                                          ;but doesn't add an actual
                                          ;tag, in case want to track
                                          ;finished tasks. must add a
                                          ;tag manually to each task
                                          ;instead

(setq org-agenda-files (directory-files-recursively "~/Dropbox/org/notes" "\.org$"))
(setq org-refile-targets '((org-agenda-files :maxlevel . 2)))

(setq org-agenda-custom-commands
      '(("a" "Simple agenda view"
         ((agenda "")
          (todo "NEXT" "")
           (tags "/+DONE|+CANCELLED"
                 ((org-agenda-overriding-header "Archivable tasks")
                  (org-use-tag-inheritance '("project"))))))))

;;; agenda.el ends here
