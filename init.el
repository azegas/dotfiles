;;; init.el --- Main init
;;; Commentary:
;; Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter: it simply makes everything else vanish. – Neal Stephenson,
;; In the Beginning was the Command Line (1998)
;;; Code:

;; Initialize package sources
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

;; (org-babel-load-file (expand-file-name "~/Dropbox/src/emacs/myinit.org"))

;; trying to make lsp faster
;; works fine without it on 28 emacs (m-x lsp-doctor)
;; (setenv "LSP_USE_PLISTS" "1")

(cond ((eq system-type 'windows-nt)
       ;; Windows-specific code goes here.
       (message "loaded windows")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\ace-window.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\avy.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\backups.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\beacon.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\browse-kill-ring.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\company.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\counsel.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\diff-hl.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\dired.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\doom-themes.el")
       ;;(load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\doom-modeline.el")
       ;;(load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\elfeed.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\elpy.el")
       ;;(load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\emojify.el")
       ;;(load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\erc.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\expand-region.el")
       ;; (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\flycheck.el")
       ;; (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\flyspell.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\general.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\goto-chg.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\hungry-delete.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\impatient-mode.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\ivy.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\jump.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\macros.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\magit.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\move-text.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\multiple-cursors.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\org.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\org-archive.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\org-agenda.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\org-capture.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\org-clock.el")
       ;;(load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\org-download.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\projectile.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\rainbow-delimiters.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\rg.el")
       ;;(load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\super-save.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\saveplace.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\swiper.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\undo-tree.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\treemacs.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\visuals.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\volatile-highlights.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\command-log-mode.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\lsp-mode.el")
       ;;(load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\ws-butler.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\yasnippet.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\json-mode.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\rjsx-mode.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\prettier-js.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\dap-mode.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\exec-path-from-shell.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\python.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\markdown-mode.el")
       ;;(load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\evil.el")
       ;; (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\emacs-dashboard.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\highlight-indentation.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\plain-org-wiki.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\db.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\powershell.el")

       ;;webdev stuff
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\web-mode.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\emmet.el")
       ;;(load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\scss-mode.el")
       ;;(load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\lorem-ipsum.el")

       ;;JavaScript stuff
       ;;inspiration for js things "redguardtoo" on github
       ;;(load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\js-comint.el")
       ;;(load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\js2-mode.el")
       ;;(load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\tern.el")
       ;;(load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\skewer-mode.el")
       )
      ((eq system-type 'gnu/linux)
       ;; Linux-specific code goes here.
       (message "loaded linux")
       ;; MUST HAVE
       (load "~/.emacs.d/recipes/ace-window.el")
       (load "~/.emacs.d/recipes/backups.el")
       (load "~/.emacs.d/recipes/browse-kill-ring.el")
       (load "~/.emacs.d/recipes/company.el")
       (load "~/.emacs.d/recipes/ivy.el")
       (load "~/.emacs.d/recipes/counsel.el")
       (load "~/.emacs.d/recipes/diff-hl.el")
       (load "~/.emacs.d/recipes/dired.el")
       (load "~/.emacs.d/recipes/doom-themes.el")
       (load "~/.emacs.d/recipes/elpy.el")
       (load "~/.emacs.d/recipes/expand-region.el")
       (load "~/.emacs.d/recipes/general.el")
       (load "~/.emacs.d/recipes/goto-chg.el")
       (load "~/.emacs.d/recipes/hungry-delete.el")
       (load "~/.emacs.d/recipes/jump.el")
       (load "~/.emacs.d/recipes/macros.el")
       (load "~/.emacs.d/recipes/magit.el")
       (load "~/.emacs.d/recipes/org.el")
       (load "~/.emacs.d/recipes/org-archive.el")
       (load "~/.emacs.d/recipes/org-agenda.el")
       (load "~/.emacs.d/recipes/org-capture.el")
       (load "~/.emacs.d/recipes/org-clock.el")
       (load "~/.emacs.d/recipes/projectile.el")
       (load "~/.emacs.d/recipes/rg.el")
       (load "~/.emacs.d/recipes/saveplace.el")
       (load "~/.emacs.d/recipes/swiper.el")
       (load "~/.emacs.d/recipes/undo-tree.el")
       (load "~/.emacs.d/recipes/visuals.el")
       (load "~/.emacs.d/recipes/lsp-mode.el")
       (load "~/.emacs.d/recipes/json-mode.el")
       (load "~/.emacs.d/recipes/exec-path-from-shell.el")
       (load "~/.emacs.d/recipes/python.el")
       (load "~/.emacs.d/recipes/plain-org-wiki.el")
       (load "~/.emacs.d/recipes/db.el")
       (load "~/.emacs.d/recipes/powershell.el")

       (load "~/.emacs.d/recipes/beacon.el")
       (load "~/.emacs.d/recipes/avy.el")
       (load "~/.emacs.d/recipes/doom-modeline.el")
       ;;(load "~/.emacs.d/recipes/elfeed.el")
       ;;(load "~/.emacs.d/recipes/emojify.el")
       ;;(load "~/.emacs.d/recipes/erc.el")
       (load "~/.emacs.d/recipes/flycheck.el")
       (load "~/.emacs.d/recipes/flyspell.el")
       (load "~/.emacs.d/recipes/impatient-mode.el")
       (load "~/.emacs.d/recipes/move-text.el")
       (load "~/.emacs.d/recipes/multiple-cursors.el")
       (load "~/.emacs.d/recipes/rainbow-delimiters.el")
       ;; (load "~/.emacs.d/recipes/org-download.el")
       ;;(load "~/.emacs.d/recipes/super-save.el")
       (load "~/.emacs.d/recipes/treemacs.el")
       (load "~/.emacs.d/recipes/volatile-highlights.el")
       ;; (load "~/.emacs.d/recipes/command-log-mode.el")
       (load "~/.emacs.d/recipes/ws-butler.el")
       (load "~/.emacs.d/recipes/yasnippet.el")
       ;; (load "~/.emacs.d/recipes/rjsx-mode.el")
       (load "~/.emacs.d/recipes/prettier-js.el")
       ;; (load "~/.emacs.d/recipes/dap-mode.el")
       (load "~/.emacs.d/recipes/markdown-mode.el")
       ;;(load "~/.emacs.d/recipes/evil.el")
       ;; (load "~/.emacs.d/recipes/emacs-dashboard.el")
       (load "~/.emacs.d/recipes/highlight-indentation.el")
       (load "~/.emacs.d/recipes/org-static-blog.el")
       (load "~/.emacs.d/recipes/org-pomodoro.el")
       (load "~/.emacs.d/recipes/dockerfile-mode.el")
       (load "~/.emacs.d/recipes/yaml-mode.el")
       (load "~/.emacs.d/recipes/vterm.el")
       (load "~/.emacs.d/recipes/shell-pop.el")


;;webdev stuff
(load "~/.emacs.d/recipes/web-mode.el")
(load "~/.emacs.d/recipes/emmet.el")
;;(load "~/.emacs.d/recipes/scss-mode.el")
(load "~/.emacs.d/recipes/lorem-ipsum.el")

;;JavaScript stuff
;;inspiration for js things "redguardtoo" on github
;;(load "~/.emacs.d/recipes/js-comint.el")
;;(load "~/.emacs.d/recipes/js2-mode.el")
;;(load "~/.emacs.d/recipes/tern.el")
;;(load "~/.emacs.d/recipes/skewer-mode.el")
       ))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("28a34dd458a554d34de989e251dc965e3dc72bace7d096cdc29249d60f395a82" "d0fd069415ef23ccc21ccb0e54d93bdbb996a6cce48ffce7f810826bb243502c" "ffba0482d3548c9494e84c1324d527f73ea4e43fff8dfd0e48faa8fc6d5c2bc7" "8f5b54bf6a36fe1c138219960dd324aad8ab1f62f543bed73ef5ad60956e36ae" "251ed7ecd97af314cd77b07359a09da12dcd97be35e3ab761d4a92d8d8cf9a71" "1a1ac598737d0fcdc4dfab3af3d6f46ab2d5048b8e72bc22f50271fd6d393a00" "ea5822c1b2fb8bb6194a7ee61af3fe2cc7e2c7bab272cbb498a0234984e1b2d9" "854a1ae47e79e1d8c80b4e2f1e20f80450cf9ddd103e8f9d7dcd400b3d7325b1" default))
 '(org-agenda-files
   '("/home/arvydas/Dropbox/org/api.org" "/home/arvydas/Dropbox/org/birthdays.org" "/home/arvydas/Dropbox/org/books.org" "/home/arvydas/Dropbox/org/codeacademy.org" "/home/arvydas/Dropbox/org/db.org" "/home/arvydas/Dropbox/org/django.org" "/home/arvydas/Dropbox/org/emacs.org" "/home/arvydas/Dropbox/org/errors.org" "/home/arvydas/Dropbox/org/flask.org" "/home/arvydas/Dropbox/org/freelance.org" "/home/arvydas/Dropbox/org/git.org" "/home/arvydas/Dropbox/org/inbox.org" "/home/arvydas/Dropbox/org/journal.org" "/home/arvydas/Dropbox/org/julyte.org" "/home/arvydas/Dropbox/org/laptop.org" "/home/arvydas/Dropbox/org/learned.org" "/home/arvydas/Dropbox/org/lfw.org" "/home/arvydas/Dropbox/org/linux.org" "/home/arvydas/Dropbox/org/namas.org" "/home/arvydas/Dropbox/org/network.org" "/home/arvydas/Dropbox/org/pagalbaGyvunams.org" "/home/arvydas/Dropbox/org/pencija.org" "/home/arvydas/Dropbox/org/personal.org" "/home/arvydas/Dropbox/org/photography.org" "/home/arvydas/Dropbox/org/productivity.org" "/home/arvydas/Dropbox/org/projectIdeas.org" "/home/arvydas/Dropbox/org/quotes.org" "/home/arvydas/Dropbox/org/raspberry.org" "/home/arvydas/Dropbox/org/repeating.org" "/home/arvydas/Dropbox/org/shortcuts.org" "/home/arvydas/Dropbox/org/smuti.org" "/home/arvydas/Dropbox/org/someday.org" "/home/arvydas/Dropbox/org/vim.org" "/home/arvydas/Dropbox/org/visit.org" "/home/arvydas/Dropbox/org/vsCode.org" "/home/arvydas/Dropbox/org/watch.org" "/home/arvydas/Dropbox/org/website.org"))
 '(package-selected-packages
   '(shell-pop vterm org-download treemacs yaml-mode dockerfile-mode org-pomodoro org-static-blog ivy-rich powershell which-key web-mode volatile-highlights use-package undo-tree rjsx-mode rg rainbow-delimiters projectile prettier-js plain-org-wiki multiple-cursors move-text magit lsp-ui lsp-ivy lorem-ipsum json-mode impatient-mode hungry-delete helpful goto-chg flycheck expand-region exec-path-from-shell emmet-mode elpy doom-themes doom-modeline dired-git-info diff-hl dashboard dap-mode csv-mode counsel company-quickhelp browse-kill-ring beacon amx all-the-icons-ivy-rich ahk-mode))
 '(warning-suppress-log-types '((auto-save) (auto-save)))
 '(warning-suppress-types '((auto-save))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
