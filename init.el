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

(load "~/.emacs.d/recipes/ace-window.el")
(load "~/.emacs.d/recipes/avy.el")
(load "~/.emacs.d/recipes/backups.el")
(load "~/.emacs.d/recipes/beacon.el")
(load "~/.emacs.d/recipes/browse-kill-ring.el")
(load "~/.emacs.d/recipes/company.el")
(load "~/.emacs.d/recipes/counsel.el")
(load "~/.emacs.d/recipes/diff-hl.el")
(load "~/.emacs.d/recipes/dired.el")
(load "~/.emacs.d/recipes/doom-themes.el")
;; (load "~/.emacs.d/recipes/doom-modeline.el")
(load "~/.emacs.d/recipes/elfeed.el")
(load "~/.emacs.d/recipes/elpy.el")
(load "~/.emacs.d/recipes/emmet.el")
(load "~/.emacs.d/recipes/emojify.el")
(load "~/.emacs.d/recipes/erc.el")
(load "~/.emacs.d/recipes/expand-region.el")
(load "~/.emacs.d/recipes/flycheck.el")
(load "~/.emacs.d/recipes/flyspell.el")
(load "~/.emacs.d/recipes/general.el")
(load "~/.emacs.d/recipes/goto-chg.el")
(load "~/.emacs.d/recipes/hungry-delete.el")
(load "~/.emacs.d/recipes/impatient-mode.el")
(load "~/.emacs.d/recipes/ivy.el")
(load "~/.emacs.d/recipes/jump.el")
(load "~/.emacs.d/recipes/lorem-ipsum.el")
(load "~/.emacs.d/recipes/macros.el")
(load "~/.emacs.d/recipes/magit.el")
(load "~/.emacs.d/recipes/move-text.el")
(load "~/.emacs.d/recipes/multiple-cursors.el")
(load "~/.emacs.d/recipes/org.el")
(load "~/.emacs.d/recipes/org-agenda.el")
;; (load "~/.emacs.d/recipes/org-capture.el")
(load "~/.emacs.d/recipes/org-roam.el")
(load "~/.emacs.d/recipes/org-clock.el")
(load "~/.emacs.d/recipes/org-download.el")
;; (load "~/.emacs.d/recipes/pop-eshell.el")
(load "~/.emacs.d/recipes/projectile.el")
(load "~/.emacs.d/recipes/rainbow-delimiters.el")
(load "~/.emacs.d/recipes/rg.el")
;; (load "~/.emacs.d/recipes/saveplace.el")
(load "~/.emacs.d/recipes/swiper.el")
(load "~/.emacs.d/recipes/undo-tree.el")
(load "~/.emacs.d/recipes/visuals.el")
;; (load "~/.emacs.d/recipes/volatile-highlights.el")
(load "~/.emacs.d/recipes/web-mode.el")
;; (load "~/.emacs.d/recipes/ws-butler.el")
(load "~/.emacs.d/recipes/yasnippet.el")

;;; init.el ends here

(put 'dired-find-alternate-file 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("ea5822c1b2fb8bb6194a7ee61af3fe2cc7e2c7bab272cbb498a0234984e1b2d9" "a74294ba30f2894f5903b41beab28f4e789c34b92cd6d635464cceab9e02ccea" default)))
 '(org-agenda-files
   (quote
    ("/home/arvydas/Dropbox/documents/org/roam/20220323164015-know_your_area.org" "/home/arvydas/Dropbox/documents/org/roam/20220323163644-cs.org" "/home/arvydas/Dropbox/documents/org/roam/20220417171832-org_site.org" "/home/arvydas/Dropbox/documents/org/roam/20220416072754-tolearn.org" "/home/arvydas/Dropbox/documents/org/roam/20220323163825-facebook_group_automatization.org" "/home/arvydas/Dropbox/documents/org/roam/20220323163522-citatos.org" "/home/arvydas/Dropbox/documents/org/roam/20220323162627-emacs.org" "/home/arvydas/Dropbox/documents/org/roam/20220323164321-smuti_fruti.org" "/home/arvydas/Dropbox/documents/org/roam/20220323163909-obelsdumas.org" "/home/arvydas/Dropbox/documents/org/roam/20220426212731-pkc.org" "/home/arvydas/Dropbox/documents/org/roam/20220323163743-dpd.org" "/home/arvydas/Dropbox/documents/org/roam/20220403094017-facebook.org" "/home/arvydas/Dropbox/documents/org/roam/20220328183135-python.org" "/home/arvydas/Dropbox/documents/org/roam/20220323164133-portfolio.org" "/home/arvydas/Dropbox/documents/org/roam/20220323172208-tickler.org" "/home/arvydas/Dropbox/documents/org/roam/20220426071354-alpine.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
