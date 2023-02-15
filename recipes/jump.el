;;; jump.el --- stuff for a breezy navigation around emacs
;;; Commentary:
;; jumping
;;; Code:

;; Easily jump to my package files in dired
(defun aga-find-packages nil
  "Find the myinit.org file."
  (interactive)

  (cond ((eq system-type 'windows-nt)
         ;; Windows-specific code goes here.
         (dired "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\")
         )
        ((eq system-type 'gnu/linux)
         ;; Linux-specific code goes here.
         (dired "~/.emacs.d/recipes/")
         )))

;; (delete-other-windows))
;; Find myinit.org  file
(global-set-key (kbd "C-x <C-backspace>") 'aga-find-packages)

;; Easily jump to my yasnippet snippet directory in dired
(defun aga-find-snippets nil
  "Find the myinit.org file."
  (interactive)

  (cond ((eq system-type 'windows-nt)
         ;; Windows-specific code goes here.
         (dired "C:\\Users\\arvga\\.arvydas\\src\\emacs\\snippets\\")
         )
        ((eq system-type 'gnu/linux)
         ;; Linux-specific code goes here.
         (dired "~/.emacs.d/snippets/")
         )))

;; Find myinit.org  file
(global-set-key (kbd "C-x <C-prior>") 'aga-find-snippets) ;prior is PgUp

;; jump to my main init.el file
(defun aga-find-init.el nil
  (interactive)

  (cond ((eq system-type 'windows-nt)
         ;; Windows-specific code goes here.
         (find-file "C:\\Users\\arvga\\.arvydas\\src\\emacs\\init.el")
         )
        ((eq system-type 'gnu/linux)
         ;; Linux-specific code goes here.
         (find-file "~/.emacs.d/init.el")
         )))


;; (delete-other-windows))
;; Find init.el file
(global-set-key (kbd "C-x <C-home>") 'aga-find-init.el)

;; jump to my a random js test file
(defun aga-jump-test.js nil
  (interactive)

  (cond ((eq system-type 'windows-nt)
         ;; Windows-specific code goes here.
         (find-file "C:\\Temp\\test.js")
         )
        ((eq system-type 'gnu/linux)
         ;; Linux-specific code goes here.
         (find-file "~/temp/js/test.js")
         ))
  (erase-buffer))
;; (delete-other-windows))
;; Find test.js file
(global-set-key (kbd "C-x j") 'aga-jump-test.js)

;;--------------------------------------------------------

;; jump to my org blog directory
(defun aga-jump-blog-org nil
  (interactive)

  (cond ((eq system-type 'windows-nt)
         ;; Windows-specific code goes here.
         ;; (find-file "C:\\Temp\\test.js")
         )
        ((eq system-type 'gnu/linux)
         ;; Linux-specific code goes here.
         (find-file "~/Dropbox/blog/")
         ))
  (erase-buffer))

;; (delete-other-windows))
;; Find test.js file
(global-set-key (kbd "C-x C-<end>") 'aga-jump-blog-org)

;; jump to my org blog directory
(defun aga-jump-blog-html nil
  (interactive)

  (cond ((eq system-type 'windows-nt)
         ;; Windows-specific code goes here.
         ;; (find-file "C:\\Temp\\test.js")
         )
        ((eq system-type 'gnu/linux)
         ;; Linux-specific code goes here.
         (find-file "~/Dropbox/src/arvydasg.github.io/")
         ))
  (erase-buffer))

;; (delete-other-windows))
;; Find test.js file
(global-set-key (kbd "C-x C-<next>") 'aga-jump-blog-html)

;;--------------------------------------------------------

;;; jump.el ends here
