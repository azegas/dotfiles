# Table of Contents

-   [My personal Emacs configuration](#orge62cc4d)
    -   [<span class="timestamp-wrapper"><span class="timestamp">[2023-06-05 Mon] </span></span> Lots of refactoring](#orgd2258f7)
    -   [<span class="timestamp-wrapper"><span class="timestamp">[2023-03-18 Sat] </span></span> One org mode file for all configuration](#orgdede8a9)
    -   [<span class="timestamp-wrapper"><span class="timestamp">[2023-01-08 Sun] </span></span> No init.org.](#org0dd44ee)
    -   [<span class="timestamp-wrapper"><span class="timestamp">[2023-01-06 Fri] </span></span> Daemon mode](#org9ce361b)
    -   [<span class="timestamp-wrapper"><span class="timestamp">[2023-01-06 Fri] </span></span> Using emacs with org mode at work](#org502b137)
    -   [<span class="timestamp-wrapper"><span class="timestamp">[2022-12-27 Tue] </span></span> Overwhelmed](#orgde59f1a)


<a id="orge62cc4d"></a>

# My personal Emacs configuration

<https://orgmode.org/worg/org-quotes.html>


<a id="orgd2258f7"></a>

## <span class="timestamp-wrapper"><span class="timestamp">[2023-06-05 Mon] </span></span> Lots of refactoring

New laptop, new setup ONCE Again. This time on Windows and WSL.

Have a lof of directories that have to be changed all the time I
switch machines, so decided to put all of those directories in one
place so it's easy to configure.


<a id="orgdede8a9"></a>

## <span class="timestamp-wrapper"><span class="timestamp">[2023-03-18 Sat] </span></span> One org mode file for all configuration

Branch copied from "230318-Org-file-in-project-folder".

Decided to make .org file to act as my init file. Better for
documenting processes and storing shortcuts.. now I have three places
for that. One for init(config), one for shortcuts one for
documentation of emacs processes.

In the future it might be problem with windows stuff, but will see
then.


<a id="org0dd44ee"></a>

## <span class="timestamp-wrapper"><span class="timestamp">[2023-01-08 Sun] </span></span> No init.org.

With it the config loads slower and it's not as easy to turn off
packages quickly. With my setup, I just uncomment the code and the
package is ignrod upon next load.

In case I want to load org file as my init.el, I can do it by placing
init.org file in my .emacs.d

\`\`\`
(package-initialize)
(org-babel-load-file "~/.emacs.d/config.org")
\`\`\`


<a id="org9ce361b"></a>

## <span class="timestamp-wrapper"><span class="timestamp">[2023-01-06 Fri] </span></span> Daemon mode

Found out about emacs daemon mode. It makes emacs
instances load instantaneously. Amazing.

Add these to .bashrc for easy launch/use/kill:
\`\`\`
alias ed='emacs &#x2013;daemon'
alias e='emacsclient -c -n'
alias ek='emacsclient -e "(kill-emacs)"'
\`\`\`


<a id="org502b137"></a>

## <span class="timestamp-wrapper"><span class="timestamp">[2023-01-06 Fri] </span></span> Using emacs with org mode at work

[Using emacs with org mode at
work](<https://www.reddit.com/r/emacs/comments/1043g41/help_me_use_emacs_with_org_mode_at_work/>).
Finally decided to have work org files at work and personal at home.
Better work and life balance in this way. Emacs at work windows
computer will run on WSL with [GWSL](<https://opticos.github.io/gwsl/>)
for a GUI.


<a id="orgde59f1a"></a>

## <span class="timestamp-wrapper"><span class="timestamp">[2022-12-27 Tue] </span></span> Overwhelmed

I am feeling little bit overwhelmed with my workflow
with emacs to track my daily tasks and projects at home and at work.

All was fine until I discovered that I can use emacs at work(finally).
Now the struggle is with Dropbox, keeping only my work files at work,
but also seeing them at home..

Then also the agenda views, capture templates, refiling, one big org
file or many small org files, tags, categories, archiving and so on.
The more I tinker with it the more lost and confused I become.

Each time configuring the method requires me restructuring the
notes&#x2026;

This is the attempt where I try to implement this:

<https://members.optusnet.com.au/~charles57/GTD/gtd_workflow.html>

<https://members.optusnet.com.au/~charles57/GTD/remember.html>

<https://members.optusnet.com.au/~charles57/GTD/mydotemacs.txt>

<https://lifehacker.com/the-weekly-review-how-one-hour-can-save-you-a-week-s-w-5908816>

Wish me luck.

I will simplify it as much as possible, then use it with ease and
enjoyment. I know it.
Copied
