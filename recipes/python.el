;;; python.el --- python development
;;; Commentary:
;; any_comments?
;;; Code:

;; black is a code formatter according to some standards. Without it I
;; am getting various errors about "two lines after that", "too many
;; spaces there.. now it simply reformats my code according those
;; standards of BLACK

;; Run black on save
(add-hook 'elpy-mode-hook (lambda ()
                            (add-hook 'before-save-hook 'elpy-black-fix-code nil t)))


;; shortcuts
;; c-c c-d - pydoc on a method

;;; python.el ends here
