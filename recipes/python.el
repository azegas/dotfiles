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

;; IF you can not import modules, says it can not find or w/elfeed
;; do M-x run-python in DIRED, the location of the files.
;; then do C-c C-c or C-RET - the modules will load
;; two hours wasted during my codeacademy first python test... but thanks to this guy:
;; https://emacs.stackexchange.com/questions/43950/modulenotfound-for-absolute-imports-in-emacs-python-repl/74881#74881

;; shortcuts
;; c-c c-d - pydoc on a method

;;; python.el ends here
