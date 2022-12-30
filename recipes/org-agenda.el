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
  (agenda  . " %i %-12:c%?-12t% s")
  (agenda  . "  • ")
  ;; (timeline  . "  % s")
  ;; (todo  . " %i %-12:c")
  ;; (tags  . " %i %-12:c")
  ;; (search . " %i %-12:c")
  ))
(setq system-time-locale "C")
(setq org-agenda-inhibit-startup t)
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-start-with-log-mode '(closed))
(setq org-agenda-skip-scheduled-if-done nil)
;; (setq org-agenda-prefix-format "%t %s")
(setq org-agenda-restore-windows-after-quit t)
(setq org-agenda-sticky nil)
(setq org-agenda-show-future-repeats nil)
(setq org-agenda-span 1)
(require 'org-habit)
(setq org-agenda-tags-column 90)
(setq org-habit-graph-column 60)

(setq org-agenda-use-tag-inheritance t) ;xuj znajesh
(setq org-use-tag-inheritance t)      ;nepaveldi subtasks heading tago

(cond ((eq system-type 'windows-nt)
       ;; Windows-specific code goes here.
       (setq org-directory "C:\\Users\\arvga\\.arvydas\\org\\pkc_notes")
       (setq org-agenda-files (directory-files-recursively "C:\\Users\\arvga\\.arvydas\\org\\pkc_notes" "\\.org$"))
       )
      ((eq system-type 'gnu/linux)
       ;; Linux-specific code goes here.
       (setq org-directory "~/Dropbox/org/notes/")
       (setq org-agenda-files (directory-files-recursively "~/Dropbox/org/notes/" "\.org$"))
       ))

;; finally fixed org agenda files on STARTUP here:
;; https://emacs.stackexchange.com/questions/39478/emacs-not-loading-org-agenda-files-on-startup

(cond ((eq system-type 'windows-nt)
       ;; Windows-specific code goes here.
       (setq org-refile-targets (quote (("C:\\Users\\arvga\\.arvydas\\org\\pkc_notes\\gtd.org" :maxlevel . 1)
                                        ("C:\\Users\\arvga\\.arvydas\\org\\pkc_notes\\someday.org" :level . 2)
                                        ("C:\\Users\\arvga\\.arvydas\\org\\pkc_notes\\references.org" :level . 1)
                                        )))
       )
      ((eq system-type 'gnu/linux)
       ;; Linux-specific code goes here.
       (setq org-refile-targets (quote (("~/Dropbox/org/notes/gtd.org" :maxlevel . 1)
                                        ("~/Dropbox/org/notes/someday.org" :level . 2))))
       ))


;; (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))


;; (defun set-org-agenda-files ()
;;   "Set different org-files to be used in `org-agenda`."
;;   (setq org-agenda-files (list (concat org-directory "todo.org")
;;                                (concat org-directory "repeating.org")
;;                                (concat org-directory "stasys.org"))))
;; (set-org-agenda-files)

;; (setq org-agenda-custom-commands
;; '(

;; ("p" "Projects"
;; ((tags "PROJECT")))

;; ;; ("h" "Office and Home Lists"
;; ;;      ((agenda)
;; ;;           (tags-todo "OFFICE")
;; ;;           (tags-todo "HOME")
;; ;;           (tags-todo "COMPUTER")
;; ;;           (tags-todo "DVD")
;; ;;           (tags-todo "READING")))

;; ;; ("d" "THE MOST IMPORTANTTTTTTTT!!!!!!!!"
;; ;;      (
;; ;;           (agenda "" ((org-agenda-ndays 1)
;; ;;                       (org-agenda-sorting-strategy
;; ;;                        (quote ((agenda time-up priority-down tag-up) )))
;; ;;                       (org-deadline-warning-days 0)
;; ;;                       ))))
;; )
;; )

;; (setq org-agenda-custom-commands
;;       '(("a" "Simple agenda view"
;;          ((agenda "")
;;           (todo "IN-PROGRESS" "")
;;            (tags "/+DONE|+CANCELLED"
;;                  ((org-agenda-overriding-header "Archivable tasks")
;;                   (org-use-tag-inheritance '("project"))))))))

;; (setq org-agenda-custom-commands
;;       '(
;;         ("p" "PERSONAL"
;;          (
;;           (agenda "" (;; (org-agenda-span 7)
;;                       (org-agenda-tag-filter-preset '("-pkc"))))
;;           (tags-todo "-pkc/!STARTED" ((org-agenda-overriding-header "Started")))
;;           (tags-todo "-pkc/!WAITING" ((org-agenda-overriding-header "Waiting")))
;;           (tags-todo "-pkc/!NEXT" ((org-agenda-overriding-header "Next actions:")))
;;           (tags-todo "-pkc/!ASK" ((org-agenda-overriding-header "ASK:")))

;;           )
;;          )
;;         ("w" "WORK"
;;          (
;;           (agenda "" (;; (org-agenda-span 7)
;;                       (org-agenda-tag-filter-preset '("+pkc"))))
;;           (tags-todo "+pkc/!PROJECT" ((org-agenda-overriding-header "Projects:")))
;;           (tags-todo "+pkc/!STARTED" ((org-agenda-overriding-header "Started tasks:")))
;;           (tags-todo "+pkc/!WAITING" ((org-agenda-overriding-header "Waiting for something:")))
;;           (tags-todo "+pkc/!NEXT" ((org-agenda-overriding-header "Next actions:")))
;;           (tags-todo "+pkc/!ASK" ((org-agenda-overriding-header "Ask someone:")))
;;           )
;;          )
;;         ;; ("e" "Emacs Tasks" tags-todo "+emacs-arvydasDev-personal")
;;         ))


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

;; (add-hook 'after-init-hook 'org-agenda-list)
;;; agenda.el ends here
