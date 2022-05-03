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
(setq org-clock-sound "~/.emacs.d/misc/bell.wav")

; rebind active to inactive
(with-eval-after-load 'org
  (bind-key "C-c ." #'org-time-stamp-inactive org-mode-map))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "IN-PROGRESS(p)" "WAITING(w)" "ISMOK(i)" "|" "DONE(d)" "JOURNAL(j)" "REPEATING(r)" "CANCELLED(c)"))))

(setq org-tag-alist '((:startgroup . nil)
                      ("@anywhere" . ?w)
                      ("@call" . ?t)
                      ("@internet" . ?i)
                      ("@computer" . ?c)
                      ("@home" . ?h)
                      ("@pkc" . ?p)
                      ("@readreview" . ?r)
                      ("@vilnius" . ?v)
                      ("@waitingfor" . ?f)
                      ("@checklist" . ?l)
                      (:endgroup . nil)
                      ("project" . ?p)
                      ("somedaymaybe" . ?s)
                      ("crypt" . ?k)))

(add-hook 'org-capture-mode-hook
          (lambda ()
            (setq-local org-tag-alist (org-global-tags-completion-table))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "IndianRed1" :weight bold)
              ("NEXT" :foreground "DeepSkyBlue2" :weight bold)
              ("IN-PROGRESS" :foreground "gold1" :weight bold)
              ("DONE" :foreground "forest green" :weight bold))))

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
(setq org-archive-location "~/Dropbox/documents/org/roam/20220429211036-archive.org::* archive")

;;; org.el ends here
