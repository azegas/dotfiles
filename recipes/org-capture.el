;;; org_capture.el --- org_capture setuf
;;; Commentary:
;; not using it anymore since org roam
;;; Code:

;; MANY small files below
(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
      '(("t" "TODO" plain (file+headline "~/Dropbox/org/notes/inbox.org" "Inbox")
         "** TODO %?")
        ("n" "NEXT" plain (file+headline "~/Dropbox/org/notes/inbox.org" "Inbox")
         "** NEXT %?")
        ("s" "SKAITYK" plain (file+headline "~/Dropbox/org/notes/inbox.org" "Inbox")
         "** SKAITYK %?")
        ))

;;; org_capture.el ends here
