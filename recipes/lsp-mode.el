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
(add-hook 'python-mode-hook #'lsp)      ;https://vxlabs.com/2018/06/08/python-language-server-with-emacs-and-lsp-mode/
(add-hook 'css-mode-hook #'lsp)
(add-hook 'js-mode-hook #'lsp)


;; lsp-ui-workspace-symbol - nusoks i definition - cool
(use-package lsp-ivy
  :ensure t)

;; good for stuff like C-c l G r
(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode))

;; (use-package lsp-treemacs
;;   :ensure t)

;; see errors
;; M-x lsp-treemacs-errors-list
;; M-x lsp-errors-list-mode

;; lsp-treemacs-symbols
;; lsp-treemacs-references/impleentations

;; A guide on disabling/enabling lsp-mode features
;; https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/

;; attempting to make lsp quicker
;; https://emacs-lsp.github.io/lsp-mode/page/performance/

;; do M-x lsp-diagnose ir check ar yra errors

(setq lsp-lens-enable t)

;; attempting to make lsp faster (M-x lsp-doctor)
;; check emacs version - apt-cache policy emacs
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq gc-cons-threshold 100000000)
(setq lsp-idle-delay 0.500)
;; install emacs 28.. is kind of faster now https://www.how2shout.com/linux/how-to-install-emacs-28-on-ubuntu-20-04-lts-focal-fossa/
;; proper lsp install here - https://emacs-lsp.github.io/lsp-mode/page/
;; (setenv "LSP_USE_PLISTS" "1") ;; add this line to init.el only

;;; lsp-mode.el ends here
