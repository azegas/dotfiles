;;; tern.el --- javascript analyzer
;;; Commentary:
;; dont forget to install it (sudo npm install -g tern)
;;; Code:

(use-package tern
   :ensure t
   :init (add-hook 'js2-mode-hook (lambda () (tern-mode t))))

;;; tern.el ends here
