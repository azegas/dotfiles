;; wrote this line to sload org mode, so its faster to open org files,
;; but did not help... hmm.. need to look for other reasons org files
;; might open slow
(require 'org)

;; -------------------------------------------------------------------

;; ORG GENERAL

;; RET to follow links
(setq org-return-follows-link t)

;; open source block window under the current buffer (C-c ')
(setq org-src-window-setup `split-window-below)
;; rebind active time-stamp to inactive. For some reason I got used to
;; using inactive timestamps, maybe because they don't show up in
;; agenda then
;; (with-eval-after-load 'org
;;   (bind-key "C-c ." #'org-time-stamp-inactive org-mode-map))

;; -------------------------------------------------------------------

;; ORG AGENDA

;; set default todo keywords (C-t)
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "|" "DONE(d)" "CANCELLED(c)"))))

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
