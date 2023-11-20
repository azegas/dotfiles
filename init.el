(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages")
                         ("elpa" .  "https://elpa.gnu.org/packages/" )))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/my-init.org"))

;; trying to make lsp faster
;; works fine without it on 28 emacs (m-x lsp-doctor)
;; (setenv "LSP_USE_PLISTS" "1")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("/home/arvy/org/org-agenda-files/api.org" "/home/arvy/org/org-agenda-files/backlog.org" "/home/arvy/org/org-agenda-files/bikepacking.org" "/home/arvy/org/org-agenda-files/birthdays.org" "/home/arvy/org/org-agenda-files/books.org" "/home/arvy/org/org-agenda-files/commands.org" "/home/arvy/org/org-agenda-files/db.org" "/home/arvy/org/org-agenda-files/django.org" "/home/arvy/org/org-agenda-files/docker.org" "/home/arvy/org/org-agenda-files/emacs.org" "/home/arvy/org/org-agenda-files/epics.org" "/home/arvy/org/org-agenda-files/git.org" "/home/arvy/org/org-agenda-files/inbox.org" "/home/arvy/org/org-agenda-files/journal.org" "/home/arvy/org/org-agenda-files/lfw.org" "/home/arvy/org/org-agenda-files/lifeapi.org" "/home/arvy/org/org-agenda-files/linux.org" "/home/arvy/org/org-agenda-files/network.org" "/home/arvy/org/org-agenda-files/pagalbagyvunams.org" "/home/arvy/org/org-agenda-files/pasiukai.org" "/home/arvy/org/org-agenda-files/personal.org" "/home/arvy/org/org-agenda-files/projideas.org" "/home/arvy/org/org-agenda-files/python.org" "/home/arvy/org/org-agenda-files/quotes.org" "/home/arvy/org/org-agenda-files/raspberry.org" "/home/arvy/org/org-agenda-files/salsa.org" "/home/arvy/org/org-agenda-files/smutifruti.org" "/home/arvy/org/org-agenda-files/travel.org" "/home/arvy/org/org-agenda-files/vim.org" "/home/arvy/org/org-agenda-files/vscode.org" "/home/arvy/org/org-agenda-files/website.org" "/home/arvy/org/org-agenda-files/wsl.org"))
 '(package-selected-packages
   '(typescript-mode ox-gfm emojify elfeed super-save yaml-mode ws-butler which-key web-mode vterm volatile-highlights use-package undo-tree treemacs shell-pop rg rainbow-delimiters projectile prettier-js powershell plain-org-wiki org-static-blog org-pomodoro org-download multiple-cursors move-text magit lsp-ui lsp-ivy lorem-ipsum impatient-mode hungry-delete helpful goto-chg flycheck expand-region exec-path-from-shell emmet-mode elpy doom-themes doom-modeline dockerfile-mode dired-git-info diff-hl dashboard counsel browse-kill-ring beacon amx all-the-icons-ivy-rich))
 '(safe-local-variable-values
   '((eval setq-local org-refile-targets
           '((nil :maxlevel . 2))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
