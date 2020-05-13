;; -*- lexical-binding: t; -*-
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(load (expand-file-name "config/core.el" user-emacs-directory))

(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 1)
 '(company-minimum-prefix-length 3)
 '(company-tabnine-max-num-results 9)
 '(evil-collection-setup-minibuffer t)
 '(fringe-mode 10 nil (fringe))
 '(gac-ask-for-summary-p t t)
 '(git-commit-major-mode 'org-mode)
 '(git-gutter:added-sign "+ ")
 '(git-gutter:deleted-sign "- ")
 '(git-gutter:modified-sign "~ ")
 '(highlight-indent-guides-auto-enabled nil)
 '(highlight-indent-guides-method 'column)
 '(highlight-indentation-blank-lines t t)
 '(indium-chrome-executable "google-chrome-stable" t)
 '(keyfreq-excluded-commands
   '(evil-append evil-backward-char evil-change evil-delete evil-delete evil-forward-char evil-insert evil-insert-line evil-next-line evil-normal-state evil-open-below evil-previous-line evil-repeat helm-M-x helm-next-line helm-previous-line keyboard-quit magit-next-line magit-previous-line minibuffer-complete my/quit next-line org-self-insert-command save-buffer self-insert-command self-insert-command undo-tree-undo) t)
 '(ledger-clear-whole-transactions t t)
 '(linum-format "%d")
 '(linum-relative-backend 'display-line-numbers-mode)
 '(magit-stage-all-confirm nil t)
 '(magit-unstage-all-confirm nil t)
 '(main-line-color1 "#222232")
 '(main-line-color2 "#333343")
 '(org-confirm-babel-evaluate nil)
 '(powerline-color1 "#222232")
 '(powerline-color2 "#333343")
 '(skeletor-project-directory "/home/jesse/dev/projects/active")
 '(webpaste-paste-confirmation t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#181a26" :foreground "gray80" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "CYEL" :family "Iosevka"))))
 '(highlight ((t (:background "undefined-bg" :foreground "white" :weight bold))))
 '(highlight-thing ((t (:inherit 'highlight))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.0))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))
