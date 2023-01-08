;;; flyspell.el --- spell check
;;; Commentary:
;; nope
;;; Code:

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; (global-set-key (kbd "C-1") 'flyspell-auto-correct-previous-word)
;; (global-set-key (kbd "C-2") 'flyspell-auto-correct-word)
;; (global-set-key (kbd "C-3") 'flyspell-goto-next-error)
;; (global-set-key (kbd "C-4") 'flyspell-buffer)

(global-set-key (kbd "<f5>") 'flyspell-mode)

;; <2022-03-20 Sk> removing C-M-i "auto-correct word" because it
;; wouldn't let me to bind org-roam "insert link automatically
;; thingy". Now, as I unbind it (it's not gone, I can still auto
;; correct words with C-.m) I can use C-M-i to org-roam insert link. I
;; am tired, right, repeating myself. Going to sleep. Glad org-roam
;; works and I am finding solutions to make it work according to this
;; https://www.youtube.com/watch?v=AyhPmypHDEw tutorial.

;; (with-eval-after-load "flyspell"
;;   (define-key flyspell-mode-map (kbd "C-M-i") nil))

;;; flyspell.el ends here
