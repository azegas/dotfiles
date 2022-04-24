;;; impatient-mode.el --- opening html in browser
;;; Commentary:
;; [2021-07-01] "Impatient mode" lets you to have a browser window with LIVE HTML
;; preview. Add files by 'M-x httpd-start'. Then do `M-x
;; impatient-mode` - on EACH and EVERY file (css, js and hmtl). And then
;; go to this link http://localhost:8080/imp/
;; Otherwise, read simple explanation here -
;; https://github.com/skeeto/impatient-mode.
;;; Code:

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

;;; impatient-mode.el ends here
