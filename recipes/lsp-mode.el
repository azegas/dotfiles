;;; lsp-mode.el --- language server
;;; Commentary:
;; should be super useful to have IDE like functions
;; full tutorial - https://www.youtube.com/watch?v=E-NAM9U5JYE&ab_channel=SystemCrafters
;; features explanations - https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/
;;; Code:

(use-package lsp-mode
  :ensure t
  ;; :commands (lsp lsp-deferred)          ;both of these commands activate the package. interesting
  :init
  (setq lsp-keymap-prefix "C-c l")      ; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))

;; (add-hook 'prog-mode-hook #'lsp)        ; not reccomended, tries to run in elisp mode..
(add-hook 'web-mode-hook #'lsp)
(add-hook 'css-mode-hook #'lsp)
(add-hook 'js-mode-hook #'lsp)

;; lsp-ui-workspace-symbol - nusoks i definition - cool
(use-package lsp-ivy
  :ensure t)

;; attempting to make lsp quicker
;; https://emacs-lsp.github.io/lsp-mode/page/performance/

;; do M-x lsp-diagnose ir check ar yra errors

(setq lsp-idle-delay 0.500)
(setq lsp-lens-enable t)

;;; lsp-mode.el ends here
