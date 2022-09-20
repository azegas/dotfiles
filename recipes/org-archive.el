;;; org-archive.el --- just org archiving conf file
;;; Commentary:
;; nope
;;; Code:

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
(setq org-archive-location "~/Dropbox/documents/org/archive/archive_2022-09.org::* archive September")

;;; org-archive.el ends here
