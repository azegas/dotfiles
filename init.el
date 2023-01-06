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
       (load "c:\\Users\\arvga\\.arvydas\\src\\emacs\\random-packages\\pop-eshell\\pop-eshell-mode.el")
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
       (load "~/Dropbox/src/emacs/recipes/ace-window.el")
       (load "~/Dropbox/src/emacs/recipes/backups.el")
              (load "~/Dropbox/src/emacs/recipes/browse-kill-ring.el")
       (load "~/Dropbox/src/emacs/recipes/company.el")
       (load "~/Dropbox/src/emacs/recipes/ivy.el")

       (load "~/Dropbox/src/emacs/recipes/counsel.el")
       (load "~/Dropbox/src/emacs/recipes/diff-hl.el")
       (load "~/Dropbox/src/emacs/recipes/dired.el")
       (load "~/Dropbox/src/emacs/recipes/doom-themes.el")
       (load "~/Dropbox/src/emacs/recipes/elpy.el")
       (load "~/Dropbox/src/emacs/recipes/expand-region.el")
       (load "~/Dropbox/src/emacs/recipes/general.el")
       (load "~/Dropbox/src/emacs/recipes/goto-chg.el")
       (load "~/Dropbox/src/emacs/recipes/hungry-delete.el")
       (load "~/Dropbox/src/emacs/recipes/jump.el")
       (load "~/Dropbox/src/emacs/recipes/macros.el")
       (load "~/Dropbox/src/emacs/recipes/magit.el")
       (load "~/Dropbox/src/emacs/recipes/org.el")
       (load "~/Dropbox/src/emacs/recipes/org-archive.el")
       (load "~/Dropbox/src/emacs/recipes/org-agenda.el")
       (load "~/Dropbox/src/emacs/recipes/org-capture.el")
       (load "~/Dropbox/src/emacs/recipes/org-clock.el")
       (load "~/Dropbox/src/emacs/random-packages/pop-eshell/pop-eshell-mode.el")
       (load "~/Dropbox/src/emacs/recipes/projectile.el")
       (load "~/Dropbox/src/emacs/recipes/rg.el")
       (load "~/Dropbox/src/emacs/recipes/saveplace.el")
       (load "~/Dropbox/src/emacs/recipes/swiper.el")
       (load "~/Dropbox/src/emacs/recipes/undo-tree.el")
       (load "~/Dropbox/src/emacs/recipes/visuals.el")
       (load "~/Dropbox/src/emacs/recipes/lsp-mode.el")
       (load "~/Dropbox/src/emacs/recipes/json-mode.el")
       (load "~/Dropbox/src/emacs/recipes/exec-path-from-shell.el")
       (load "~/Dropbox/src/emacs/recipes/python.el")
       (load "~/Dropbox/src/emacs/recipes/plain-org-wiki.el")
       (load "~/Dropbox/src/emacs/recipes/db.el")
       (load "~/Dropbox/src/emacs/recipes/powershell.el")

       ;; (load "~/Dropbox/src/emacs/recipes/beacon.el")
       ;; (load "~/Dropbox/src/emacs/recipes/avy.el")
       ;;(load "~/Dropbox/src/emacs/recipes/doom-modeline.el")
       ;;(load "~/Dropbox/src/emacs/recipes/elfeed.el")
       ;;(load "~/Dropbox/src/emacs/recipes/emojify.el")
       ;;(load "~/Dropbox/src/emacs/recipes/erc.el")
       ;; (load "~/Dropbox/src/emacs/recipes/flycheck.el")
       ;; (load "~/Dropbox/src/emacs/recipes/flyspell.el")
       ;; (load "~/Dropbox/src/emacs/recipes/impatient-mode.el")
       ;; (load "~/Dropbox/src/emacs/recipes/move-text.el")
       ;; (load "~/Dropbox/src/emacs/recipes/multiple-cursors.el")
       ;; (load "~/Dropbox/src/emacs/recipes/rainbow-delimiters.el")
       ;;(load "~/Dropbox/src/emacs/recipes/org-download.el")
       ;;(load "~/Dropbox/src/emacs/recipes/super-save.el")
       ;; (load "~/Dropbox/src/emacs/recipes/treemacs.el")
       ;; (load "~/Dropbox/src/emacs/recipes/volatile-highlights.el")
       ;; (load "~/Dropbox/src/emacs/recipes/command-log-mode.el")
       ;;(load "~/Dropbox/src/emacs/recipes/ws-butler.el")
       ;; (load "~/Dropbox/src/emacs/recipes/yasnippet.el")
       ;; (load "~/Dropbox/src/emacs/recipes/rjsx-mode.el")
       ;; (load "~/Dropbox/src/emacs/recipes/prettier-js.el")
       ;; (load "~/Dropbox/src/emacs/recipes/dap-mode.el")
       ;; (load "~/Dropbox/src/emacs/recipes/markdown-mode.el")
       ;;(load "~/Dropbox/src/emacs/recipes/evil.el")
       ;; (load "~/Dropbox/src/emacs/recipes/emacs-dashboard.el")
       ;; (load "~/Dropbox/src/emacs/recipes/highlight-indentation.el")


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
   '("1a1ac598737d0fcdc4dfab3af3d6f46ab2d5048b8e72bc22f50271fd6d393a00" "ea5822c1b2fb8bb6194a7ee61af3fe2cc7e2c7bab272cbb498a0234984e1b2d9" "854a1ae47e79e1d8c80b4e2f1e20f80450cf9ddd103e8f9d7dcd400b3d7325b1" default))
 '(org-agenda-files
   '("~/Dropbox/org/notes/api.org" "~/Dropbox/org/notes/birthdays.org" "~/Dropbox/org/notes/csfw.org" "~/Dropbox/org/notes/cyberFortify.org" "~/Dropbox/org/notes/db.org" "~/Dropbox/org/notes/emacs.org" "~/Dropbox/org/notes/inbox.org" "~/Dropbox/org/notes/journal.org" "~/Dropbox/org/notes/kaledos2022.org" "~/Dropbox/org/notes/kontrole.org" "~/Dropbox/org/notes/lansweeper.org" "~/Dropbox/org/notes/namas.org" "~/Dropbox/org/notes/o365Mig.org" "~/Dropbox/org/notes/obelsdumas.org" "~/Dropbox/org/notes/pagalbaGyvunams.org" "~/Dropbox/org/notes/phats.org" "~/Dropbox/org/notes/python.org" "~/Dropbox/org/notes/references.org" "~/Dropbox/org/notes/repeating.org" "~/Dropbox/org/notes/smf.org" "~/Dropbox/org/notes/smuti.org" "~/Dropbox/org/notes/someday.org" "~/Dropbox/org/notes/somedayPkc.org" "~/Dropbox/org/notes/vim.org" "~/Dropbox/org/notes/vsCode.org" "~/Dropbox/org/notes/whyEmacs.org" "~/Dropbox/org/notes/wildlifeCamera.org"))
 '(package-selected-packages
   '(ivy-rich powershell which-key web-mode volatile-highlights use-package undo-tree rjsx-mode rg rainbow-delimiters projectile prettier-js plain-org-wiki multiple-cursors move-text magit lsp-ui lsp-ivy lorem-ipsum json-mode impatient-mode hungry-delete helpful goto-chg flycheck expand-region exec-path-from-shell emmet-mode elpy doom-themes doom-modeline dired-git-info diff-hl dashboard dap-mode csv-mode counsel company-quickhelp browse-kill-ring beacon amx all-the-icons-ivy-rich ahk-mode))
 '(warning-suppress-log-types '((auto-save) (auto-save)))
 '(warning-suppress-types '((auto-save))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
