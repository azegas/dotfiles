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
  :ensure t
  :bind (("C-x g" . magit-status)
	 ("C-x C-g" . magit-status)))


;; Show diff changes in dired
;; [2022-03-08 An] https://github.com/dgutov/diff-hl

(use-package diff-hl
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode #'diff-hl-mode)
  (add-hook 'prog-mode-hook #'diff-hl-mode)
  (add-hook 'org-mode-hook #'diff-hl-mode)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-post-refresh)
  (add-hook 'prog-mode-hook #'diff-hl-margin-mode)
  (add-hook 'org-mode-hook #'diff-hl-margin-mode)
  (add-hook 'dired-mode-hook 'diff-hl-margin-mode))
