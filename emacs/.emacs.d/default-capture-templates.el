(setq org-capture-templates '(
                               (
                                 "i"
                                 "Index"
                                 entry
                                 (file+headline "~/GIT/notes/random.org" "Random")
                                 "* TODO %? \n:PROPERTIES:\n:CAPTURED: %U\n:WHERE: %a\n:END:\n\n"
                                  :prepend t
                                 )
                               ))

(provide 'capture-templates)
