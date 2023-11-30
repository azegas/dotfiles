;; [2021-07-01] “Company” provides autosuggestion/completion in
;; buffers (writing code, pathing to files, etc) and also in file path
;; completion when trying to search for a directory.

;; press <f1> to display the documentation for the selected candidate
;; or C-w to see its source tas dropdown su suggestions, works
;; perfectly wiht elisp out of the box

(use-package company
  :ensure t
  :config
  ; lb svarbu, instant suggestion
  (setq company-idle-delay 0)
  ;; (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t)
  ; flip when narrow place
  (setq company-tooltip-flip-when-above nil)
  (global-company-mode))
