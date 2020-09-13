;; -*- lexical-binding: t; -*-
;; Web-mode
(add-to-list 'auto-mode-alist '("\\.css$"   . css-mode))
(add-to-list 'auto-mode-alist '("\\.html$"  . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts$"  . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx$"  . typescript-mode))
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

;; Enable hs-minor-mode in all prog buffers and fold all definitions
;; @see https://stackoverflow.com/questions/12763566/how-to-permanently-enable-the-hs-minor-mode-in-emacs
(defun my/hide-all()
  (interactive)
  (hs-minor-mode)
  (hs-hide-all))
(add-hook 'prog-mode-hook 'my/hide-all)

;; dired - hide details by default
(add-hook 'dired-mode-hook
      (lambda ()
        (dired-hide-details-mode)
        (linum-relative-mode)
        ))

;; fixed line wrapping
(add-hook 'prog-mode-hook #'visual-line-mode)

(defun my/prettify-dired ()
  "Custom `dired-mode' behaviours."
  (setq truncate-lines t))
(add-hook 'dired-mode-hook 'my/prettify-dired)


(provide 'modehooks)
;;; modehooks.el ends here
