;; multiple-cursors.el — select same words inside the buffer and
;; replace them - wow!!

(use-package multiple-cursors
  :ensure t
  :commands multiple-cursors
  :bind (("C->" . mc/mark-next-like-this)
	 ("C-<" . mc/unmark-next-like-this)
	 ("C-c C-<" . mc/mark-all-like-this)))

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
