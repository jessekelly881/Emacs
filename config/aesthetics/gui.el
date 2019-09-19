(message "Setting up GUI Config")

(set-face-attribute 'default nil :family "Iosevka" :height 80)
(set-face-attribute 'fixed-pitch nil :family "Iosevka" :height 80)

;; (defun gui-set-frame-config ()
;;   "Set config for GUI frame"
;;   (select-frame frame)
;;   (when (display-graphic-p frame)
;;     (load-theme-buffer-local 'dracula (current-buffer))
;;     ))
