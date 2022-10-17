;;; volatile-highlights.el --- volatilation
;;; Commentary:
;; afte pasting f.x - block that you have pasted will be highlihted until cursor moves
;; useful to see the boundries of the copied and pasted block
;;; Code:

(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode t))

;;; volatile-highlights.el ends here
