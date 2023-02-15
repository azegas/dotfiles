;;; org-statc-blog.el
;;; Commentary:
;;; Code:

(use-package org-static-blog
  :ensure t)

(setq org-static-blog-publish-title "arvydasg.github.io")
(setq org-static-blog-publish-url "https://arvydasg.github.io/")
(setq org-static-blog-publish-directory "~/Dropbox/src/arvydasg.github.io/")
(setq org-static-blog-posts-directory "~/Dropbox/blog/")
(setq org-static-blog-drafts-directory "/home/arvydas/Dropbox/blog/drafts/")
;; (setq org-static-blog-drafts-directory "~/Dropbox/src/arvydasg.github.io/drafts/")
(setq org-static-blog-index-length 5)
(setq org-static-blog-preview-link-p t)
(setq org-static-blog-preview-date-first-p t)
(setq org-static-blog-use-preview t)
(setq org-static-blog-enable-tags t)
(setq org-export-with-toc nil)            ;can add in individual file with #+OPTIONS: toc:1/nil
(setq org-export-with-section-numbers nil) ;can add in individual file with #+OPTIONS: num:nil
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
"
<header>
    <div class=\"container\">
        <div class=\"subcontainer\">
            <nav class=\"nav\">
                <a href=\"https://arvydasg.github.io/\" class=\"nav-logo-wrapper\">
                    <p class=\"nav-branding\">Arvydas.dev</p>
                </a>
                <ul class=\"nav-menu\">
                    <li class=\"nav-item\">
                        <a href=\"https://arvydasg.github.io/tag-project.html\" class=\"nav-link\">Projects</a>
                    </li>
                    <li class=\"nav-item\">
                        <a href=\"https://arvydasg.github.io/archive.html\" class=\"nav-link\">Blog</a>
                    </li>
                    <li class=\"nav-item\">
                        <a href=\"https://arvydasg.github.io/tags.html\" class=\"nav-link\">Tags</a>
                    </li>
                    <li class=\"nav-item\">
                        <a href=\"https://arvydas.dev/codeacademy/\" class=\"nav-link\">CodeAcademy</a>
                    </li>
                    <li class=\"nav-item\">
                        <a href=\"https://arvydasg.github.io/freelancing.html\" class=\"nav-link\">Freelancing</a>
                    </li>
                    <li class=\"nav-item\">
                        <a href=\"https://arvydasg.github.io/uses.html\" class=\"nav-link\">Uses</a>
                    </li>
                    <li class=\"nav-item\">
                        <a href=\"https://arvydasg.github.io/about.html\" class=\"nav-link\">About</a>
                    </li>
                </ul>
                <div class=\"hamburger\">
                    <span class=\"bar\"></span>
                    <span class=\"bar\"></span>
                    <span class=\"bar\"></span>
                </div>
            </nav>
        </div>
    </div>
    </header>
    "
)

;; before hamburger
;; (setq org-static-blog-page-preamble
;; "
;; <div id=\"nav-content\">
;; <div class=\"header\">
;;    <a href=\"https://arvydasg.github.io/\">Arvydas.dev</a>
;;   <div class=\"sitelinks\">
;;     <a href=\"https://arvydasg.github.io/about.html\">About</a> | <a href=\"https://arvydasg.github.io/freelancing.html\">Freelancing</a> | <a href=\"https://arvydasg.github.io/tag-project.html\">Projects</a> | <a href=\"https://arvydasg.github.io/archive.html\">Blog</a> | <a href=\"https://arvydasg.github.io/uses.html\">Uses</a> | <a href=\"https://arvydas.dev/codeacademy/\">CodeAcademy</a>
;;   </div>
;; <hr>
;;   </div>
;; </div>"
;; )

;; (setq org-static-blog-page-preamble

;; "<div class=\"header\">
;;   <a href=\"https://arvydasg.github.io/\">Arvydas Scratchpad on the Internet</a>
;;   <div class=\"sitelinks\">
;;     <a href=\"https://github.com/arvydasg\">Github</a> | <a href=\"https://arvydasg.github.io/projects.html\">Projects</a> | <a href=\"https://arvydasg.github.io/archive.html\">Archive</a> | <a href=\"https://arvydasg.github.io/uses.html\">Uses</a> | <a href=\"https://arvydasg.github.io/about.html\">About</a>
;;   </div>
;; </div>"
;;       )

;; This postamble is inserted at the end of the <body> of every page:
;;   This particular HTML creates a <div> with a link to the archive page
;;   and a licensing stub.
(setq org-static-blog-page-postamble
      "<div id=\"footer\">
<hr>
<p>© 2021-2023 Arvydas Gasparavičius</p>
  <script src=\"static/script.js\"></script>
</div>")

;; (setq org-static-blog-page-postamble
;;       "<div id=\"archive\">
;;   <a href=\"./archive.html\">Other posts</a>
;; </div>")

;; This HTML code is inserted into the index page between the preamble and
;;   the blog posts
(setq org-static-blog-index-front-matter
      "<h1> Hello there 👋 </h1>
<hr>
<div id=\"intro\">
<p> My name is Arvydas I am self-taught Python/Django developer. <a class=\"no-link\" href=\"https://github.com/arvydasg\">My Github</a>.</p>
<p> I am currently immersing myself in a comprehensive 9-month web development and Python course led by <a class=\"no-link\" href=\"./tag-codeacademy.html\">CodeAcademy</a>, with the goal of expanding my programming skills and knowledge.<p>
<p> I also work as a freelance developer. <a class=\"no-link\" href=\"./freelancing.html\">Read more about my work.</a><p>
<p> If you are interested in some of my writings, here are some of my latest posts:</p>
</div>
\n\n\n")



;; ----------------------------------------------------------

;; after each emacs restart files that I modified in elpa directory
;; are not recompiled. I was advised by Bastibe to place them in my
;; emacs config. It still does not get evaluated for some reason

;; forgot what I changed here form the original file, but will leave
;; it here nevertheless :)
(defun org-static-blog-get-preview (post-filename)
  "Get title, date, tags from POST-FILENAME and get the first paragraph from the rendered HTML.
If the HTML body contains multiple paragraphs, include only the first paragraph,
and display an ellipsis.
Preamble and Postamble are excluded, too."
  (with-temp-buffer
    (insert-file-contents (org-static-blog-matching-publish-filename post-filename))
    (let ((post-title (org-static-blog-get-title post-filename))
          (post-date (org-static-blog-get-date post-filename))
          (post-taglist (org-static-blog-post-taglist post-filename))
          (post-ellipsis "")
          (preview-region (org-static-blog--preview-region)))
      (when (and preview-region (search-forward "<p>" nil t))
        (setq post-ellipsis
              (concat (when org-static-blog-preview-link-p
                        (format "<a class=\"read-more\" href=\"%s\">"
                                (org-static-blog-get-post-url post-filename)))
                      org-static-blog-preview-ellipsis
                      (when org-static-blog-preview-link-p "</a>\n"))))
      ;; Put the substrings together.
      (let ((title-link
             (format "<h2 class=\"post-title\"><a href=\"%s\">%s</a></h2>"
                     (org-static-blog-get-post-url post-filename) post-title))
            (date-link
             (format-time-string (concat "<div class=\"post-date\">"
                                         (org-static-blog-gettext 'date-format)
                                         "</div>")
                                 post-date)))
        (concat
         (if org-static-blog-preview-date-first-p
             (concat date-link title-link)
           (concat date-link title-link))
         preview-region
         post-ellipsis
         (format "<div class=\"taglist\">%s</div><hr>" post-taglist))))))


;; Read more instead of ( ... )
(defcustom org-static-blog-preview-ellipsis "Read more →"
  "The HTML appended to the preview if some part of the post is hidden.

The contents shown in the preview is determined by the values of
the variables `org-static-blog-preview-start' and
`org-static-blog-preview-end'."
  :type '(string)
  :safe t)

;;; org-statc-blog.el ends here
