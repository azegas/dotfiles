# My personal Emacs configuration

https://orgmode.org/worg/org-quotes.html

<2023-01-08> No init.org, with it the config loads slower and it's not
as easy to turn off packages quickly. With my setup, I just uncomment
the code and the package is ignrod upon next load.

In case I want to load org file as my init.el, I can do it by placing
init.org file in my .emacs.d

`(package-initialize)
(org-babel-load-file "~/.emacs.d/config.org")`

<2023-01-06> Found out about emacs daemon mode. It makes emacs
instances load instantaneously. Amazing.

<2023-01-06> [Using emacs with org mode at
work](https://www.reddit.com/r/emacs/comments/1043g41/help_me_use_emacs_with_org_mode_at_work/).
Finally decided to have work org files at work and personal at home.
Better work and life balance in this way. Emacs at work windows
computer will run on WSL with [GWSL](https://opticos.github.io/gwsl/)
for a GUI.

<2022-12-27 Tue> I am feeling little bit overwhelmed with my workflow
with emacs to track my daily tasks and projects at home and at work.

All was fine until I discovered that I can use emacs at work(finally).
Now the struggle is with Dropbox, keeping only my work files at work,
but also seeing them at home..

Then also the agenda views, capture templates, refiling, one big org
file or many small org files, tags, categories, archiving and so on.
The more I tinker with it the more lost and confused I become.

Each time configuring the method requires me restructuring the
notes...

This is the attempt where I try to implement this:

https://members.optusnet.com.au/~charles57/GTD/gtd_workflow.html

https://members.optusnet.com.au/~charles57/GTD/remember.html

https://members.optusnet.com.au/~charles57/GTD/mydotemacs.txt

https://lifehacker.com/the-weekly-review-how-one-hour-can-save-you-a-week-s-w-5908816

Wish me luck.

I will simplify it as much as possible, then use it with ease and
enjoyment. I know it.
