;; -*- lexical-binding: t; -*-
(message "Setting up GUI Config")

;; Cursor(UI Mode)
(setq evil-normal-state-cursor '(box)
          evil-insert-state-cursor '(hbar)
          evil-visual-state-cursor '(hbar)
          evil-replace-state-cursor '(hbar))

(provide 'gui)
;;; gui.el ends here
