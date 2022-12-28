;;; Compiled snippets and support files for `eshell-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'eshell-mode
                     '(("version" "apt-cache policy ${1:package-name}" "version" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/eshell-mode/version" nil nil)
                       ("freeze" "python -m pip freeze > requirements.txt" "pip freeze" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/eshell-mode/pip_freeze" nil nil)
                       ("live" "python3 -m http.server" "live" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/eshell-mode/live" nil nil)
                       ("dsh" "./manage.py shell" "dshell" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/eshell-mode/django_shell" nil nil)
                       ("drun" "python3 manage.py runserver" "drun" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/eshell-mode/django_runserver" nil nil)
                       ("dmig" "python3 manage.py migrate" "dmig" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/eshell-mode/django_migrate" nil nil)
                       ("dmake" "python3 manage.py makemigrations" "dmake" nil nil nil "/home/arvydas/Dropbox/src/emacs/snippets/eshell-mode/django_makemigrations" nil nil)))


;;; Do not edit! File generated at Thu Dec 22 13:08:16 2022
