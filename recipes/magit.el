;;; programming.el --- programming stuff
;;; Commentary:
;; lalala
;;; Code:

;; [2021-07-01] "Magit" - can not imagine working with git without it. Instead of
;; writing full commands like: "git add ." and then "git commit -m 'bla
;; blaa'" then "git push"... I can simply `C-x g` for a git status. Then
;; `s` to do git add. And finally `C-c C-c` to invoke git commit and
;; simply write a message. Then press `p` and I just pushed the
;; changes. Way quickier than the termina, believe me.

;; Some notes:
;; - install git first on emacs - https://www.youtube.com/watch?v=ZMgLZUYd8Cw
;; - use personal access token
;; - add this to terminal to save the token for furher use
;; - git config --global credential.helper store
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x C-g" . magit-status)))

;;; magit.el ends here
