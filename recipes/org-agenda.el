;;; agenda.el --- agenda stuff
;;; Commentary:
;; M-x org-agenda-file-list. Go there and click "save the changes"
;; MANUALLY to save to init.el. Otherwise, Emacs wont read it on
;; every boot.  Write all org-agenda-files ONCE, do the procedure
;; described in the line above and forget about it. Refiling will
;; work, agenda will work.  if your org agenda files are not there,
;; do C-c C-e on the parentheses below. Evaluate them.

;;; Code:

(setq org-agenda-prefix-format '(
  ;; (agenda  . " %i %-12:c%?-12t% s") ;; file name + org-agenda-entry-type
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

;; (setq org-agenda-files (directory-files-recursively "~/Dropbox/documents/org/roam/" "\.org$"))
(setq org-refile-targets '((org-agenda-files :maxlevel . 2)))

(setq org-agenda-custom-commands
      '(("a" "Simple agenda view"
         ((agenda "")
          (todo "IN-PROGRESS" "")))))

;; (setq org-agenda-custom-commands
;;       '(("ta" "Anywhere" tags-todo "@anywhere-somedaymaybe/!TODO")
;;         ("tb" "Buy" tags-todo "@buy-somedaymaybe/!TODO")
;;         ("tc" "Calls/asks" tags-todo "@call-somedaymaybe-@repeating/!TODO")
;;         ("th" "Home" tags-todo "@home-somedaymaybe-@repeating/!TODO")
;;         ("tk" "Komputer" tags-todo "@komputer-somedaymaybe-@repeating/!TODO")
;;         ("tr" "Readreview" tags-todo "@readreview-somedaymaybe-@repeating/!TODO")
;;         ("tt" "Travel" tags-todo "@travel-somedaymaybe-@repeating/!TODO")
;;         ("tp" "Pkc" tags-todo "pkc-@repeating-somedaymaybe/!TODO"
;;          ((org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadline)))
;;          )
;;         ("tz" "Panevezys" tags-todo "@pnvz-somedaymaybe-@repeating/!TODO")
;;         ("tw" "Waitingfor" tags-todo "@waitingfor-somedaymaybe-@repeating/!TODO")
;;         ("ts" "Someday/maybe" tags-todo "-@repeating+somedaymaybe+LEVEL=2" ;show ONLY level 2 heading
;;          ((org-agenda-dim-blocked-tasks nil)))
;;         ("a" "Agenda"
;;          ((agenda ""
;;                   ((org-agenda-span 2)))
;;           (tags-todo "@anywhere-somedaymaybe|@call-somedaymaybe|@internet-somedaymaybe|@komputer-somedaymaybe/!TODO"
;;                      ((org-agenda-overriding-header "Common next actions")
;;                       (org-agenda-dim-blocked-tasks 'invisible)
;;                       (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadline))))
;;           (tags-todo "@home-somedaymaybe/!TODO"
;;                      ((org-agenda-overriding-header "Home actions")
;;                       (org-agenda-dim-blocked-tasks 'invisible)))
;;           (tags-todo "@waitingfor-somedaymaybe/!TODO"
;;                      ((org-agenda-overriding-header "Waiting for")
;;                       (org-agenda-dim-blocked-tasks 'invisible)))
;;           (tags-todo "@pnvz-somedaymaybe/!TODO"
;;                      ((org-agenda-overriding-header "Errands Pnvz")
;;                       (org-agenda-dim-blocked-tasks 'invisible)))
;;           (tags-todo "@readreview-somedaymaybe/!TODO"
;;                      ((org-agenda-overriding-header "Read/review")
;;                       (org-agenda-dim-blocked-tasks 'invisible)))
;;           (tags "/+DONE|+CANCELLED"
;;                 ((org-agenda-overriding-header "Archivable tasks")
;;                  (org-use-tag-inheritance '("project"))))
;;           (tags-todo "-@repeating-pkc-@buy-@travel-emacs-@anywhere-@call-@internet-@komputer-@home-@readreview-@waitingfor-somedaymaybe/!TODO"
;;                 ((org-agenda-overriding-header "Contextless tasks")))
;;           ))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (setq org-agenda-custom-commands
;;       '(("a" "Agenda asmenine"
;;          ((agenda ""
;;                   ((org-agenda-span 1)))
;;           (tags "PRIORITY=\"A\""
;;                 ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
;;                  (org-agenda-overriding-header "High-priority unfinished tasks:")))
;;           (alltodo ""
;;                     ;kazkodel tik sitas pkc filter turi effect, gal lad in alltodo
;;                    (;; (org-agenda-tag-filter-preset '("-pkc"))
;;                     (org-agenda-skip-function
;;                      '(or (air-org-skip-subtree-if-priority ?A)
;;                           (org-agenda-skip-if nil '(scheduled deadline))))))))
;;         ("p" "pkc"
;;          ((agenda ""
;;                   ((org-agenda-span 1)))
;;           (tags "PRIORITY=\"A\""
;;                 ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
;;                  (org-agenda-overriding-header "High-priority unfinished tasks:")))
;;           (alltodo "-ISMOK"
;;                     ;kazkodel tik sitas pkc filter turi effect, gal lad in alltodo
;;                    ((org-agenda-tag-filter-preset '("+pkc"))
;;                     (org-agenda-skip-function
;;                      '(or (air-org-skip-subtree-if-priority ?A)
;;                           (org-agenda-skip-if nil '(scheduled deadline))
;;                           (org-agenda-skip-entry-if 'todo '("ISMOK"))))))
;;           (todo "ISMOK"
;;                 ((org-agenda-tag-filter-preset '("+pkc"))
;;                  (org-agenda-skip-function
;;                      '(or (air-org-skip-subtree-if-priority ?A)
;;                           (org-agenda-skip-if nil '(scheduled deadline))))))))
;;         ("c" "Calls" tags-todo "namai/!WAITING")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        ;; ("x" "Personal agenda"
        ;;  ((agenda "" ((org-agenda-span 7)
        ;;               (org-agenda-tag-filter-preset '("-pkc"))))))

        ;; the longer I tweak the more I see you don't need custom
        ;; views.. all can be achieved inside agenda
        ;; ("p" "PKC view"
        ;;  ((tags "PRIORITY=\"A\""
        ;;         ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
        ;;          (org-agenda-overriding-header "High-priority unfinished tasks:")))
        ;;   (agenda ""
        ;;           ((org-agenda-span 1)))
        ;;   (alltodo ""
        ;;             ;kazkodel tik sitas pkc filter turi effect, gal lad in alltodo
        ;;            (;; (org-agenda-tag-filter-preset '("+pkc"))
        ;;             (org-agenda-skip-function
        ;;              '(or (air-org-skip-subtree-if-priority ?A)
        ;;                   (org-agenda-skip-if nil '(scheduled deadline))))))))

        ;; slashes are must to record second quotes
        ;; ("z" "effort stuff" tags-todo "Effort=\"0:10\"")

;; (defun air-org-skip-subtree-if-priority (priority)
;;   "Skip an agenda subtree if it has a priority of PRIORITY.
;; PRIORITY may be one of the characters ?A, ?B, or ?C."
;;   (let ((subtree-end (save-excursion (org-end-of-subtree t)))
;;         (pri-value (* 1000 (- org-lowest-priority priority)))
;;         (pri-current (org-get-priority (thing-at-point 'line t))))
;;     (if (= pri-value pri-current)
;;         subtree-end
;;       nil)))

;;; agenda.el ends here
