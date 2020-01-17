;; -*- lexical-binding: t; -*-
;; Theme
(load-theme 'nord t)

;; Load other libraries
(load (expand-file-name "config/aesthetics/pretty-symbols.el" user-emacs-directory))
(load (expand-file-name "config/aesthetics/modeline.el" user-emacs-directory))

;; Transparent Background
(defun on-frame-open (&optional frame)
  "If the FRAME created in terminal don't load background color."
  (unless (display-graphic-p frame)
    (set-face-background 'default "unspecified-bg" frame)
    (set-face-background 'font-lock-comment-face "unspecified-bg" frame)
    (set-face-foreground 'linum "unspecified-bg" frame)
    ))

(add-hook 'after-make-frame-functions 'on-frame-open)


;;Highlight Curent Line
(global-hl-line-mode +1)

;; Helm Swoop
(setq helm-swoop-pre-input-function
      (lambda () ""))

;; Pretty Symbols
(global-prettify-symbols-mode 1)

;; Remove some garbage from helm buffer list
(setq helm-boring-buffer-regexp-list
      (quote
       (  "\\Minibuf.+\\*"
               "\\` "
               "\\*.+\\*"
               "\\magit-process:" "\\magit-diff:" "\\magit:" "\\magit-revision:"
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
  (run-at-time "20 sec" nil #'hide-mode-line-mode +1))

(add-hook 'after-make-frame-functions 'my/hide-mode-line-with-delay)

(provide 'global)
;;; global.el ends here
