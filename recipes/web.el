;;; web.el --- web stuff
;;; Commentary:
;; web
;;; Code:

;; [2021-07-01] "Emmet mode" - HTML completion. Click c-j to autocomplete a tag.
;; Cheat sheet - https://docs.emmet.io/cheat-sheet/
;; SU WEB MODE KRC PRADEDA flycheck nebeveikti ir emmet durniuoja
(use-package emmet-mode
  :ensure t
  :config
  :hook ((web-mode . emmet-mode)
         (html-mode . emmet-mode)
         (css-mode . emmet-mode)
         (sgml-mode . emmet-mode)))

;; [2021-07-01] "Web mode" - Got it basically only for maching tags highlighting
;; feature. I am sure it has wayyy more cool features. But more about
;; those - later.
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

;; [2021-07-01] "Impatient mode" lets you to have a browser window with LIVE HTML
;; preview. Add files by 'M-x httpd-start'. Then do `M-x
;; impatient-mode` - on EACH and EVERY file (css, js and hmtl). And then
;; go to this link http://localhost:8080/imp/
;; Otherwise, read simple explanation here -
;; https://github.com/skeeto/impatient-mode.
(use-package impatient-mode
  :ensure t
  :commands impatient-mode)

;; to be able to preview .md files
;; from here - https://stackoverflow.com/questions/36183071/how-can-i-preview-markdown-in-emacs-in-real-time
;; But Wait... with markdown-mode installed I can already see the markdown live in my emacs...
(defun markdown-html (buffer)
  (princ (with-current-buffer buffer
           (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://strapdownjs.com/v/0.2/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
         (current-buffer)))

;; Lorem ipsum
;; [2022-03-20 Sk]
(use-package lorem-ipsum
  :ensure t)

;;; web.el ends here
