;;; agenda.el --- agenda stuff
;;; Commentary:
;; M-x org-agenda-file-list. Go there and click "save the changes"
;; MANUALLY to save to init.el. Otherwise, Emacs wont read it on
;; every boot.  Write all org-agenda-files ONCE, do the procedure
;; described in the line above and forget about it. Refiling will
;; work, agenda will work.  if your org agenda files are not there,
;; do C-c C-e on the parentheses below. Evaluate them.

;; advanced searching - https://orgmode.org/worg/org-tutorials/advanced-searching.html
;;; Code:

(setq org-agenda-custom-commands
      '(("a" "Daily personal agenda"
         ((agenda "" ((org-agenda-span 7)
                      (org-agenda-tag-filter-preset '("-pkc"))))))
        ("p" "pkc"
          ((agenda "" ((org-agenda-span 7)
                       (org-agenda-tag-filter-preset '("+pkc"))))))
        ("k" "pkc tasks" tags-todo "+pkc")
        ("n" "namai" tags-todo "+namai")
        ("r" "buy" tags-todo "+pirk")
        ("i" "iseik" tags-todo "+iseik")
        ("b" "bugs" tags-todo "+bug")
        ("z" "effort stuff" tags-todo "Effort=0:10")))

;; System locale to use for formatting time values. Show 2022-02-02 instead of 02/02/22
(setq system-time-locale "C")         ; Make sure that the weekdays in the
                                      ; time stamps of your Org mode files and
                                        ; in the agenda appear in English.

(setq org-agenda-inhibit-startup t)     ; Stop preparing agenda buffers on startup
(global-set-key [f9] 'org-agenda-filter-by-effort)
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-start-with-log-mode t) ;shows all CLOSED: tasks in agenda view. kinda cool
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-restore-windows-after-quit t)
(setq org-agenda-sticky nil)            ;if t - must refresh agenda to see the changes
(setq org-agenda-show-future-repeats nil) ;don't show repeating tasks in the future
(setq org-agenda-tags-column 80)
(setq org-agenda-use-tag-inheritance nil) ;good, shows in agenda if t,
                                          ;but doesn't add an actual
                                          ;tag, in case want to track
                                          ;finished tasks. must add a
                                          ;tag manually to each task
                                          ;instead

;; (setq org-agenda-files (directory-files-recursively "~/Dropbox/documents/org/roam/" "\.org$"))
(setq org-refile-targets '((org-agenda-files :maxlevel . 1)))

;;; agenda.el ends here
