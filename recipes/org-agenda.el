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
      '(("a" "Agenda"
         ((tags "PRIORITY=\"A\""
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "High-priority unfinished tasks:")))
          (agenda ""
                  ((org-agenda-span 1)))
          (alltodo ""
                    ;kazkodel tik sitas pkc filter turi effect, gal lad in alltodo
                   (;; (org-agenda-tag-filter-preset '("+pkc"))
                    (org-agenda-skip-function
                     '(or (air-org-skip-subtree-if-priority ?A)
                          (org-agenda-skip-if nil '(scheduled deadline))))))))))

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

(defun air-org-skip-subtree-if-priority (priority)
  "Skip an agenda subtree if it has a priority of PRIORITY.
PRIORITY may be one of the characters ?A, ?B, or ?C."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (pri-value (* 1000 (- org-lowest-priority priority)))
        (pri-current (org-get-priority (thing-at-point 'line t))))
    (if (= pri-value pri-current)
        subtree-end
      nil)))

;; System locale to use for formatting time values. Show 2022-02-02 instead of 02/02/22
(setq system-time-locale "C")         ; Make sure that the weekdays in the
                                      ; time stamps of your Org mode files and
                                        ; in the agenda appear in English.

(setq org-agenda-inhibit-startup t)     ; Stop preparing agenda buffers on startup
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-start-with-log-mode nil) ;shows all CLOSED: tasks in agenda view. kinda cool
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-restore-windows-after-quit t)
(setq org-agenda-sticky nil)                ;allows to open multiple
                                          ;agenda views at once, but
                                          ;need a refresh
(setq org-agenda-show-future-repeats nil) ;don't show repeating tasks in the future
(setq org-agenda-tags-column 90)
(setq org-agenda-use-tag-inheritance nil) ;good, shows in agenda if t,
                                          ;but doesn't add an actual
                                          ;tag, in case want to track
                                          ;finished tasks. must add a
                                          ;tag manually to each task
                                          ;instead

;; (setq org-agenda-files (directory-files-recursively "~/Dropbox/documents/org/roam/" "\.org$"))
(setq org-refile-targets '((org-agenda-files :maxlevel . 1)))

;;; agenda.el ends here
