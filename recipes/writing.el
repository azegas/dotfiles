;;; writing.el --- writing stuff
;;; Commentary:
;; writing
;;; Code:


;; [2021-07-01] "Flycheck" uses various syntax checking and linting tools to
;; automatically check the contents of buffers while you type, and
;; reports warnings and errors directly in the buffer. Or in the right
;; corner if you use "Doom-modeline". Can click on the icon - shows all
;; the errors. Great!  https://www.flycheck.org/en/latest/# Not to
;; confuse with flyspell - checks grammar.
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

;; Spell checking
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

(with-eval-after-load "flyspell"
  (define-key flyspell-mode-map (kbd "C-M-i") nil))

;; [2022-01-01 Št] "Ws-butler" - whitespace butler - clean up whitespace automatically on
;; saving buffer.
(use-package ws-butler
  :ensure t
  :config
  (ws-butler-global-mode t))

;; [[http://emacsrocks.com/e13.html][wow]]
;; [2022-01-01 Št]
(use-package multiple-cursors
  :ensure t
  :commands multiple-cursors
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/unmark-next-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; [2022-01-01 Št] "Hungry delete" - deletes all the whitespace when you hit backspace or
;; delete.
(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

;; "Emojify" allows to preview emojis in emacs buffers. Needed for
;; facebook auto posting
(use-package emojify
  :ensure t
  :hook (after-init . global-emojify-mode))

;; [2022-01-01 Št] "Expand region" allows me to select everything in between any kind of
;; brackets by pressing C-=. The more I press it, the more it selects.
(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region)
  :config)

;; [2021-07-01] "Company" provides autosuggestion/completion in buffers (writing code,
;; pathing to files, etc).  press <f1> to display the documentation for
;; the selected candidate or C-w to see its source

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0) ; lb svarbu, instant suggestion
  ;; (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  ;; (setq company-minimum-prefix-length 2)
  (setq company-tooltip-align-annotations t)
  ;; invert the navigation direction if the the completion popup-isearch-match
  ;; is displayed on top (happens near the bottom of windows)
  (setq company-tooltip-flip-when-above t)
  (global-company-mode))

;; [2022-03-18 Pn] Are you tired of using the endless keystrokes of C-y M-y M-y M-y … to
;; get at that bit of text you killed thirty-seven kills ago? Ever wish
;; you could just look through everything you’ve killed recently to find
;; out if you killed that piece of text that you think you killed, but
;; you’re not quite sure? If so, then browse-kill-ring is the Emacs
;; extension for you.
(use-package browse-kill-ring
  :ensure t
  :config
  (browse-kill-ring-default-keybindings); map M-y to browse-kill-ring
  )

;; [2022-03-20 Sk]
(use-package move-text
  :ensure t
  :config
  (move-text-default-bindings))

;;; writing.el ends here
