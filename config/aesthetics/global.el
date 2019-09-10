(load-theme 'brin t)

;;Set font size for UI
(set-face-attribute 'default nil :height 80)

;; Transparent Background
(defun on-frame-open (&optional frame)
  "If the FRAME created in terminal don't load background color."
  (unless (display-graphic-p frame)
    (set-face-background 'default "unspecified-bg" frame)
    (set-face-background 'font-lock-comment-face "unspecified-bg" frame)
    (set-face-foreground 'linum "unspecified-bg" frame)
    ))

(add-hook 'after-make-frame-functions 'on-frame-open)

;; Mode Line
(setq-default mode-line-format
  (list
   " "
   "%m. "
   "%b. "
   "line %l. "
   ))

;;Highlight Curent Line
(global-hl-line-mode +1)

;; Cursor(UI Mode)
(setq evil-normal-state-cursor '("#FFFF4D" box)
          evil-insert-state-cursor '("#B30000" hbar)
          evil-visual-state-cursor '("grey" hbar)
          evil-replace-state-cursor '("#FF4D4D" hbar))

;; Helm Swoop
(setq helm-swoop-pre-input-function
      (lambda () ""))

;; Enable Pretty Symbols
(global-prettify-symbols-mode 1)
