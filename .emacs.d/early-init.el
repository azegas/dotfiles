;;; early-init.el -*- lexical-binding: t; -*-

;; Emacs 27+ introduces early-init.el, which is run before init.el,
;; before package and UI initialization happens.

;; Use early-init to disable title bar or tool bar earlier, TO AVOID REDRAWING THE FRAME.

;; inspiration for this file from - https://github.com/ogdenwebb/snug-emacs/blob/main/early-init.el

;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6

      ;; In noninteractive sessions, prioritize non-byte-compiled source files to
      ;; prevent the use of stale byte-code. Otherwise, it saves us a little IO time
      ;; to skip the mtime checks on every *.elc file.
      load-prefer-newer 'noninteractive

      native-comp-jit-compilation nil

      ;; In Emacs 27+, package initialization occurs before `user-init-file' is
      ;; loaded, but after `early-init-file'.
      package-enable-at-startup nil

      ;; `use-package' is builtin since 29.
      ;; It must be set before loading `use-package'.
      use-package-enable-imenu-support t

      ;; Disable built-in mode-line because we have own config
      mode-line-format nil

      ;; Prevent the glimpse of un-styled Emacs by disabling these UI elements early.
      default-frame-alist
      '((vertical-scroll-bars . nil)
	(menu-bar-lines . 0)
	(tool-bar-lines . 0))

      ;; First off, let’s declutter. Remove clickies to give a nice and clean
      ;; look. Also, the cursor can relax.

      ;; Resizing the Emacs frame can be a terribly expensive part of changing the
      ;; font. By inhibiting this, we easily halve startup times with fonts that are
      ;; larger than the system default.
      frame-inhibit-implied-resize t)


;; Ignore X resources; its settings would be redundant with the other settings
;; in this file and can conflict with later config (particularly where the
;; cursor color is concerned).
(advice-add #'x-apply-session-resources :override #'ignore)



;; Load this built in package on emacs startup, so =C-h v= and jumping to
;; definition would work. Not only when building the site...
;; noticed that it requires a lot of emacs init time resources with esup
(require 'ox-publish)
