;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
                     '(("vv" "${1:kada}, ${2:kiek}, ${3:kodel}" "virsvalandziai" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/org-mode/virsvalandziai" nil nil)
                       ("<tt" "#+TITLE: ${1:title}\n#+AUTHOR: ${2:author}\n\n$0" "titler" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/org-mode/titler" nil nil)
                       ("sql" "#+begin_src sql\n$0\n#+end_src" "sql" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/org-mode/sql" nil nil)
                       ("<book" "** ${1:quote}\n:PROPERTIES:\n:author: ${2:author}\n:from: ${3:from where?}\n:END:\n\n$0" "book" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/org-mode/quote" nil nil)
                       ("py" "#+begin_src python\n$0\n#+end_src" "py" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/org-mode/py" nil nil)
                       ("new" "#+STARTUP: overview\n#+FILETAGS: ${2:ar reikia tago?}\n#+archive: ::* Archived Tasks\n\n* ${1:failo vardas}\n`(buffer-file-name)`\n\n$0\n\n* references\n:PROPERTIES:\n:VISIBILITY: folded\n:END:\n\n* Archived Tasks :ARCHIVE:" "newFile" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/org-mode/newFile" nil nil)
                       ("js" "#+begin_src javascript\n$0\n#+end_src" "js" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/org-mode/js" nil nil)
                       ("<imgp" "#+attr_html: :width 400px\n#+ATTR_ORG: :width 400\n[[file:~/Dropbox/documents/org/images_nejudink/$0.jpg]]\n" "image" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/org-mode/imagepkc" nil nil)
                       ("<demo" "#+BEGIN_SRC\n$0\n#+END_SRC" "demo" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/org-mode/demo" nil nil)
                       ("css" "#+begin_src css\n$0\n#+end_src" "css" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/org-mode/css" nil nil)
                       ("<book" "*** ${1:title}\n:PROPERTIES:\n:author: ${2:author}\n:year: ${3:year}\n:pages: ${6:pages}\n:rating: ${7:rating}\n:END:\n\n$0" "book" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/org-mode/book" nil nil)
                       ("<img" "#+attr_html: :width 600px\n#+ATTR_ORG: :width 600\n" "image" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/org-mode/blet" nil nil)
                       ("appli" "*** position ${1:}\n${2:}\n*** date applied ${3:}\n*** date should respond ${4:}\n*** date will write again ${5:}\n*** kanalas\n${6:}\n*** zinute\n${7:}" "appli" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/org-mode/application" nil nil)))


;;; Do not edit! File generated at Thu Dec 22 13:08:16 2022
