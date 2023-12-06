(dolist (mode
   '(tool-bar-mode                ; No toolbars, more room for text
     scroll-bar-mode              ; No scroll bars either
     menu-bar-mode                ; No menu bar as well
     blink-cursor-mode))          ; Disable blinking cursor
  (funcall mode 0))

;; (add-to-list 'default-frame-alist '(internal-border-width . 24))
