;;; markdown-mode.el --- hoping to get some markdown syntax help
;;; Commentary:
;; primarily for hugo
;;; Code:

(use-package markdown-mode
  :ensure t)

;; preview markdown live
;; https://stackoverflow.com/questions/36183071/how-can-i-preview-markdown-in-emacs-in-real-time
;; https://wikemacs.org/wiki/Markdown#Live_preview_as_you_type
;; M-x httpd-start
;; M-x impatient-mode
;; Open your browser to localhost:8080/imp
;; Tell impatient mode to use it: M-x imp-set-user-filter RET markdown-html RET

(defun markdown-filter (buffer)
     (princ
       (with-temp-buffer
         (let ((tmpname (buffer-name)))
           (set-buffer buffer)
           (set-buffer (markdown tmpname)) ; the function markdown is in `markdown-mode.el'
           (buffer-string)))
       (current-buffer)))

(defun markdown-html (buffer)
    (princ (with-current-buffer buffer
      (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://ndossougbe.github.io/strapdown/dist/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
    (current-buffer)))

;;; markdown-mode.el ends here
