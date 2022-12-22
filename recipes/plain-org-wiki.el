;;; plain-org-wiki.el --- completion command for plain org wiki
;;; Commentary:
;; https://github.com/abo-abo/plain-org-wiki
;;; Code:

(use-package plain-org-wiki
  :ensure t)


(cond ((eq system-type 'windows-nt)
       ;; Windows-specific code goes here.
       (setq plain-org-wiki-directory "C:\\Users\\arvga\\Dropbox\\org\\notes\\")
       )
      ((eq system-type 'gnu/linux)
       ;; Linux-specific code goes here.
       (setq plain-org-wiki-directory "~/Dropbox/org/notes")
       ))

(global-set-key (kbd "C-c n f") 'plain-org-wiki)

;;; plain-org-wiki.el ends here
