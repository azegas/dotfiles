;; Increase garbage collector threshold for better performance
(setq gc-cons-threshold most-positive-fixnum)

;; Some basic macros that will be used throughout the config
(defmacro measure-time (&rest body)
  "Measure the time it takes to evaluate BODY."
  `(let ((time (current-time)))
     ,@body
     (let ((elapsed (float-time (time-since time))))
       (message "took %.06f seconds or %.03f milliseconds" elapsed (* 1000.0 elapsed)))))

;; Disable unneeded UI elements
(customize-set-variable 'scroll-bar-mode nil)
(customize-set-variable 'horizontal-scroll-bar-mode nil)
(customize-set-variable 'menu-bar-mode nil)
(customize-set-variable 'tool-bar-mode nil)