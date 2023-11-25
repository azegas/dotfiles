;; jump to my main init.el file
(defun aga-find-init.el nil
  (interactive)

  (find-file (concat my/emacs-dir "/init.el")))

(global-set-key (kbd "C-x <C-backspace>") 'aga-find-init.el)

;; Easily jump to my package files in dired
(defun aga-find-packages nil
  (interactive)

  (dired my/emacs-config-dir))

(global-set-key (kbd "C-x <C-home>") 'aga-find-packages)




;; write all the commands that I know here lol? okay. look through all
;; the packages and see.

;; ‘M-o’ while in ‘C-x C-f’ - from counsil
;; projectile commands cpf list projects etc
