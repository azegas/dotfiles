;; Go to last/previous change [2022-02-24 Kt] Perfect! Can now cycle
;; through the last changes in the buffer. Very useful when doing some
;; C-s in the buffer and then want to come back to the last modified
;; location. Great! If trying to use it in org file - doesn’t
;; work. Does ”org-cycle-agenda-files’ instead when doing the reverse.

(use-package goto-chg
  :ensure t)
