;;; elfeed.el --- rss reader
;;; Commentary:
;; nerd news
;;; Code:

(use-package elfeed
  :ensure t
  :commands elfeed)

(setq elfeed-feeds
      '("http://nullprogram.com/feed/"
	"https://lukesmith.xyz/rss.xml"
	"https://planet.emacslife.com/atom.xml"))

;;; elfeed.el ends here
