;; [2021-07-01] “Swiper” - an Ivy-enhanced alternative to
;; Isearch. Instead of regular C-s C-r. Relies on Ivy, but Ivy doens’t
;; rely on Swiper.

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)))
