;;; org.el --- org stuff
;;; Commentary:
;; regular org stuff
;;; Code:

(setq org-log-into-drawer "LOGBOOK")
(setq org-hide-emphasis-markers t) ; Hide * and / in org tex.
(setq org-log-done 'time)
(setq org-startup-indented t)           ; heading indentation
(setq org-return-follows-link t)        ; RET to follow links
(setq org-enforce-todo-dependencies t)  ; no done if mid
(setq org-startup-with-inline-images t)
(setq org-image-actual-width nil)
(setq org-clock-sound "~/Dropbox/src/emacs/misc/bell.wav")

; rebind active to inactive
(with-eval-after-load 'org
  (bind-key "C-c ." #'org-time-stamp-inactive org-mode-map))

;; (setq org-todo-keywords
;;       (quote ((sequence "TODO(t)" "ASK(k)" "IN-PROGRESS(p)" "SKAITYK(s)" "WAITING(w)" "IGALIOK(i)" "BUY(b)" "REMINDER(r)" "HOME(h)" "|" "DONE(d)" "CANCELLED(c)"))))

(setq org-todo-keywords
      (quote ((sequence "10min(1)" "2min(2)" "30min(3)" "1val(v)" "PALEK(p)" "SKAITYK(s)" "|" "DONE(d)" "CANCELLED(c)" "REPEATING(r)"))))

;; list-colors-display
(setq org-todo-keyword-faces
      (quote (("2min" :foreground "IndianRed1" :weight bold)
              ("10min" :foreground "DeepSkyBlue2" :weight bold)
              ("IN-PROGRESS" :foreground "gold1" :weight bold)
              ("PALEK" :foreground "dark cyan" :weight bold))))

;; (setq org-todo-keywords
;;   '((sequence
;;      "TODO(t!)" ; Initial creation
;;      "GO(g@)"; Work in progress
;;      "WAIT(w@)" ; My choice to pause task
;;      "BLOCKED(b@)" ; Not my choice to pause task
;;      "REVIEW(r!)" ; Inspect or Share Time
;;      "|" ; Remaining close task
;;      "DONE(d)" ; Normal completion
;;      "CANCELED(c)" ; Not going to od it
;;      "DUPLICATE(p)" ; Already did it
;;      )))

;; (setq org-tag-alist '((:startgroup . nil)
;;                       ("@anywhere" . ?a)
;;                       ("@buy" . ?b)
;;                       ("@call" . ?c)
;;                       ("@home" . ?h)
;;                       ("@komputer" . ?k)
;;                       ("@readreview" . ?r)
;;                       ("@repeating" . ?R)
;;                       ("@travel" . ?t)
;;                       ("@pnvz" . ?z)
;;                       ("@waitingfor" . ?w)
;;                       (:endgroup . nil)
;;                       ("emacs" . ?e)
;;                       ("somedaymaybe" . ?s)
;;                       ("pkc" . ?p)))

(setq org-use-tag-inheritance '("somedaymaybe" "@readreview"))
(setq org-agenda-tags-todo-honor-ignore-options t)
(setq org-fast-tag-selection-single-key 'expert)

(add-hook 'org-capture-mode-hook
          (lambda ()
            (setq-local org-tag-alist (org-global-tags-completion-table))))

;; Effort
(setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")
(setq org-global-properties (quote (("Effort_ALL" . "1:00 0:00 0:05 0:10 0:30 2:00 3:00 4:00")
                                    ("STYLE_ALL" . "habit"))))

;; https://orgmode.org/manual/Editing-Source-Code.html
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

;; [2022-04-10 Sun] org tempo added before, now just added templates
(use-package org-tempo
  :after org
  :config
  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("py" . "src python ")))


;; Archiving notes
;; TUT: more about archiving -
;; http://doc.endlessparentheses.com/Var/org-archive-location.html
;; its possible to archive like so:
;; # archiving example
;; #+archive: ~/Dropbox/documents/org/emacs_backups/archive/%s_datetree::datetree/
;; #+archive: ~/Dropbox/documents/org/emacs_backups/archive/archive.org::datetree/* From %s
;; #+archive: ~/Dropbox/documents/org/emacs_backups/archive/archive.org::** From %s
;; #+archive: ::* Archived Tasks - internal archiving
;; #+archive: ::** Arvydas.dev ARCHIVED
;; #+archive: ~/Dropbox/documents/org/references/archive.org::* From Blog

;; archiving with a help of refile into one big archive.org file -
;; dont need all those archive labels in properties tag. too many date
;; inputs to sort through
;; (setq org-archive-location "~/Dropbox/documents/org/archive/%s_archive::* archive")
(setq org-archive-location "~/Dropbox/documents/org/archive/archive_2022-06.org::* archive june")

;; automatically save files that were refiled to. Taken from here:
;; https://github.com/rougier/emacs-gtd/issues/9

;; Automatically get the files in "~/Documents/org"
;; with fullpath
;; (setq org-agenda-files 
;;       (mapcar 'file-truename 
;; 	      (file-expand-wildcards "~/Dropbox/documents/org/roam/projects/* .org")))

;; Save the corresponding buffers
(defun gtd-save-org-buffers ()
  "Save `org-agenda-files' buffers without user confirmation.
See also `org-save-all-org-buffers'"
  (interactive)
  (message "Saving org-agenda-files buffers...")
  (save-some-buffers t (lambda () 
			 (when (member (buffer-file-name) org-agenda-files) 
			   t)))
  (message "Saving org-agenda-files buffers... done"))

;; Add it after refile
(advice-add 'org-refile :after
	    (lambda (&rest _)
	      (gtd-save-org-buffers)))

;;; org.el ends here
