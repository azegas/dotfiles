;;; macros.el --- macros stuff
;;; Commentary:
;; couldn't find packages for some stuff, so made a macro and they work fine.
;;; Code:

;;; ---------------------------------------

;; [2022-03-12 Št] 5 min tasks taken from all my agenda files.
;; First open agenda, then list all the tasks, then click f9, then choose 5min.
(fset '5minTasks
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([3 97 116 f9 61 50] 0 "%d")) arg)))

;;; ---------------------------------------

;; [2022-03-17 Kt] Macro for adding code block called hack
;; [2022-03-29 An] Or add [[https://orgmode.org/manual/Structure-Templates.html][(require 'org-tempo)]] for <s to work again.
;; [2022-04-04 Mon] Removed this macro, next time make one that leaves
;; cursor on language input

;; [2022-03-19 Št] Open nautilus
(fset 'nautilus
      [?\M-! ?n ?a ?u ?t ?i ?l ?u ?s return])
(global-set-key [f1] 'nautilus)

;; [2022-03-19 Št] Open nautilus current buffer
(fset 'nautilus_current
      [?\M-! ?n ?a ?u ?t ?i ?l ?u ?s ?  ?. return])
(global-set-key [f2] 'nautilus_current)

;;; ---------------------------------------

;; [2022-03-27 Sk] Duplicate a task. If I try to auto copy habit to daily
;; file, it gets duplicated with all the clocked times. That's not so
;; good.. to everyday get all the previous clocked times added up. It
;; results in inaccurate data.

;; What I will do here is copy the task, then clock in on it. Easy. The
;; poriginal task (so it wouldn't show in agenda view anymore and would be
;; marked as done), I will mark as "repeating" and I will not include
;; 'repeating' tasks in 'auto copy tasks to dailies' list. Iz pz.

(fset 'duplicate\ and\ clock_in
      [?\C-c ?\C-t ?r ?\C-  ?\M-x return ?\M-w return ?\C-y ?\C-p ?\C-x ?n ?s tab ?\C-n ?\C-k ?\C-k ?\C-k ?\C-k ?\C-k ?\C-p ?\C-x ?n ?w ?\C-l ?\C-n ?\C-k ?\C-p ?\C-c ?\C-x ?\C-i ?\C-x ?\C-s])

;;; ---------------------------------------

;;; macros.el ends here
