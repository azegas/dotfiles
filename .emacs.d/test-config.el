;; just a test config for when you already have all the needed
;; packages installed in the background(elpa)

  ;;; -*- lexical-binding: t -*-
;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(require 'package)
(require 'use-package)
(package-initialize)

;; Add `melpa` to `package-archives`.
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Do not show the startup screen.
(setq inhibit-startup-message t)

(setq recentf-mode t)

(setq ag/emacs-dir "~/.emacs.d")
(defun ag/find-init.org nil
  (interactive)
  (find-file (concat ag/emacs-dir "/test.el")))
(global-set-key (kbd "C-x <C-backspace>") 'ag/find-init.org)

;; Highlight current line.
(global-hl-line-mode t)

(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  )

(use-package orderless
    :ensure t
    :init
    (setq completion-styles '(orderless basic partial-completion)
    completion-category-defaults nil
    orderless-component-separator "[ |]"
    completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1))

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode 1)
  (corfu-popupinfo-mode 1)
  (corfu-history-mode)
  :config
  (setq corfu-cycle t
        corfu-auto t
        corfu-auto-delay 0
        corfu-auto-prefix 2
        corfu-popupinfo-delay 0.5))
