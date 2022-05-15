;;; -*- lexical-binding: t; -*-

;;; org_roam.el --- org_roam stuff
;;; Commentary:
;; magical org_roam stuff
;; [2022-03-20 Sk] Finally managed to make it work. Ignored some steps
;; from the tutorial and it just works. Let's see what the hype is all
;; lexical binding MUST be at the top of the file. TOP TOP TOP!!
;; about.
;;; Code:

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

; ------------------------------------------------------

;; insert immediate
(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (push arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

; ------------------------------------------------------

;; allow org-add-note to have org-roam "auto completion" solved in Github
;; here - https://github.com/org-roam/org-roam/issues/2167
(add-hook 'org-log-buffer-setup-hook #'org-roam--register-completion-functions-h)

; ------------------------------------------------------
;; ORG-ROAM-DAILIES
(setq org-roam-dailies-capture-templates
      (let ((head
             (concat
              "#+title: %<%Y-%m-%d, %A>\n#+STARTUP: content\n\n\n* inbox\n* log\n* [/] Dailies\n- [ ] Morning pages\n- [ ] Duo\n- [ ] Inbox, GP, agenda\n- [ ] Git push")))
        `(("t" "todo" plain "** TODO %?"
           :if-new (file+head+olp "%<%Y>/%<%B>/%<%Y-%m-%d>.org" ,head ("inbox")))
          ("d" "default" plain "** %?"
           :if-new (file+head+olp "%<%Y>/%<%B>/%<%Y-%m-%d>.org" ,head ("inbox")))
          ("j" "journal entry" plain
           "** %<%H:%M>: %?"          ;format-time-string
           :if-new (file+head+olp "%<%Y>/%<%B>/%<%Y-%m-%d>.org" ,head ("Log")))

          ;; ("i" "add any task" plain "** TODO %? %^G \n:PROPERTIES:\n:Created: %U\n:END:\n"
          ;;  :if-new (file+head+olp "%<%Y>/%<%B>/%<%Y-%m-%d>.org" ,head ("inbox")))

          ;; ("p" "add pkc task" plain "** TODO %? :pkc: \n:PROPERTIES:\n:Created: %U\n:END:\n"
          ;;  :if-new (file+head+olp "%<%Y>/%<%B>/%<%Y-%m-%d>.org" ,head ("inbox")))

          ;; ("t" "Add antry from here" entry         ;cool feature, allows to take the thing cursor is on and add to dailies
          ;;  "** %a %?"
          ;;  :if-new (file+head+olp "%<%Y>/%<%B>/%<%Y-%m-%d>.org" ,head ("Inbox"))
          ;;  :immediate-finish t)
          )))

; ------------------------------------------------------

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

; ------------------------------------------------------

;; ORG-ROAM-CAPTURE-TEMPLATES - new roam files
(setq org-roam-capture-templates
      '(("d" "default roam file" plain
         "* ${title}\n\n%?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n#+date: %U\n\n")
         :unnarrowed t)
        ("p" "pkc roam file" plain
         "\n* ${title}\n%?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n#+date: %U\n#+filetags: pkc\n\n")
         :unnarrowed t)
        ("b" "roam template example" plain (file "~/Dropbox/documents/org/roam/templates/BookTemplate.org")
         :if-new (file+head "book/%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n")
         :unnarrowed t)
        ("P" "project" plain "* Goals\n\n%?\n\n* Resources\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Somedaymaybe\n\n"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: ${title}\n#+filetags: project")
         :unnarrowed t)))

;; ----------------------------------------------------------------

;;; org_roam.el ends here
