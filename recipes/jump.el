;;; jump.el --- stuff for a breezy navigation around emacs
;;; Commentary:
;; jumping
;;; Code:

;; Easily jump to my package files in dired
(defun aga-find-packages nil
  "Find the myinit.org file."
  (interactive)
  (dired "~/Dropbox/src/emacs/recipes/"))
  ;; (delete-other-windows))
;; Find myinit.org  file
(global-set-key (kbd "C-x <C-backspace>") 'aga-find-packages)

;; Easily jump to my yasnippet snippet directory in dired
(defun aga-find-snippets nil
  "Find the myinit.org file."
  (interactive)
  (dired "~/Dropbox/src/emacs/snippets/"))
;; Find myinit.org  file
(global-set-key (kbd "C-x <C-prior>") 'aga-find-snippets)

;; jump to my main init.el file
(defun aga-find-init.el nil
  (interactive)
    (find-file "~/Dropbox/src/emacs/init.el"))
  ;; (delete-other-windows))
;; Find init.el file
(global-set-key (kbd "C-x <C-home>") 'aga-find-init.el)

;; jump to my a random js test file
(defun aga-jump-test.js nil
  (interactive)
  (find-file "~/temp/js/test.js")
  (erase-buffer))
  ;; (delete-other-windows))
;; Find test.js file
(global-set-key (kbd "C-x j") 'aga-jump-test.js)

;;; jump.el ends here
