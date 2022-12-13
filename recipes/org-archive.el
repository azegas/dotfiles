;;; org-archive.el --- just org archiving conf file
;;; Commentary:
;; nope
;;; Code:

;; last customization - 2022.09.20
;; changed from one massive archive file that all roam projects output
;; to internal archiving. But then noticed, that when I archive, the
;; buffer gets reverted each time, all headings get opened and yeah..
;; its a mess and I don't like that. Also, even though the task is done
;; and archived, it remains in the file, therefore shows in org agenda
;; under "achievable tasks". When I noticed this, I decided to stay
;; under the default or archive settings, which just automatically
;; creates .org_archive file for each project file. I am happy about
;; this now.. Will still have all files in one place for a particular
;; project, they will be out of my agenda and I will not have any
;; buffer reverting.

;; Archiving notes
;; TUT: more about archiving -
;; http://doc.endlessparentheses.com/Var/org-archive-location.html
;; https://orgmode.org/worg/doc.html#org-archive-location

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

(setq org-archive-location "~/Dropbox/documents/org/roam/projects/archive/%s_archive::")
;; (setq org-archive-location "~/Dropbox/documents/org/archive/%s_archive::* archive")
;; (setq org-archive-location "~/Dropbox/documents/org/archive/archive_2022-09.org::* archive September")

;;; org-archive.el ends here
