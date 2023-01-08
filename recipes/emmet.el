;;; emmet.el --- html tag completion
;;; Commentary:
;; useful
;;; Code:

;; [2021-07-01] "Emmet mode" - HTML completion. Click c-j to autocomplete a tag.
;; Cheat sheet - https://docs.emmet.io/cheat-sheet/
;; SU WEB MODE KRC PRADEDA flycheck nebeveikti ir emmet durniuoja
(use-package emmet-mode
  ;; :ensure t
  :config
  :hook ((web-mode . emmet-mode)
         (html-mode . emmet-mode)
         ;; turning off dell scss C-c C-c shortcut
         ;; (css-mode . emmet-mode)
         (sgml-mode . emmet-mode)))

;;; emmet.el ends here
