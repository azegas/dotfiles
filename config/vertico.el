;; [2023-11-26] decided to try out vertico instead of ivy.  Ivy
;; depends on a lot of packages, vertico is more simple. It also
;; replaces amx for M-x search. Prot inspired me to try it out. Let's
;; see.

;; It is everywhere - Ctrl-x f, M-x, ctrl-x d, ctrl-h v... everywhere
;; where you are trying to list and jump to something - vertico is
;; there

(use-package vertico
  :ensure t
  :init
  (vertico-mode)

  ;; Show more candidates
  (setq vertico-count 5)
  )

;; Let's you to type "pa re con" in vertico minubuffer instead of
;; "package-refresh-contents". Orderless completion.
(use-package orderless
  :ensure t
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
	completion-category-defaults nil
	completion-category-overrides '((file (styles partial-completion)))))
