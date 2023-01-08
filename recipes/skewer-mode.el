;;; skewer-mode.el --- live coding similar to impatient for html/css/js
;;; Commentary:
;; inspiration https://github.com/howardabrams/dot-files/blob/master/emacs-web.org
;; tutorial https://www.youtube.com/watch?v=5jKHHjla2Rw&ab_channel=StillEmacsing
;;; Code:

(use-package skewer-mode
  :ensure t
  :commands skewer-mode run-skewer
  :config (skewer-setup))

(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'web-mode-hook 'skewer-html-mode)

;;; skewer-mode.el ends here
