;;; org_clock.el --- org_clock stuff
;;; Commentary:
;; yep
;;; Code:

(setq org-log-note-clock-out t)
(setq org-clock-out-when-done t)        ; Clock out when moving task to a done state
(org-clock-persistence-insinuate)       ; Resume clocking task when emacs is restarted
(setq org-clock-persist t)              ; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-in-resume t)            ; Resume clocking task on clock-in if the clock is open
(setq org-clock-persist-query-resume nil) ; Do not prompt to resume an active clock, just resume it
(define-key org-mode-map (kbd "C-c C-x C-r") 'org-clock-report) ; Keybind dissapeared after new org install? When roam.
(setq org-clock-idle-time 15)                                   ; ask what to do with a left and forgotten clock
(setq org-clock-in-switch-to-state "STARTED")
(setq org-clock-out-switch-to-state "WAITING")
(setq org-clock-into-drawer "LOGBOOK")
(global-set-key (kbd "C-c C-x C-j") 'org-clock-goto) ; exists, but remapping to be global
(setq org-clock-history-length 23)                   ; C-c I show history of clocks

;; tipo lengviau clock in padaryti, nes matai a list of recent clocks?
(defun eos/org-clock-in ()
  (interactive)
  (org-clock-in '(4)))

(global-set-key (kbd "C-c i") #'eos/org-clock-in) ; list of tasks, choose one
(global-set-key (kbd "C-c C-x C-o") #'org-clock-out)

;;; ---------------------------------------

;; this functions is later used in clock reports. Check org_clock
;; looking through all the folders inside 2020, great!
;; later this function is used in clock report
(defun add-dailies ()
  (append org-agenda-files
          (file-expand-wildcards "~/Dropbox/documents/org/roam/daily/2022/**/*.org")))

;; only looking through one folder
;; (defun add-dailies ()
;;   (append org-agenda-files
;;           (file-expand-wildcards "~/Dropbox/documents/org/roam/daily/2022/kovo/*.org")))

;;; ---------------------------------------

;; ORG CLOCK REPORT EXAMPLES

;; [2022-04-10 Sun] Daily org-diary file report BY TAG
;; #+BEGIN: clocktable :maxlevel 3 :scope file :tags t :sort (1 . ?a) :emphasize t :narrow 100! :match "emacs"

;; [2022-04-10 Sun] Daily org-diary file report without tag, show all tasks
;; #+BEGIN: clocktable :maxlevel 3 :scope file :tags t :sort (1 . ?a) :emphasize t :narrow 100!

;; #+BEGIN: clocktable :maxlevel 3 :scope add-dailies :tags t
;; #+BEGIN: clocktable :maxlevel 3 :scope file :step day :tstart "<-1w>" :tend "<now>" :compact t
;; #+BEGIN: clocktable :maxlevel 5 :compact nil :emphasize t :scope subtree :timestamp t :link t :header "#+NAME: 2022_Vasaris\n"
;; #+BEGIN: clocktable :maxlevel 1 :compact t :emphasize t :timestamp t :link t
;; #+BEGIN: clocktable :maxlevel 5 :compact t :sort (1 . ?a) :emphasize t :scope subtree :timestamp t :link t

;;; org_clock.el ends here
