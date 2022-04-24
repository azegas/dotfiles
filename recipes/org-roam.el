;;; org_roam.el --- org_roam stuff
;;; Commentary:
;; magical org_roam stuff
;; [2022-03-20 Sk] Finally managed to make it work. Ignored some steps
;; from the tutorial and it just works. Let's see what the hype is all
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

  ;; org-roam-capture-templates
  (org-roam-capture-templates
   '(("d" "default" plain
      "* ${title}\n\n%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                         "#+title: ${title}\n#+date: %U\n\n")
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

  (org-roam-dailies-capture-templates
   (let ((head
          (concat
           "#+title: %<%Y-%m-%d, %A>\n#+STARTUP: content\n\n\n* Inbox\n* Log\n* [/] Dailies\n- [ ] Morning pages\n- [ ] Check the weather for today\n- [ ] Duo + letra + what you remember\n- [ ] Go through inbox\n- [ ] Go through google keep\n- [ ] Git push config\n- [ ] Git push org\n- [ ] Git push\n- [ ] Anki\n- [ ] Check agenda\n- [ ] Check email")))
     `(("d" "default" entry
        "* %?"
        :if-new (file+head+olp "%<%Y>/%<%B>/%<%Y-%m-%d>.org" ,head ("Inbox"))
        :unnarrowed t)
       ("j" "journal" entry
        "* %U: %?"
        :if-new (file+head+olp "%<%Y>/%<%B>/%<%Y-%m-%d>.org" ,head ("Log")))
       ("t" "Do Today" entry
        "** %a %?"
        :if-new (file+head+olp "%<%Y>/%<%B>/%<%Y-%m-%d>.org" ,head ("Inbox"))
        :immediate-finish t))))

  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ;; ("C-c n B" . my/org-roam-capture-inbox)
         ("C-c n b" . my/org-roam-capture-inbox-plain)
         ("C-c n I" . org-roam-node-insert-immediate)
         ("C-c n p" . my/org-roam-find-project)
         ("C-c n t" . my/org-roam-capture-task)
         ;; ("C-c n b" . my/org-roam-capture-inbox)
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

;; Copy completed to dailies
;; [2022-03-23 Tr] Automatically copy (or move) completed tasks to dailies from here -
;; https://systemcrafters.net/build-a-second-brain-in-emacs/5-org-roam-hacks/
;; This might be nice, BUT then it also copies my habits, which are files
;; with loads of info under them... don't really want to clutter my
;; org-roam files with that unnecessary information. Should I get rid of
;; org-habits to accommodate THIS feature? Is it even that good? How it
;; is more beneficial to store notes in archive, nice and tidy AS WELL AS
;; in org-roam daily files? Daily file overview sounds very nice. See
;; what and how much time I have spend on activities that day. And then
;; also if I want to see how much time I have spend on "project x", I can
;; just go to archive and sum the time there. And about the habits.. I
;; guess I have to get rid of them. Not really a big deal, I think I
;; should rid some habits, since I have been repeating them for a long
;; time already. So.. at the end, it's good that I discovered this method
;; below, I get a chance to clean up my org-habits :)

;; It sucks that I can not add habits like so. It simply copies the whole
;; task, with ALL timestamps... not helpful for when I want to check how
;; much time I have spend on that day.

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

;; Project files into agenda
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

;; Org-roam-insert-immediate
(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (push arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

;; Capture to inbox
;; [2022-03-23 Tr] Create inbox function, keybinding above.
;; Do I actually need it? I can simply use the capture templates as
;; before. Leaving it here for reference.
;; [2022-03-27 Sk] Yes I need it. using roam features instead of regular
;; org templates.
;; [2022-03-28 Pr] One with timestamps and everything, another without
;; [2022-03-30 Tr] Turned off inbox stuff, because changed
;; org-roam-capture-template. Now inbox will be in individual daily files.

;; (defun my/org-roam-capture-inbox ()
;;   (interactive)
;;   (org-roam-capture- :node (org-roam-node-create)
;;                      :templates '(("i" "inbox" plain "** TODO %u %? %^G\n\n:PROPERTIES:\n:Effort: %^{effort|1:00|0:00|0:05|0:10|0:30|2:00|4:00}\n:END:\n"
;;                                    :if-new (file+head "Inbox.org"
;;                                                       "#+title: Inbox\n")))))
;;   (defun my/org-roam-capture-inbox-plain ()
;;   (interactive)
;;   (org-roam-capture- :node (org-roam-node-create)
;;                      :templates '(("i" "inbox" plain "** TODO %u %?"
;;                                    :if-new (file+head "Inbox.org"
;;                                                       "#+title: Inbox\n")))))

;; Open a list of projects
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

;; Add task to a specific project
;; [2022-03-26 Št] Capture template works better, it adds tags, adds
;; effort automatically.

(defun my/org-roam-capture-task ()
  (interactive)
  ;; Add the project file to the agenda after capture is finished
  (add-hook 'org-capture-after-finalize-hook #'my/org-roam-project-finalize-hook)

  ;; Capture the new task, creating the project file if necessary
  (org-roam-capture- :node (org-roam-node-read
                            nil
                            (my/org-roam-filter-by-tag "project"))
                     :templates '(("c" "clocked-task" plain "** TODO %? :${title}:\n\n:PROPERTIES:\n:Effort: %^{effort|1:00|0:00|0:05|0:10|0:30|2:00|4:00}\n:Created: %u\n:END:\n"
                                   :if-new (file+head+olp "%<%Y%m%d%H%M%S>-${slug}.org"
                                                          "#+title: ${title}\n#+category: ${title}\n#+filetags: project"
                                                          ("${title}")))
                                  ("t" "task" plain "** %? :${title}:\n\n:PROPERTIES:\n:Created: %u\n:END:\n"
                                   :if-new (file+head+olp "%<%Y%m%d%H%M%S>-${slug}.org"
                                                          "#+title: ${title}\n#+category: ${title}\n#+filetags: project"
                                                          ("${title}")))
                                  ("p" "pkc tickler" plain "** %? :pkc:\n\n:PROPERTIES:\n:Created: %u\n:END:\n"
                                   :if-new (file+head+olp "%<%Y%m%d%H%M%S>-${slug}.org"
                                                          "#+title: ${title}\n#+category: ${title}\n#+filetags: project"
                                                          ("pkc tickler")))
                                  ("i" "iskvietimas" plain (file "~/Dropbox/documents/org/roam/templates/BookTemplate.org")
                                   :if-new (file+head+olp "%<%Y%m%d%H%M%S>-${slug}.org"
                                                          "#+title: ${title}\n#+category: ${title}\n#+filetags: project"
                                                          ("${title}"))))))

;;; org_roam.el ends here
