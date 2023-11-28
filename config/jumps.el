;;; ---------------------------------------

(defun ag/find-init.el nil
  (interactive)

  (find-file (concat ag/emacs-dir "/init.el")))

(global-set-key (kbd "C-x <C-backspace>") 'ag/find-init.el)

;; Easily jump to my package files in dired
(defun ag/find-packages nil
  (interactive)

  (dired ag/emacs-config-dir))

(global-set-key (kbd "C-x <C-home>") 'ag/find-packages)
