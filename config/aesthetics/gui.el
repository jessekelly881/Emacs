(message "Setting up GUI Config")

;; Cursor(UI Mode)
(setq evil-normal-state-cursor '("#FFFF4D" box)
          evil-insert-state-cursor '("#B30000" hbar)
          evil-visual-state-cursor '("grey" hbar)
          evil-replace-state-cursor '("#FF4D4D" hbar))

(set-face-attribute 'default nil :family "Iosevka" :height 80)
(set-face-attribute 'fixed-pitch nil :family "Iosevka" :height 80)

(provide 'gui)
;;; gui.el ends here
