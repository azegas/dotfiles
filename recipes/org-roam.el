;;; -*- lexical-binding: t; -*-

;;; org_roam.el --- org_roam stuff
;;; Commentary:
;; magical org_roam stuff
;; [2022-03-20 Sk] Finally managed to make it work. Ignored some steps
;; from the tutorial and it just works. Let's see what the hype is all
;; about.
;;; Code:

; ------------------------------------------------------

;; lexical binding MUST be at the top of the file. TOP TOP TOP!!

;; (defun lex-p ()
;;   "Return t if lexical binding is in effect."
;;   (let (lex
;;         _lex-p)
;;     (let ((lex t))
;;       (setq _lex-p
;;             (lambda ()
;;               lex)))
;;     (funcall _lex-p)))
;; (message (if (lex-p) "Yes" "No"))

; ------------------------------------------------------

(use-package org-roam
  :ensure t
  :demand t  ;; Ensure org-roam is loaded by default
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Dropbox/documents/org/roam")
  (org-roam-dailies-directory "~/Dropbox/documents/org/roam/daily/")
  (org-roam-node-display-template "${tags:10} ${title:100}")
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n I" . org-roam-node-insert-immediate)
         ("C-c n p" . my/org-roam-find-project)
         ("C-c n t" . my/org-roam-capture-task)
         ("C-c n b" . my/org-roam-capture-inbox)
         :map org-mode-map
         ("C-M-i" . completion-at-point)
         :map org-roam-dailies-map
         ("T" . org-roam-dailies-capture-tomorrow)
         ("Y" . org-roam-dailies-capture-yesterday))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies) ;; Ensure the keymap is available
  (org-roam-db-autosync-mode))

;; allow org-add-note to have org-roam "auto completion" solved in Github
;; here - https://github.com/org-roam/org-roam/issues/2167
(add-hook 'org-log-buffer-setup-hook #'org-roam--register-completion-functions-h)

;; ----------------------------------------------------------------

;; ORG-ROAM-CAPTURE-TEMPLATES
(setq org-roam-capture-templates
      '(("d" "default" plain
         "* ${title}\n\n%?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n#+date: %U\n\n")
         :unnarrowed t)
        ("p" "pkc" plain
         "\n* ${title}\n%?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n#+date: %U\n#+filetags: pkc\n\n")
         :unnarrowed t)
        ("b" "book notes" plain (file "~/Dropbox/documents/org/roam/templates/BookTemplate.org")
         :if-new (file+head "book/%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n")
         :unnarrowed t)
        ("p" "project" plain
         "* Goals\n\n%?\n\n* ${title}\n\n** TODO Add initial tasks\n\n* Dates\n\n"
         :if-new (file+head
                  "%<%Y%m%d%H%M%S>-${slug}.org"
                  "#+title: ${title}\n#+category: ${title}\n#+filetags: project")
         :unnarrowed t)))

;; ----------------------------------------------------------------

;; ORG-ROAM-DAILIES
(setq org-roam-dailies-capture-templates
      (let ((head
             (concat
              "#+title: %<%Y-%m-%d, %A>\n#+STARTUP: content\n\n\n* Log\n* [/] Dailies\n- [ ] Morning pages\n- [ ] Duo\n- [ ] Inbox, GP, agenda\n- [ ] Git push")))
        `(;; ("d" "default" entry
          ;;  "* %?"
          ;;  :if-new (file+head+olp "%<%Y>/%<%B>/%<%Y-%m-%d>.org" ,head ("Inbox"))
          ;;  :unnarrowed t)
          ("j" "journal" entry
           "* %U: %?"
           :if-new (file+head+olp "%<%Y>/%<%B>/%<%Y-%m-%d>.org" ,head ("Log")))
          ;; ("t" "Do Today" entry         ;cool feature, allows to take the thing cursor is on and add to dailies
          ;;  "** %a %?"
          ;;  :if-new (file+head+olp "%<%Y>/%<%B>/%<%Y-%m-%d>.org" ,head ("Inbox"))
          ;;  :immediate-finish t)
          )))

;; ----------------------------------------------------------------

;; ADD TASK TO A SPECIFIC PROJECT

(defun my/org-roam-capture-task ()
  (interactive)
  ;; Add the project file to the agenda after capture is finished
  (add-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Capture the new task, creating the project file if necessary
  (org-roam-capture- :node (org-roam-node-read
                            nil
                            (my/org-roam-filter-by-tag "project"))
                     :templates '(("t" "task" plain "** TODO %? %^G\n\n:PROPERTIES:\n:Effort: %^{effort|1:00|0:00|0:05|0:10|0:30|2:00|4:00}\n:Created: %U\n:END:\n"
                                   :if-new (file+head+olp "%<%Y%m%d%H%M%S>-${slug}.org"
                                                          "#+title: ${title}\n#+category: ${title}\n#+filetags: project"
                                                          ("${title}")))
                                  ("s" "scheduled" plain "** TODO %? %^G\nSCHEDULED: %^t\n\n:PROPERTIES:\n:Effort: %^{effort|1:00|0:00|0:05|0:10|0:30|2:00|4:00}\n:Created: %U\n:END:\n"
                                   :if-new (file+head+olp "%<%Y%m%d%H%M%S>-${slug}.org"
                                                          "#+title: ${title}\n#+category: ${title}\n#+filetags: project"
                                                          ("${title}")))
                                  ("b" "bug" plain "** TODO %? :${title}:bug:\n\n:PROPERTIES:\n:Effort: %^{effort|1:00|0:00|0:05|0:10|0:30|2:00|4:00}\n:Created: %U\n:END:\n"
                                   :if-new (file+head+olp "%<%Y%m%d%H%M%S>-${slug}.org"
                                                          "#+title: ${title}\n#+category: ${title}\n#+filetags: project"
                                                          ("bugs")))
                                  ;; ("t" "task" plain "** TODO %? :${title}:\n\n:PROPERTIES:\n:Created: %U\n:END:\n"
                                  ;;  :if-new (file+head+olp "%<%Y%m%d%H%M%S>-${slug}.org"
                                  ;;                         "#+title: ${title}\n#+category: ${title}\n#+filetags: project"
                                  ;;                         ("${title}")))
                                  ;; ("p" "pkc tickler" plain "** TODO %? :pkc:\n\n:PROPERTIES:\n:Created: %U\n:END:\n"
                                  ;;  :if-new (file+head+olp "%<%Y%m%d%H%M%S>-${slug}.org"
                                  ;;                         "#+title: ${title}\n#+category: ${title}\n#+filetags: project\n"
                                  ;;                         ("pkc tickler")))
                                  ;; ("i" "iskvietimas" plain (file "~/Dropbox/documents/org/roam/templates/BookTemplate.org")
                                  ;;  :if-new (file+head+olp "%<%Y%m%d%H%M%S>-${slug}.org"
                                  ;;                         "#+title: ${title}\n#+category: ${title}\n#+filetags: project"
                                  ;;                         ("${title}")))
                                  )))

;; ----------------------------------------------------------------

;; INBOX STUFF
(defun my/org-roam-capture-inbox ()
  (interactive)
  (org-roam-capture- :node (org-roam-node-create)
                     :templates '(("i" "inbox" plain "* TODO %? %^G \n:PROPERTIES:\n:Effort: %^{effort|1:00|0:00|0:05|0:10|0:30|2:00|4:00}\n:Created: %U\n:END:\n"
                                   :if-new (file+head "inbox.org" "#+title: inbox\n"))
                                  ("s" "scheduled" plain "* TODO %? %^G \n SCHEDULED: %^t\n:PROPERTIES:\n:Effort: %^{effort|1:00|0:00|0:05|0:10|0:30|2:00|4:00}\n:Created: %U\n:END:\n"
                                   :if-new (file+head "inbox.org" "#+title: inbox\n")))))

;; ----------------------------------------------------------------

;; COPY COMPLETED TASKS TO DAILIES
(defun my/org-roam-copy-todo-to-today ()
  (interactive)
  (let ((org-refile-keep nil) ;; Set this to nil to delete the original!
        (org-roam-dailies-capture-templates
         '(("t" "tasks" entry "%?"
            :if-new (file+head+olp "%<%Y>/%<%B>/%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n" ("Completed Tasks")))))
        (org-after-refile-insert-hook #'save-buffer)
        today-file
        pos)
    (save-window-excursion
      (org-roam-dailies--capture (current-time) t)
      (setq today-file (buffer-file-name))
      (setq pos (point)))

    ;; Only refile if the target file is different than the current file
    (unless (equal (file-truename today-file)
                   (file-truename (buffer-file-name)))
      (org-refile nil nil (list "Tasks" today-file nil pos)))))

(add-to-list 'org-after-todo-state-change-hook
             (lambda ()
               (when (equal org-state "DONE")
                 (my/org-roam-copy-todo-to-today))))

(add-to-list 'org-after-todo-state-change-hook
             (lambda ()
               (when (equal org-state "CANCELLED")
                 (my/org-roam-copy-todo-to-today))))

;; ----------------------------------------------------------------

;; "PROJECT" FILES INTO AGENDA
;; [2022-03-23 Tr] Read Org-roam files and put the ones that have tag Project into
;; org-agenda-files

;; For the first time, do C-h v 'org-agenda-files', click customize and
;; save changes. This will make it permanent. I guess as new projects
;; files get added, should repeat this.
;; #+BEGIN_SRC emacs-lisp

;; Add everything that has "Project" tag to org-roam-agenda
;; so the files are used to generate the agenda.

(defun my/org-roam-filter-by-tag (tag-name)
  (lambda (node)
    (member tag-name (org-roam-node-tags node))))

(defun my/org-roam-list-notes-by-tag (tag-name)
  (mapcar #'org-roam-node-file
          (seq-filter
           (my/org-roam-filter-by-tag tag-name)
           (org-roam-node-list))))

(defun my/org-roam-refresh-agenda-list ()
  (interactive)
  (setq org-agenda-files (my/org-roam-list-notes-by-tag "project")))

;; Build the agenda list the first time for the session
(my/org-roam-refresh-agenda-list)

(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (push arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

;; [2022-03-26 Št] yes, yes, yes it works! Lexical binding on, p instead
;; of P in tags = works!! C-c p p = projectile project, then C-c n p =
;; org mode notes, great!

(defun my/org-roam-project-finalize-hook ()
  "Adds the captured project file to `org-agenda-files' if the
  capture was not aborted."
  ;; Remove the hook since it was added temporarily
  (remove-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Add project file to the agenda list if the capture was confirmed
  (unless org-note-abort
    (with-current-buffer (org-capture-get :buffer)
      (add-to-list 'org-agenda-files (buffer-file-name)))))

(defun my/org-roam-find-project ()
  (interactive)
  ;; Add the project file to the agenda after capture is finished
  (add-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Select a project file to open, creating it if necessary
  (org-roam-node-find
   nil
   nil
   (my/org-roam-filter-by-tag "project")
   :templates
   '(("p" "project" plain "* Goals\n\n%?\n\n* ${title}\n\n** TODO Add initial tasks\n\n* Dates\n\n"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: ${title}\n#+filetags: project")
      :unnarrowed t))))

(global-set-key (kbd "C-c n p") #'my/org-roam-find-project)

;; ----------------------------------------------------------------

;;; org_roam.el ends here
