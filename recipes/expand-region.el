;;; expand-region.el --- selecting text inside () <> {} [] etc
;;; Commentary:
;; useful
;;; Code:

;; [2022-01-01 Št] "Expand region" allows me to select everything in between any kind of
;; brackets by pressing C-=. The more I press it, the more it selects.
(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region)
  :config)

;;; expand-region.el ends here
