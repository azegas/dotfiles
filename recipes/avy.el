;;; avy.el --- jump to specific position
;;; Commentary:
;; [2021-07-01] "Avy" lets me jump to to a specific letter or a word quickly. M-s and
;; I can type a word, it will immeaditely jump to it on any opened and
;; visible buffer.  See https://github.com/abo-abo/avy for more info.
;;; Code:

(use-package avy
  :ensure t
  :bind
  (("M-s" . avy-goto-char-timer)
   ("M-p" . avy-goto-word-1)))
(setq avy-background t)                 ; cool, makes the background darker

;;; avy.el ends here
