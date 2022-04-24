;;; visual.el --- visual stuff
;;; Commentary:
;; visual
;;; Code:

(add-to-list 'custom-theme-load-path "/home/arvydas/Dropbox/src/emacs/misc/")

;; [2022-03-14 Pr] Transparency
(set-frame-parameter (selected-frame) 'alpha '(95 . 95))
(add-to-list 'default-frame-alist '(alpha . (95 . 95)))

(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(blink-cursor-mode -1)
(global-hl-line-mode 1)
(setq-default indicate-empty-lines t)   ; show where buffers end.
(setq visible-bell t)

;; Parentheses
(electric-pair-mode +1)                 ; writes parens automatically for you
(show-paren-mode 1)                     ; highlight parenthesis
(setq show-paren-delay 0)               ; Show matching parens

(column-number-mode 1)                  ; column-number in mode-line.
(size-indication-mode 1)                ; file size indication in mode-line

;; Line numbers
;; (global-display-line-numbers-mode 1)
(add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(use-package doom-themes
  :ensure t
  ;; :disabled t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-palenight t))

;; [2022-03-18 Pn] so far There is nothing better and cleaner than -
;; "Doom-modeline". It converts a basic looking, all cramped modeline into a
;; nice and clean one with only the necessary info and icons displayed.
;; So far so good, liking it.

(use-package doom-modeline
  :ensure t
  :init
  (setq doom-modeline-env-enable-python t)
  (setq doom-modeline-env-enable-go nil)
  (setq doom-modeline-buffer-encoding 'nondefault)
  (setq doom-modeline-hud t)
  (setq doom-modeline-persp-icon nil)
  (setq doom-modeline-persp-name nil)
  :config
  (setq doom-modeline-minor-modes nil)
  (setq doom-modeline-buffer-state-icon nil)
  (doom-modeline-mode 1)
  :custom
  (doom-modeline-irc t))

;; [2021-07-01] "Beacon" - never lose your cursor again. Flashes the
;; cursor location when switching buffers.
(use-package beacon
  :ensure t
  :config
  (progn
    (setq beacon-blink-when-point-moves-vertically nil) ; default nil
    (setq beacon-blink-when-point-moves-horizontally nil) ; default nil
    (setq beacon-blink-when-buffer-changes t) ; default t
    (setq beacon-blink-when-window-scrolls t) ; default t
    (setq beacon-blink-when-window-changes t) ; default t
    (setq beacon-blink-when-focused nil) ; default nil

    (setq beacon-blink-duration 0.3) ; default 0.3
    (setq beacon-blink-delay 0.3) ; default 0.3
    (setq beacon-size 20) ; default 40
    ;; (setq beacon-color "yellow") ; default 0.5
    (setq beacon-color 0.5) ; default 0.5

    (add-to-list 'beacon-dont-blink-major-modes 'term-mode)

    (beacon-mode 1)))

;; Counsel
;; [2021-07-01> Click 'M-o' while in 'C-x C-f' to get a lot of options!
(use-package counsel
  :ensure t
  :after ivy
  :config (counsel-mode))

(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode t))

;; (use-package auto-dim-other-buffers
;;   :ensure t
;;   :if (display-graphic-p)
;;   :config
;;   (auto-dim-other-buffers-mode t)
;;   (my/use-doom-colors
;;    (auto-dim-other-buffers-face
;;     :background (color-darken-name (doom-color 'bg) 3))))

;;; visuals.el ends here
