;;; ace-window.el --- jump/create/swap buffers
;;; Commentary:
;; [2021-07-01] "Ace windows" helps me to switch windows easily. Main keybind - C-x o
;; and then the commands that follow below.
;;; Code:

(use-package ace-window
  :ensure t
  :init (setq aw-keys '(?q ?w ?e ?r ?y ?h ?j ?k ?l)
                                        ;aw-ignore-current t ; not good to turn off since I wont be able to do c-o o <current>
              aw-dispatch-always t)     ;t means it applies a letter even if there are only two windows. not needed.
  :bind (("C-x o" . ace-window)
         ("M-O" . ace-swap-window)
         ("C-x v" . aw-split-window-horz)))
(defvar aw-dispatch-alist
  '((?x aw-delete-window "Delete Window")
    (?m aw-swap-window "Swap Windows")
    (?M aw-move-window "Move Window")
    (?c aw-copy-window "Copy Window")
    (?f aw-switch-buffer-in-window "Select Buffer")
    (?n aw-flip-window)
    (?u aw-switch-buffer-other-window "Switch Buffer Other Window")
    (?c aw-split-window-fair "Split Fair Window")
    (?h aw-split-window-vert "Split Vert Window")
    (?v aw-split-window-horz "Split Horz Window")
    (?o delete-other-windows)
    ;; (?o delete-other-windows "Delete Other Windows")
    ;; (?o delete-other-windows " Ace - Maximize Window")
    (?? aw-show-dispatch-help))
  "List of actions for `aw-dispatch-default'.")

;;; ace-window.el ends here
