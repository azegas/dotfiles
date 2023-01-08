;;; rg.el --- rip grep
;;; Commentary:
;; [2021-07-01] "Rg" - rip grep. Helps to search for a term through many files. Super
;; useful when need to change something on many files.  Installation:
;; Sudo apt install ripgrep M-x rg and search away Tut: nice video
;; https://www.youtube.com/watch?v=4qLD4oHOrlc&ab_channel=ProtesilaosStavrou
;;; Code:

(use-package rg
  :ensure t
  :commands rg)

;;; rg.el ends here
