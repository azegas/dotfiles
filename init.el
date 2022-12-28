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
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\random-packages\\pop-eshell\\pop-eshell-mode.el")
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
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\emacs-dashboard.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\highlight-indentation.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\plain-org-wiki.el")
       (load "C:\\Users\\arvga\\.arvydas\\src\\emacs\\recipes\\db.el")

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
       (load "~/Dropbox/src/emacs/recipes/ace-window.el")
       (load "~/Dropbox/src/emacs/recipes/avy.el")
       (load "~/Dropbox/src/emacs/recipes/backups.el")
       (load "~/Dropbox/src/emacs/recipes/beacon.el")
       (load "~/Dropbox/src/emacs/recipes/browse-kill-ring.el")
       (load "~/Dropbox/src/emacs/recipes/company.el")
       (load "~/Dropbox/src/emacs/recipes/counsel.el")
       (load "~/Dropbox/src/emacs/recipes/diff-hl.el")
       (load "~/Dropbox/src/emacs/recipes/dired.el")
       (load "~/Dropbox/src/emacs/recipes/doom-themes.el")
       ;;(load "~/Dropbox/src/emacs/recipes/doom-modeline.el")
       ;;(load "~/Dropbox/src/emacs/recipes/elfeed.el")
       (load "~/Dropbox/src/emacs/recipes/elpy.el")
       ;;(load "~/Dropbox/src/emacs/recipes/emojify.el")
       ;;(load "~/Dropbox/src/emacs/recipes/erc.el")
       (load "~/Dropbox/src/emacs/recipes/expand-region.el")
       ;; (load "~/Dropbox/src/emacs/recipes/flycheck.el")
       ;; (load "~/Dropbox/src/emacs/recipes/flyspell.el")
       (load "~/Dropbox/src/emacs/recipes/general.el")
       (load "~/Dropbox/src/emacs/recipes/goto-chg.el")
       (load "~/Dropbox/src/emacs/recipes/hungry-delete.el")
       (load "~/Dropbox/src/emacs/recipes/impatient-mode.el")
       (load "~/Dropbox/src/emacs/recipes/ivy.el")
       (load "~/Dropbox/src/emacs/recipes/jump.el")
       (load "~/Dropbox/src/emacs/recipes/macros.el")
       (load "~/Dropbox/src/emacs/recipes/magit.el")
       (load "~/Dropbox/src/emacs/recipes/move-text.el")
       (load "~/Dropbox/src/emacs/recipes/multiple-cursors.el")
       (load "~/Dropbox/src/emacs/recipes/org.el")
       (load "~/Dropbox/src/emacs/recipes/org-archive.el")
       (load "~/Dropbox/src/emacs/recipes/org-agenda.el")
       (load "~/Dropbox/src/emacs/recipes/org-capture.el")
       (load "~/Dropbox/src/emacs/recipes/org-clock.el")
       ;;(load "~/Dropbox/src/emacs/recipes/org-download.el")
       (load "~/Dropbox/src/emacs/random-packages/pop-eshell/pop-eshell-mode.el")
       (load "~/Dropbox/src/emacs/recipes/projectile.el")
       (load "~/Dropbox/src/emacs/recipes/rainbow-delimiters.el")
       (load "~/Dropbox/src/emacs/recipes/rg.el")
       ;;(load "~/Dropbox/src/emacs/recipes/super-save.el")
       (load "~/Dropbox/src/emacs/recipes/saveplace.el")
       (load "~/Dropbox/src/emacs/recipes/swiper.el")
       (load "~/Dropbox/src/emacs/recipes/undo-tree.el")
       (load "~/Dropbox/src/emacs/recipes/treemacs.el")
       (load "~/Dropbox/src/emacs/recipes/visuals.el")
       (load "~/Dropbox/src/emacs/recipes/volatile-highlights.el")
       (load "~/Dropbox/src/emacs/recipes/command-log-mode.el")
       (load "~/Dropbox/src/emacs/recipes/lsp-mode.el")
       ;;(load "~/Dropbox/src/emacs/recipes/ws-butler.el")
       (load "~/Dropbox/src/emacs/recipes/yasnippet.el")
       (load "~/Dropbox/src/emacs/recipes/json-mode.el")
       (load "~/Dropbox/src/emacs/recipes/rjsx-mode.el")
       (load "~/Dropbox/src/emacs/recipes/prettier-js.el")
       (load "~/Dropbox/src/emacs/recipes/dap-mode.el")
       (load "~/Dropbox/src/emacs/recipes/exec-path-from-shell.el")
       (load "~/Dropbox/src/emacs/recipes/python.el")
       (load "~/Dropbox/src/emacs/recipes/markdown-mode.el")
       ;;(load "~/Dropbox/src/emacs/recipes/evil.el")
       (load "~/Dropbox/src/emacs/recipes/emacs-dashboard.el")
       (load "~/Dropbox/src/emacs/recipes/highlight-indentation.el")
       (load "~/Dropbox/src/emacs/recipes/plain-org-wiki.el")
       (load "~/Dropbox/src/emacs/recipes/db.el")

;;webdev stuff
(load "~/Dropbox/src/emacs/recipes/web-mode.el")
(load "~/Dropbox/src/emacs/recipes/emmet.el")
;;(load "~/Dropbox/src/emacs/recipes/scss-mode.el")
;;(load "~/Dropbox/src/emacs/recipes/lorem-ipsum.el")

;;JavaScript stuff
;;inspiration for js things "redguardtoo" on github
;;(load "~/Dropbox/src/emacs/recipes/js-comint.el")
;;(load "~/Dropbox/src/emacs/recipes/js2-mode.el")
;;(load "~/Dropbox/src/emacs/recipes/tern.el")
;;(load "~/Dropbox/src/emacs/recipes/skewer-mode.el")
       ))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("ea5822c1b2fb8bb6194a7ee61af3fe2cc7e2c7bab272cbb498a0234984e1b2d9" "854a1ae47e79e1d8c80b4e2f1e20f80450cf9ddd103e8f9d7dcd400b3d7325b1" default))
 '(org-agenda-files
   '("/home/arvydas/Dropbox/org/notes/anyksciai.org" "/home/arvydas/Dropbox/org/notes/api.org" "/home/arvydas/Dropbox/org/notes/arvydasDev.org" "/home/arvydas/Dropbox/org/notes/baba.org" "/home/arvydas/Dropbox/org/notes/citatos.org" "/home/arvydas/Dropbox/org/notes/computers.org" "/home/arvydas/Dropbox/org/notes/csfw.org" "/home/arvydas/Dropbox/org/notes/cyberFortify.org" "/home/arvydas/Dropbox/org/notes/db.org" "/home/arvydas/Dropbox/org/notes/diary.org" "/home/arvydas/Dropbox/org/notes/django.org" "/home/arvydas/Dropbox/org/notes/dpd.org" "/home/arvydas/Dropbox/org/notes/emacs.org" "/home/arvydas/Dropbox/org/notes/gifts.org" "/home/arvydas/Dropbox/org/notes/github.org" "/home/arvydas/Dropbox/org/notes/inbox.org" "/home/arvydas/Dropbox/org/notes/javascript.org" "/home/arvydas/Dropbox/org/notes/jonava.org" "/home/arvydas/Dropbox/org/notes/julyte.org" "/home/arvydas/Dropbox/org/notes/kaledos.org" "/home/arvydas/Dropbox/org/notes/kaunas.org" "/home/arvydas/Dropbox/org/notes/kedainiai.org" "/home/arvydas/Dropbox/org/notes/klaipeda.org" "/home/arvydas/Dropbox/org/notes/knowYourArea.org" "/home/arvydas/Dropbox/org/notes/lansweeper.org" "/home/arvydas/Dropbox/org/notes/lfw.org" "/home/arvydas/Dropbox/org/notes/linuxOS.org" "/home/arvydas/Dropbox/org/notes/mintys.org" "/home/arvydas/Dropbox/org/notes/moletai.org" "/home/arvydas/Dropbox/org/notes/movies.org" "/home/arvydas/Dropbox/org/notes/naujojiAkmene.org" "/home/arvydas/Dropbox/org/notes/network.org" "/home/arvydas/Dropbox/org/notes/o365Migration.org" "/home/arvydas/Dropbox/org/notes/pagalbaGyvunams.org" "/home/arvydas/Dropbox/org/notes/panevezys.org" "/home/arvydas/Dropbox/org/notes/pencija.org" "/home/arvydas/Dropbox/org/notes/photography.org" "/home/arvydas/Dropbox/org/notes/pkc.org" "/home/arvydas/Dropbox/org/notes/projectIdeas.org" "/home/arvydas/Dropbox/org/notes/projects.org" "/home/arvydas/Dropbox/org/notes/python.org" "/home/arvydas/Dropbox/org/notes/raspberry.org" "/home/arvydas/Dropbox/org/notes/repeating.org" "/home/arvydas/Dropbox/org/notes/smuti.org" "/home/arvydas/Dropbox/org/notes/somedayMaybe.org" "/home/arvydas/Dropbox/org/notes/sportas.org" "/home/arvydas/Dropbox/org/notes/toike.org" "/home/arvydas/Dropbox/org/notes/travel.org" "/home/arvydas/Dropbox/org/notes/uzsienis.org" "/home/arvydas/Dropbox/org/notes/vilnius.org" "/home/arvydas/Dropbox/org/notes/wildlifeCamera.org" "/home/arvydas/Dropbox/org/notes/windowsOS.org")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
