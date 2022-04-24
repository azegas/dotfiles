;;; flycheck.el --- suggestions
;;; Commentary:
;; [2021-07-01] "Flycheck" uses various syntax checking and linting tools to
;; automatically check the contents of buffers while you type, and
;; reports warnings and errors directly in the buffer. Or in the right
;; corner if you use "Doom-modeline". Can click on the icon - shows all
;; the errors. Great!  https://www.flycheck.org/en/latest/# Not to
;; confuse with flyspell - checks grammar.
;;; Code:

(use-package flycheck
  :ensure t
  :defer t
  :hook
  (python-mode           . flycheck-mode)
  (js-mode               . flycheck-mode)
  (web-mode              . flycheck-mode)
  (lisp-interaction-mode . flycheck-mode)
  (emacs-lisp-mode       . flycheck-mode)
  (markdown-mode         . flycheck-mode)
  :bind ("C-c e" . flycheck-next-error)
)

;;; flycheck.el ends here
