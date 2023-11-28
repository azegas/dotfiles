;; wrote this line to load org mode, so its faster to open org files,
;; but did not help... hmm.. need to look for other reasons org files
;; might open slow
(require 'org)

;; ;; setup below is to access the org-agenda-files DIRECTORY quickly
;; (defun open-agenda-files-dir-in-dired ()
;;   (interactive)
;;   (dired my/org-agenda-files-location))
;; ;; Bind a key to the function
;; (global-set-key (kbd "M-`") 'open-agenda-files-dir-in-dired)

;; setup below is to access the org-agenda-FILE quickly.
;; Function to open the inbox.org file
(defun open-inbox-agenda-file ()
  (interactive)
  (find-file (expand-file-name my/inbox-agenda-file denote-directory)))
(global-set-key (kbd "M-`") 'open-inbox-agenda-file)
