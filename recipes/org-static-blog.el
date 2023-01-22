;;; org-statc-blog.el
;;; Commentary:
;;; Code:

(use-package org-static-blog
  :ensure t)

(setq org-static-blog-publish-title "My Static Org Blog")
(setq org-static-blog-publish-url "https://arvydasg.github.io/")
(setq org-static-blog-publish-directory "~/Dropbox/src/arvydasg.github.io/")
(setq org-static-blog-posts-directory "~/Dropbox/org/blog/")
(setq org-static-blog-drafts-directory "~/Dropbox/src/arvydasg.github.io/drafts/")
(setq org-static-blog-index-length 5)
(setq org-static-blog-use-preview t)
(setq org-static-blog-enable-tags t)
(setq org-export-with-toc nil)
(setq org-export-with-section-numbers nil)
(setq org-static-blog-no-post-tag "nonpost")

;; This header is inserted into the <head> section of every page:
;;   (you will need to create the style sheet at
;;    ~/projects/blog/static/style.css
;;    and the favicon at
;;    ~/projects/blog/static/favicon.ico)
(setq org-static-blog-page-header
      "<meta name=\"author\" content=\"Arvydas Gasparavicius\">
<meta name=\"referrer\" content=\"no-referrer\">
<meta name=\"viewport\" content=\"initial-scale=1,width=device-width,minimum-scale=1\">
<link href= \"static/style.css\" rel=\"stylesheet\" type=\"text/css\" />
<script src=\"static/lightbox.js\"></script>
<script src=\"static/auto-render.min.js\"></script>
<link rel=\"icon\" href=\"static/ag.ico\">")

;; This preamble is inserted at the beginning of the <body> of every page:
;;   This particular HTML creates a <div> with a simple linked headline
(setq org-static-blog-page-preamble

"<div class=\"header\">
  <a href=\"https://arvydasg.github.io/\">Arvydas Scratchpad on the Internet</a>
  <div class=\"sitelinks\">
    <a href=\"https://github.com/arvydasg\">Github</a> | <a href=\"https://arvydasg.github.io/projects.html\">Projects</a> | <a href=\"https://arvydasg.github.io/uses.html\">Uses</a> | <a href=\"https://arvydasg.github.io/about.html\">About</a>
  </div>
</div>"
      )

;; This postamble is inserted at the end of the <body> of every page:
;;   This particular HTML creates a <div> with a link to the archive page
;;   and a licensing stub.
(setq org-static-blog-page-postamble
      "<div id=\"archive\">
  <a href=\"./archive.html\">Other posts</a>
</div>
<center><a rel=\"license\" href=\"https://creativecommons.org/licenses/by-sa/3.0/\"><img alt=\"Creative Commons License\" style=\"border-width:0\" src=\"https://i.creativecommons.org/l/by-sa/3.0/88x31.png\" /></a><br /><span xmlns:dct=\"https://purl.org/dc/terms/\" href=\"https://purl.org/dc/dcmitype/Text\" property=\"dct:title\" rel=\"dct:type\">arvydasg.github.io</span> by <a xmlns:cc=\"https://creativecommons.org/ns#\" href=\"https://https://arvydasg.github.io/\" property=\"cc:attributionName\" rel=\"cc:attributionURL\">Arvydas Gasparavicius</a> is licensed under a <a rel=\"license\" href=\"https://creativecommons.org/licenses/by-sa/3.0/\">Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.</center>"
      )

;; This HTML code is inserted into the index page between the preamble and
;;   the blog posts
(setq org-static-blog-index-front-matter
      "<h1> Welcome to my blog </h1>\n")

;;; org-statc-blog.el ends here
