;; [2021-07-01] “Magit” - can not imagine working with git without
;; it. Instead of writing full commands like: “git add .” and then “git
;; commit -m ‘bla blaa’” then “git push”… I can simply `C-x g` for a git
;; status. Then `s` to do git add. And finally `C-c C-c` to invoke git
;; commit and simply write a message. Then press `p` and I just pushed
;; the changes. Way quickier than the termina, believe me.

;; Some notes:

;; - install git first on emacs - https://www.youtube.com/watch?v=ZMgLZUYd8Cw
;; - use personal access token
;; - add this to terminal to save the token for furher use
;; - git config –global credential.helper store

;; Execute the following lines in your terminal before trying to do
;; any commands with Magit.

;; git config --global credential.helper store
;; git config --global user.name arvydasg
;; git config --global user.email azegaspa@gmail.com

;; When you push anything, you will get prompted to enter a
;; password. Enter the ¨personal access token¨ from github developer
;; settings.

(use-package magit
  :ensure t)

;; cool, can see the commands magit is running by going to
;; "magi-process" buffer in emacs while in git repo
