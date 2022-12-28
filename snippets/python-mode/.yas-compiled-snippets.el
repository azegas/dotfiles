;;; Compiled snippets and support files for `python-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'python-mode
                     '(("ds" "\"\"\"$0.\"\"\"" "docstring" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/python-mode/docstring" nil nil)
                       ("--" "# --------------------------------------------------------------------\n" "divideris" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/python-mode/divideris" nil nil)
                       ("class" "# pasitvarkyk lygiuote\n\nclass Irasas:\n    def __init__(self, tekstas):\n        self.tekstas = tekstas\n\n    def pajamos(self):\n        pass\n\n    def islaidos(self):\n        pass\n\n    def __str__(self):\n        return f\"Ivedem {self.tekstas}\"\n\n\nx = Irasas(\"labas\")\nprint(x)" "boilerplate class" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/python-mode/boilerplate_class" nil nil)))


;;; Do not edit! File generated at Thu Dec 22 13:08:16 2022
