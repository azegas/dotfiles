(use-package keycast
  :ensure t)

(setq keycast-mode-line-format "%2s%k%c%R")
(setq keycast-mode-line-window-predicate 'mode-line-window-selected-p)
(setq keycast-mode-line-remove-tail-elements nil)

(dolist (input '(self-insert-command org-self-insert-command))
  (add-to-list 'keycast-substitute-alist `(,input "." "Typing…")))

(dolist (event '(mouse-event-p mouse-movement-p mwheel-scroll))
  (add-to-list 'keycast-substitute-alist `(,event nil)))

;; don't forget to turn it on whenever you need it
;; (keycast-mode-line-mode)
