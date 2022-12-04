;;; evil.el --- evil mode
;;; Commentary:
;; trying out evil mode
;;; Code:


(use-package evil
  :ensure t
  :init (setq evil-want-C-i-jump nil) ;; allows to use TAB in org mode
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  ;;Not sure why this isn’t the default – it is in vim – but this makes C-u to go up half a page
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  ;; jump to any char with space only
  (define-key evil-normal-state-map (kbd "SPC") 'avy-goto-char-timer)
  ;; can not quit windows with evil mode.. now I can
  (define-key evil-normal-state-map (kbd "q") 'quit-window)
  ;; forcing myself  to use C-w for evil window management
  (global-unset-key (kbd "C-x o")))


;; change cursor to indicate different modes of VIM
(setq evil-default-cursor (quote (t "#750000"))
      evil-visual-state-cursor '("green" hollow)
      evil-normal-state-cursor '("green" box)
      evil-insert-state-cursor '("pink" (bar . 2)))


;; (use-package evil
;;   :ensure t
;;   :config
;;   (evil-mode 1))

;;; evil.el ends here
