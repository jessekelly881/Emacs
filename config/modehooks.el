;; Web-mode
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))

;; Emmet
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

;; Magit
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . org-mode))
(add-hook 'git-commit-mode-hook 'evil-normal-state)

(provide 'modehooks)
;;; modehooks.el ends here
