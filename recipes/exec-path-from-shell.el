;;; exec-path-from-shell.el --- make shell and eshell info same
;;; Commentary:
;; version numbers, packages, so on. Want eshell to know about them also
;; solution - https://emacs.stackexchange.com/questions/34201/emacs-cant-find-node-when-node-was-installed-using-nvm

;; github link of the solution - https://github.com/purcell/exec-path-from-shell
;;; Code:

(use-package exec-path-from-shell
  :ensure t)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;;; exec-path-from-shell.el ends here
