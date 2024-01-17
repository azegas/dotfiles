(setq org-capture-templates '(
                               ("s" "Shipping")
                               (
                                 "st"
                                 "Tasks"
                                 entry
                                 (file+headline "~/GIT/notes/20240115T050013--shipping-tasks__agenda_rdd_shipping.org" "Tasks")
                                 "* TODO %? \n:PROPERTIES:\n:CAPTURED: %U\n:WHERE: %a\n:END:\n\n"
                                  :prepend t
                                 )
                               (
                                 "sn"
                                 "Notes"
                                 entry
                                 (file+headline "~/GIT/notes/20240115T050030--shipping-notes__agenda_rdd_shipping.org" "Notes")
                                 "* %? \n:PROPERTIES:\n:CAPTURED: %U\n:WHERE: %a\n:END:\n\n"
                                 :prepend t
                                 )
                               ("r" "Rights")
                               (
                                 "rt"
                                 "Tasks"
                                 entry
                                 (file+headline "~/GIT/notes/20240114T153943--rights-tasks__agenda_rights.org" "Tasks")
                                 "* TODO %? \n:PROPERTIES:\n:CAPTURED: %U\n:WHERE: %a\n:END:\n\n"
                                 :prepend t
                                 )
                               (
                                 "rn"
                                 "Notes"
                                 entry
                                 (file+headline "~/GIT/notes/20240114T163012--rights-notes__agenda_rights.org" "Notes")
                                 "* %? \n:PROPERTIES:\n:CAPTURED: %U\n:WHERE: %a\n:END:\n\n"
                                 :prepend t
                                 )
                               (
                                 "R"
                                 "RDD"
                                 entry
                                 (file+headline "~/GIT/notes/20231220T113430--rdd__rdd.org" "Captured notes")
                                 "* %? \n:PROPERTIES:\n:CAPTURED: %U\n:WHERE: %a\n:END:\n\n"
                                 :prepend t
                                 )
                               ))

(provide 'capture-templates)
