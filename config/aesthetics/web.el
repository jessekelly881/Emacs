(defun my/web-mode-settings ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-enable-current-column-highlight t)
  (setq web-mode-enable-auto-closing t)
)

(add-hook 'web-mode-hook  'my/web-mode-settings)
