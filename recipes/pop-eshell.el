;;; pop_eshel.el --- pop_eshell stuff
;;; Commentary:
;; [2022-03-16 Tr] [[https://github.com/stanhe/pop-eshell][This]] is the source code. Git clone to .emacsd/elpa then add the config
;; you see below. With a shortcut of C-c C-e C-e I can now invoke an
;; eshell buffer at the bottom at the screen. Click the shortcut once
;; more and it will close. Super convenient!
;; I use it for django development. I first do M-x pyvenv-activate and
;; choose a env dir. Then I can open the shell and run python manage.py
;; runserver. Works like a charm and stays in the background.
;;; Code:

(add-to-list 'load-path "~/.emacs.d/elpa/pop-eshell")
(require 'pop-eshell-mode)
(setq pop-find-parent-directory '(".git" "gradlew")) ;; parent directory should have .git or gradlew file
(pop-eshell-mode 1)

;; Double click to turn on turn off

;; full screen - (define-key map (kbd "C-c C-e C-f") 'fast-eshell-pop)
;; bottom buffer -  (define-key map (kbd "C-c C-e C-e") 'eshell-pop-toggle)

;;; pop_eshell.el ends here
