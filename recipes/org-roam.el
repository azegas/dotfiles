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
