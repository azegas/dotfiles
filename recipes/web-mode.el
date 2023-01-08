;;; web-mode.el --- web stuff
;;; Commentary:
;; [2021-07-01] "Web mode" - Got it basically only for maching tags highlighting
;; feature. I am sure it has wayyy more cool features. But more about
;; those - later.
;;; Code:

(use-package web-mode
  :ensure t
  :commands (web-mode)
  :mode (("\\.html" . web-mode)
         ("\\.htm" . web-mode)
         ("\\.sgml\\'" . web-mode))
  :config
  (setq web-mode-engines-alist
        '(("django"    . "\\.html\\'")))
  (setq web-mode-ac-sources-alist
        '(("css" . (ac-source-css-property))
          ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
  (setq web-mode-enable-auto-closing t))
(setq web-mode-enable-auto-quoting t) ; this fixes the quote problem I mentioned
(setq web-mode-enable-current-element-highlight t)

(add-hook 'web-mode 'emmet-mode)

;;; web-mode.el ends here
