;; Web-mode
(add-to-list 'auto-mode-alist '("\\.html$"  . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx?$"  . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?$"  . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.css$"   . css-mode))
(add-to-list 'auto-mode-alist '("\\.scss$"  . scss-mode))

(add-hook 'web-mode-hook         'emmet-mode)
(add-hook 'scss-mode-hook        'emmet-mode)
(add-hook 'css-mode-hook         'emmet-mode)
(add-hook 'javascript-mode-hook  'emmet-mode)
(add-hook 'typescript-mode-hook  'emmet-mode)

(setq web-mode-ac-sources-alist
  '(("html" . (ac-source-emmet-html-aliases ac-source-emmet-html-snippets))
    ("css" . (ac-source-css-property ac-source-emmet-css-snippets))))

(add-hook 'web-mode-before-auto-complete-hooks
          '(lambda ()
             (let ((web-mode-cur-language
                    (web-mode-language-at-pos)))
               (if (string= web-mode-cur-language "css")
                   (setq emmet-use-css-transform t)
                 (setq emmet-use-css-transform nil)))))

;; Magit
(add-hook 'git-commit-mode-hook 'evil-normal-state)
(setq git-commit-major-mode 'org-mode)

(add-hook 'prog-mode-hook 'highlight-thing-mode)

(provide 'modehooks)
;;; modehooks.el ends here
