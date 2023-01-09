;;; plain-org-wiki.el --- completion command for plain org wiki
;;; Commentary:
;; https://github.com/abo-abo/plain-org-wiki
;;; Code:

(use-package plain-org-wiki
  :ensure t)


(cond ((eq system-type 'windows-nt)
       ;; Windows-specific code goes here.
       (setq plain-org-wiki-directory "C:\\Users\\arvga\\.arvydas\\org\\pkc_notes")
       ;; (setq plain-org-wiki-directory "C:\\Users\\arvga\\Dropbox\\org\\notes\\personal_notes")
       ;; (setq plain-org-wiki-extra-files (directory-files-recursively "C:\\Users\\arvga\\Dropbox\\org\\notes\\pkc_notes" "\.org$"))
       )
      ((eq system-type 'gnu/linux)
       ;; Linux-specific code goes here.
       (setq plain-org-wiki-directory "~/Dropbox/org/")
       ;; (setq plain-org-wiki-extra-files (directory-files-recursively "~/Dropbox/org/notes/" "\.org$"))
       ))

(global-set-key (kbd "C-c n f") 'plain-org-wiki)

;;; plain-org-wiki.el ends here
