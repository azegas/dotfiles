;;; org-pomodoro.el
;;; Commentary:
;;
;;; Code:

(use-package org-pomodoro
  :ensure t
  :commands (org-pomodoro)
  :config
  (setq org-pomodoro-ticking-sound-p nil)
  ;; (setq alert-user-configuration (quote ((((:category . "org-pomodoro")) libnotify nil))))
  )

;;; org-pomodoro.el ends here
