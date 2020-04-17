;; -*- lexical-binding: t; -*-
;; Web-mode
(add-to-list 'auto-mode-alist '("\\.css$"   . css-mode))
(add-to-list 'auto-mode-alist '("\\.html$"  . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts$"  . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.scss$"  . scss-mode))

(add-to-list 'auto-mode-alist '("\\.jsx?$"  . js-jsx-mode))

(add-hook 'prog-mode-hook  'delete-carrage-returns)

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

(provide 'modehooks)
;;; modehooks.el ends here
