;; Web-mode
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))

;; Emmet
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

(provide 'modehooks)
;;; modehooks.el ends here
