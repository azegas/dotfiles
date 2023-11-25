;; Increase garbage collector threshold for better performance
(setq gc-cons-threshold most-positive-fixnum)

; M-x use-package-report to see the time of the each loaded package
(setq use-package-compute-statistics t)

;; Disable unneeded UI elements
(customize-set-variable 'scroll-bar-mode nil)
(customize-set-variable 'horizontal-scroll-bar-mode nil)
(customize-set-variable 'menu-bar-mode nil)
(customize-set-variable 'tool-bar-mode nil)

(customize-set-variable 'custom-enabled-themes '(wombat))

(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :weight demibold :height 1.2))))
 '(default ((t (:background "#131818"))))
 '(cursor-orig ((t (:inherit cursor))))
 '(mode-line-inactive ((t (:background "#101010"))))
 '(mode-line ((t (:background "#404040"))))
 '(hl-line ((t (:inherit nil :background "#222222"))))
 '(minibuffer-prompt ((t (:foreground "#ff584d"))))

 ;; Make some default wombat colours a bit more lively
 '(font-lock-builtin-face ((((class color) (min-colors 89)) (:foreground "#ff685d"))))
 '(font-lock-constant-face ((((class color) (min-colors 89)) (:foreground "#ff685d")))))
