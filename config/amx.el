;; [2022-04-01 Fri] amx: An alternative M-x interface for Emacs. Sort
;; by most recent commands. https://github.com/DarwinAwardWinner/amx
;; useful for when you want to run the same command in a row, you
;; don't have to type it each and every time after pressing M-x

(use-package amx
  :ensure t
  :defer 0.5
  :config (amx-mode))
