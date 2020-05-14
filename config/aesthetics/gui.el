;; -*- lexical-binding: t; -*-
(message "Setting up GUI Config")

;; Cursor(UI Mode)
(setq evil-normal-state-cursor '("grey" box)
          evil-insert-state-cursor '("#B30000" hbar)
          evil-visual-state-cursor '("grey" hbar)
          evil-replace-state-cursor '("#FF4D4D" hbar))

;; Font
(set-face-attribute 'default nil :family "Fantasque Sans Mono" :height 95)
(set-face-attribute 'fixed-pitch nil :family "Fantasque Sans Mono" :height 95)

(provide 'gui)
;;; gui.el ends here
