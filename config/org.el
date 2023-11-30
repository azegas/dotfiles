;; wrote this line to sload org mode, so its faster to open org files,
;; but did not help... hmm.. need to look for other reasons org files
;; might open slow
(require 'org)

;; -------------------------------------------------------------------

;; ORG GENERAL

;; RET to follow links
(setq org-return-follows-link t)
;; Make the indentation look nicer in org mode. Pull the second level
;; and higher level headings from the left side
(add-hook 'org-mode-hook 'org-indent-mode)
;; open source block window under the current buffer (C-c ')
(setq org-src-window-setup `split-window-below)
;; rebind active time-stamp to inactive. For some reason I got used to
;; using inactive timestamps, maybe because they don't show up in
;; agenda then
;; (with-eval-after-load 'org
;;   (bind-key "C-c ." #'org-time-stamp-inactive org-mode-map))

;; -------------------------------------------------------------------

;; ORG AGENDA

;; nezaidziu su mandrais linkais, tiesiog specifyinu agenda failus
;; paprastai
(setq org-agenda-files '(
			 "/home/arvy/GIT/notes/20231128T133226--inbox-task-file__planning.org"
			 ;; "/home/arvy/GIT/notes/20231128T133226--inbox-task-file__planning.org_archive"
			 ))

(global-set-key (kbd "C-c a") 'org-agenda)

;; setup below is to access the org-agenda-FILE quickly.
;; Function to open the inbox.org file
(defun open-inbox-file ()
  (interactive)
  (find-file (expand-file-name my/inbox-file denote-directory)))
(global-set-key (kbd "M-`") 'open-inbox-file)

;; set default todo keywords (C-t)
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "|" "DONE(d)" "CANCELLED(c)"))))

;; Hook to display the agenda in a single window by deleting all the
;; other windows
(add-hook 'org-agenda-finalize-hook 'delete-other-windows)

(setq org-agenda-prefix-format '(
  ;; default is the example below for agenda and for todo, tags views
  ;; when pressing c-a t/m. I make everything to be a dot, since my
  ;; agenda file is one.

  ;; (agenda  . " %i %-12:c%?-12t% s") ;; file name + org-agenda-entry-type
  (agenda  . "  • ")
  (timeline  . " • ")
  (todo  . " • ")
  (tags  . " • ")
  (search . " • ")
  ))

(setq org-agenda-custom-commands
      '(("A" "Active Tags" tags "watch"
	 ((org-agenda-overriding-header "My Active items")
	  (org-tags-match-list-sublevels t)
	  (org-agenda-prefix-format "  %?-12t% s")))))

;; -------------------------------------------------------------------

;; ORG REFILE
;; set org refile targets. (C-w)
(setq org-refile-targets '((org-agenda-files :maxlevel . 1)))

;; -------------------------------------------------------------------
;; ORG CAPTURE
;; set a keybinding for org-captuer
(define-key global-map "\C-cc" 'org-capture)
;; make a file location of a "capture-file". In my case it's only
;; file(check previous emacs configs for examples with multiple files)
;; setup capture templates
(setq org-capture-templates
      '(
	("i" "Inbox" entry (file+headline my/inbox-file "Inbox")
	 "* TODO %? \n:PROPERTIES:\n:CAPTURED:%U\n:END:\n\n")
	)
      )
;; -------------------------------------------------------------------
