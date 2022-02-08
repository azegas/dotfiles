# Emacs on windows

some useful stuff https://www.gnu.org/software/emacs/manual/html_mono/efaq-w32.html#Location-of-init-file

install emacs from here - http://ftp.task.gda.pl/pub/gnu/emacs/windows/emacs-27/

set home path variable like the guy in this tut - https://lucidmanager.org/productivity/emacs-windows/

do - setx HOME %USERPROFILE% in windows powershell

then you will see that HOME variable has appeared under - settings -> system -> advanced system settings -> environment variables 

then open emacs and do C-h v, write user-emacs-directory and enter. It will create an .emacs.d directory under HOME path. 

It works, right? okay, now you remember how to set the path.

now go back to environment variables and make it like so - C:\Users\Arvydas\emacs

You will place the .emacs file in that folder and also .emacs.d folder will appear in it. great.

put some variables in .emacs and confirm that emacs got modified

(menu-bar-mode -1)            ; Disable the menu bar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)       ; Give some breathing room

worked for me so far.

Time to link it with Dropbox.

add this to the .emacs file. right under use-package installation

(org-babel-load-file (expand-file-name "C:\\Users\\Arvydas\\Dropbox\\temp_emacs\\myinit.org"))

imesk theme i .emacs.d, jokiu folderiu. turetu veikti
