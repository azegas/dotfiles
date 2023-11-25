;; Increase garbage collector threshold for better performance
(setq gc-cons-threshold most-positive-fixnum)

;; Disable unneeded UI elements
(customize-set-variable 'scroll-bar-mode nil)
(customize-set-variable 'horizontal-scroll-bar-mode nil)
(customize-set-variable 'menu-bar-mode nil)
(customize-set-variable 'tool-bar-mode nil)
