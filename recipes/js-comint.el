;;; js-comint.el --- Run a JavaScript interpreter in an inferior process window
;;; Commentary:
;;; https://js-comint-el.sourceforge.net/
;;; useful when you have simple code like a + b, it will run effectively
;;; when you start adding fetch and modules - not so useful. does not recognize them
;;; and can not send buffer content to repl. do it through shell with node name.js instead
;;; Code:

;; [2022-08-24]
(use-package js-comint
  :ensure t)

(defun inferior-js-mode-hook-setup ()
  (add-hook 'comint-output-filter-functions 'js-comint-process-output))
(add-hook 'inferior-js-mode-hook 'inferior-js-mode-hook-setup t)

(define-key js-mode-map (kbd "C-c b") 'my-js-clear-send-buffer)

(defun my-js-clear-send-buffer ()
  (interactive)
  (js-comint-clear)
  (js-comint-send-buffer))

;;; js-comint.el ends here
