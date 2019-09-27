;; Mode Line
(setq-default mode-line-format
  (list
   '(:eval (propertize "%b " 'face 'font-lock-keyword-face
                      'help-echo (buffer-file-name)))

   (propertize "%I" 'face 'font-lock-constant-face) ;; size

   " (" (propertize "%l" 'face 'font-lock-type-face) ")"

   "[" '(:eval (propertize "%m" 'face 'font-lock-string-face
                       'help-echo buffer-file-coding-system)) "] "

  '(vc-mode vc-mode)
  ))
