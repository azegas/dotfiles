;; <2021-07-01> Click ‘M-o’ while in ‘C-x C-f’ to get a lot of
;; options! have to isntall counsel first for ivy to work.

;; ‘M-o’ while in ‘C-x C-f’ - from counsil to see options like copy
;; and etc.

;; counsil also has a feature like projectile - see all git files
;; press c-c g

(use-package counsel
  :ensure t
  ;; enable this if you want `swiper' to use it
  ;; (setq search-default-mode #'char-fold-to-regexp)
  :config (counsel-mode))
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
