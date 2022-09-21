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
  (org-roam-node-display-template "${tags:10} ${title:100}")
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n I" . org-roam-node-insert-immediate)
         :map org-mode-map
         ("C-M-i" . completion-at-point))
  :config
  (require 'org-roam-export)
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

;; ORG-ROAM-CAPTURE-TEMPLATES - new roam files
(setq org-roam-capture-templates
      '(("d" "default roam file" plain
         "* ${title}\n\n%?"
         :if-new (file+head "personal/%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n#+date: %U\n\n")
         :unnarrowed t)
        ("b" "blog file" plain
         "* ${title}\n\n%?"
         :if-new (file+head "personal/blog/%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n#+date: %U\n\n")
         :unnarrowed t)
        ;; ("p" "pkc roam file" plain
        ;;  "\n* ${title}\n%?\n* related notes"
        ;;  :if-new (file+head "pkc/%<%Y%m%d%H%M%S>-${slug}.org"
        ;;                     "#+title: ${title}\n#+date: %U\n#+filetags: pkc\n\n")
        ;;  :unnarrowed t)
        ;; ("b" "roam template example" plain (file "~/Dropbox/documents/org/roam/templates/BookTemplate.org")
        ;;  :if-new (file+head "book/%<%Y%m%d%H%M%S>-${slug}.org"
        ;;                     "#+title: ${title}\n")
        ;;  :unnarrowed t)
        ("P" "project file" plain "* Goals\n\n%?\n\n* Resources\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Somedaymaybe\n\n\n* nepamirsk pridet i agenda per roam_config (my/org-roam-refresh-agenda-list), tuomet C-h v org-agenda-files and save config with new file\n\n"
         :if-new (file+head "projects/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: ${title}\n#+filetags: Project")
         :unnarrowed t)))

;; ----------------------------------------------------------------

;; PROJECT  STUFF

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
  (setq org-agenda-files (my/org-roam-list-notes-by-tag "Project")))

;; Build the agenda list the first time for the session
(my/org-roam-refresh-agenda-list)

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
   (my/org-roam-filter-by-tag "Project")
   :templates
   '(("p" "project" plain "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
      :if-new (file+head "projects/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: ${title}\n#+filetags: Project")
      :unnarrowed t))))

(global-set-key (kbd "C-c n p") #'my/org-roam-find-project)

;;; org_roam.el ends here
