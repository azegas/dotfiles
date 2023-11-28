;; [2021-07-01] “Company” provides autosuggestion/completion in
;; buffers (writing code, pathing to files, etc). press <f1> to
;; display the documentation for the selected candidate or C-w to see
;; its source tas dropdown su suggestions, works perfectly wiht elisp
;; out of the box

(use-package company
  :ensure t
  :config
  ; lb svarbu, instant suggestion
  (setq company-idle-delay 0)
  ;; (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t)
  ; flip when narrow place
  (setq company-tooltip-flip-when-above nil)
  (global-company-mode))

;turn off company auto-completion in eshell, because it adds annoying
;spaces after each completion.. like ls, sucks
(add-hook 'eshell-mode-hook (lambda () (company-mode -1)) 'append)

;; turn off company mode in org major mode. Annoying suggestions with
;; each word.
(defun jpk/org-mode-hook ()
  (company-mode -1))
(add-hook 'org-mode-hook #'jpk/org-mode-hook)

;; makes lsp crash -
;; https://github.com/emacs-lsp/lsp-mode/discussions/3781#discussioncomment-3992134
;; (use-package company-quickhelp
;;   :ensure t
;;   :config
;;   (company-quickhelp-mode 1)
;;   (eval-after-load 'company
;;     '(define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin)))
;; (setq company-quickhelp-delay 0)
