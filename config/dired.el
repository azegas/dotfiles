(use-package dired
  :ensure nil                         ;no need for t, because dired is built in
  :custom ((dired-listing-switches "-agho --group-directories-first"))) ;sort directories first
(global-set-key (kbd "C-x C-d") 'dired-jump) ;open dired buffer in current location
;; (define-key dired-mode-map (kbd "f") 'dired-find-alternate-file)
;; (global-set-key (kbd "C-x d") 'dired)

;; [2022-03-11 Pn] Adding more colors to dired buffers
;; 22-05-19 isjungiau spalvas - maziau lago
;; (use-package diredfl
;;   :ensure t
;;   :after (dired)
;;   :config
;;   (diredfl-global-mode 1))

;; [2022-03-11 Pn]
;; [[https://github.com/clemera/dired-git-info][dired-git-info]]. This
;; Emacs packages provides a minor mode which shows git information
;; inside the dired buffer.

(use-package dired-git-info
  :ensure t
  :after dired)

;; Bind the minor mode command in dired

;; (with-eval-after-load 'dired
;;   (define-key dired-mode-map ")" 'dired-git-info-mode))

;; Dont hide normal Dired file info

;; (setq dgi-auto-hide-details-p nil)

;; Enable automatically in every Dired buffer (if in Git repository)
;; (add-hook 'dired-after-readin-hook 'dired-git-info-auto-enable)
