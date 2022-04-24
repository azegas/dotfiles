;;; erc.el --- irc client for Emacs
;;; Commentary:
;; chat
;;; Code:

(use-package erc
  :ensure t
  :commands (erc erc-tls)
  :config
  (setq erc-log-channels-directory "~/.emacs.d/erc")
  (setq erc-save-buffer-on-part t)
  (add-to-list 'erc-modules 'autojoin)
  (add-to-list 'erc-modules 'log)
  (erc-update-modules)
  (setq erc-kill-buffer-on-part t)
  (setq erc-track-shorten-start 8))

(setq erc-server "irc.libera.chat"
      erc-nick "Arvydas"
      ;; erc-user-full-name "Emacs User"
      erc-autojoin-channels-alist '(("libera.chat" "#systemcrafters" "#emacs")))

(setq erc-track-exclude-types '("NICK" "JOIN" "LEAVE" "QUIT" "PART"
                                "301"   ; away notice
                                "305"   ; return from awayness
                                "306"   ; set awayness
                                "324"   ; modes
                                "329"   ; channel creation date
                                "332"   ; topic notice
                                "333"   ; who set the topic
                                "353"   ; Names notice
                                ))

;;; erc.el ends here
