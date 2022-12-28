;;; Compiled snippets and support files for `markdown-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'markdown-mode
                     '(("post" "---\ntitle: \"${1:title}\"\ndate: ${2:date}\ncover:\n    image: ${3:image}\n    alt: '${4:image alt text}'\n    caption: '${5:image caption}'\ntags: [\"${6:tag}\"]\ncategories: [\"${7:projects}\"]\n---" "post" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/markdown-mode/newpost" nil nil)
                       ("img" "![${1:alttext}](/${2:path})" "img" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/markdown-mode/img" nil nil)
                       ("blog" "# Introduction\n\n# Body\n\n## Few more inside\n\n## And a few more\n\n# Conclusion\n\nLink example - [VBA](https://learn.microsoft.com/en-us/dotnet/visual-basic/)" "blog" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/markdown-mode/blog" nil nil)))


;;; Do not edit! File generated at Thu Dec 22 13:08:16 2022
