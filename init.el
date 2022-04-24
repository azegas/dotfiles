;;; init.el --- Main init
;;; Commentary:
;; Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter: it simply makes everything else vanish. – Neal Stephenson,
;; In the Beginning was the Command Line (1998)
;;; Code:

;; -*- lexical-binding: t; -*-

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
(load "~/.emacs.d/recipes/doom.el")
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
(load "~/.emacs.d/recipes/org-agenda.el")
;; (load "~/.emacs.d/recipes/org-capture.el")
(load "~/.emacs.d/recipes/org-clock.el")
(load "~/.emacs.d/recipes/org-download.el")
(load "~/.emacs.d/recipes/org.el")
(load "~/.emacs.d/recipes/org-roam.el")
;; (load "~/.emacs.d/recipes/pop-eshell.el")
(load "~/.emacs.d/recipes/projectile.el")
(load "~/.emacs.d/recipes/rainbow-delimiters.el")
(load "~/.emacs.d/recipes/rg.el")
(load "~/.emacs.d/recipes/saveplace.el")
(load "~/.emacs.d/recipes/swiper.el")
(load "~/.emacs.d/recipes/undo-tree.el")
(load "~/.emacs.d/recipes/visuals.el")
(load "~/.emacs.d/recipes/volatile-highlights.el")
(load "~/.emacs.d/recipes/web-mode.el")
(load "~/.emacs.d/recipes/ws-butler.el")
(load "~/.emacs.d/recipes/yasnippet.el")

;;; init.el ends here
(put 'dired-find-alternate-file 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   (quote
    ("ea5822c1b2fb8bb6194a7ee61af3fe2cc7e2c7bab272cbb498a0234984e1b2d9" "a74294ba30f2894f5903b41beab28f4e789c34b92cd6d635464cceab9e02ccea" "a6d39b3e27d45aea4bf0c20a9f6ccbff858eae1728ac0cf72d6a86bd873202d2" default)))
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
