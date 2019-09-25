(load-theme 'nord t)

;;Set font size for UI
(set-face-attribute 'default nil :family "Iosevka" :height 80)
(set-face-attribute 'fixed-pitch nil :family "Iosevka" :height 80)

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
   '(:eval (propertize "%b " 'face 'font-lock-keyword-face
                      'help-echo (buffer-file-name)))

   (propertize "%I" 'face 'font-lock-constant-face) ;; size

   " (" (propertize "%l" 'face 'font-lock-type-face) ")"

   "[" '(:eval (propertize "%m" 'face 'font-lock-string-face
                       'help-echo buffer-file-coding-system)) "] "
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

;; Pretty Symbols
(global-prettify-symbols-mode 1)
(setq prettify-symbols-unprettify-at-point 'right-edge)

;; Remove some garbage from helm buffer list
(setq helm-boring-buffer-regexp-list
      (quote
       (  "\\Minibuf.+\\*"
               "\\` "
               "\\*.+\\*"
                  )))

;; Auto add new lines
(setq next-line-add-newlines t)


(setq fancy-buffer-narrowed-p nil)

;; Remove border(frenge)
(if (boundp 'fringe-mode)
  (fringe-mode -1))

;; Hide mode line after some time
(defun my/hide-mode-line-with-delay (&optional frame)
  "Hide modeline after 10s"
  (hide-mode-line-mode nil)
  (run-at-time "10 sec" nil #'hide-mode-line-mode +1))

(add-hook 'after-make-frame-functions 'my/hide-mode-line-with-delay)

;; Rainbow mode hook
(add-hook 'web-mode-hook #'rainbow-mode)

(provide 'global)
;;; global.el ends here
