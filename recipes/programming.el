;;; programming.el --- programming stuff
;;; Commentary:
;; lalala
;;; Code:

;; Elpy
;; [2022-02-20 Sk] TUT: "Elpy" - various python modes for easier python
;; programming. Installs various other packages as well.  A few videos to
;; help install elpy and
;; customize.

;; https://www.youtube.com/watch?v=0kuCeS-mfyc,
;; https://www.youtube.com/watch?v=mflvdXKyA_g
;; [[https://www.ruiying.online/post/use-emacs-as-python-ide/][Helpful blog post]]
;; [[https://elpy.readthedocs.io/en/latest/index.html][Elpy official docs]]
;; [[https://elpy.readthedocs.io/_/downloads/en/stable/pdf/][Elpy docs pdf]]
;; When using tab auto completion, click f1 and get the explanation in
;; another buffer. Company doccumentation window.  and of course more
;; amazing [[https://gist.github.com/mahyaret/a64d209d482fc0f5eca707f12ccce146][shortcuts]] Here.

;; INSTALL:
;; 1. add export PATH=$PATH:~/.local/bin to your .bashrc file and reload
;;    emacs.
;; 2. should get a message asking something about RPC, click yes.
;; 3. then make sure jedi is installed in your system. others use flake8,
;;    others use jedi.. idk. zamansky and the guy from he tutorial video
;;    use jedi.
;; 4. do M-x elpy-config to see the config
;; 5. check your .emacs.d folder. if there is one called "elpy" and it is
;;    empty or something, do M-x elpy-rpc-restart. Folders will appear,
;;    packages will install. Then do elpy-coppnfig.q
;; 6. pip install flake8 - get to see more syntax checks. M-x elpy-config
;;    to confirm its installed

;; INSTALLS: yasnippet, pyenv, hightlight-indentation, elpy

(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")
(setq elpy-get-info-from-shell t)
(use-package elpy
  :ensure t
  :custom (elpy-rpc-backend "jedi")
  :init
  (elpy-enable))
;; :bind (("M-." . elpy-goto-definition)))
(setq elpy-rpc-virtualenv-path 'current)
(set-language-environment "UTF-8")

;; <2022-03-18 Pn> Turned it off, doesn't look nice
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))

(use-package company-quickhelp
  :ensure t
  :config
  (company-quickhelp-mode 1)
  (eval-after-load 'company
    '(define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin)))
(setq company-quickhelp-delay 0)

;; Diff Highlight
;; [2022-03-08 An] https://github.com/dgutov/diff-hl
(use-package diff-hl
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'diff-hl-mode)
  (add-hook 'org-mode-hook #'diff-hl-mode)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-post-refresh)

  (add-hook 'prog-mode-hook #'diff-hl-margin-mode)
  (add-hook 'org-mode-hook #'diff-hl-margin-mode)
  (add-hook 'dired-mode-hook 'diff-hl-margin-mode)
  )

;; Magit
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
;; #+BEGIN_SRC emacs-lisp
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x C-g" . magit-status)))

;; Yasnippet
;; [2022-02-13 Sk] "[[https://www.youtube.com/watch?v=YDuqSwyZvlY][Yasnippet]]" - expand to a switch statement with placeholders. Tab
;; between the placeholders & type actual values. like in [[https://www.youtube.com/watch?v=mflvdXKyA_g&list=PL-mFLc7R_MJdX0MxrqXEV4sM87hmVEkRw&index=2&t=67s][this]] video.
;; I am kind of too new to programming to be using snippets, but its nice,
;; keeping this plugin for now.  It installs kind of many
;; snippets... hope that doesn't slow emacs down. Shouldnt...
;; You can also create your own snippet... possibly even for .org files.
(use-package yasnippet-snippets         ; Collection of snippets
  :disabled t)
(use-package yasnippet                  ; Snippets
  :disabled t)
;; (yas-global-mode 1)

;; Csv mode
;; [2022-03-13 Sk]
(use-package csv-mode
  :ensure t
  :mode "\\.csv\\'")

;; shell-other-window
(defun eshell-other-window ()
  "Open a `shell' in a new window."
  (interactive)
  (let ((buf (eshell)))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-frame buf)))

;;; programming.el ends here
