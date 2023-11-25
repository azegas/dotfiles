;; [2021-07-01] “Ivy” is a generic completion mechanism for Emacs.

;; C-c f, M-x basically. Other packages use it as well(projectile can
;; not work without Ivy f.x).


;; <2021-07-01> Click ‘M-o’ while in ‘C-x C-f’ to get a lot of
;; options! have to isntall counsel first for ivy to work.
(use-package counsel
  :ensure t
  ;; enable this if you want `swiper' to use it
  ;; (setq search-default-mode #'char-fold-to-regexp)
  :config (counsel-mode))

(use-package ivy
  :bind (("C-c C-r" . ivy-resume)
         ("C-x B" . ivy-switch-buffer-other-window)) ; I never use this
  :custom
  (ivy-count-format "(%d/%d) ")
  ;; nice if you want previously opened buffers to appear after an
  ;; emacs shutdown
  ;saves buffers from last session
  (ivy-use-virtual-buffers t)
  :config (ivy-mode))

(use-package ivy-rich
  :ensure t
  :init (ivy-rich-mode 1))

; if icons still don't exist, use - M-x all-the-icons-install-fonts
(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

;; [2021-07-01] “Swiper” - an Ivy-enhanced alternative to
;; Isearch. Instead of regular C-s C-r. Relies on Ivy, but Ivy doens’t
;; rely on Swiper.
(use-package swiper
  :ensure t)
