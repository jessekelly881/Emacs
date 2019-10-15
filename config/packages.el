;; Package Install And Base Config

;; Submodules
(load (expand-file-name "submodules/spinner/spinner.el"  user-emacs-directory))

;; Utility
(use-package crux)
(use-package hydra)
(use-package general)
(use-package posframe)

;; Allows you to find frequently used commands.
;; keyfreq-show shows command frequency
(use-package keyfreq
  :config (keyfreq-mode 1) (keyfreq-autosave-mode 1)
  :custom
  (keyfreq-excluded-commands
   '(evil-backward-char
     evil-forward-char
     evil-previous-line
     evil-next-line
     save-buffer
     helm-M-x
     evil-insert
     evil-change
     keyboard-quit
     self-insert-command
     magit-next-line
     undo-tree-undo
     evil-delete
     helm-previous-line
     evil-repeat
     evil-insert-line
     ))
  )

(use-package smart-hungry-delete
  :defer nil ;; dont defer so we can add our functions to hooks
  :config (smart-hungry-delete-add-default-hooks)
  )

;; General
(use-package mu4e
  :custom
  (mu4e-maildir "~/.mail")
  (mu4e-refile-folder "/gmail/Archive")
  (mu4e-sent-folder "/gmail/Sent Mail")
  (mu4e-drafts-folder "/gmail/Drafts")
  )
(use-package org-mu4e :custom (org-mu4e-link-query-in-headers-mode nil))

(use-package skeletor
  :custom (skeletor-project-directory "/home/jesse/dev/projects/active")
  :config
  (skeletor-define-template "~/.emacs.d/project-templates/latex"
    :title "Latex"
    :after-creation
    (lambda (dir)
      (skeletor-async-shell-command "make && make preview && make dev"))
  ))

(use-package try)
(use-package highlight-thing :hook (prog-mode-hook . highlight-thing-mode))
(use-package writegood-mode :hook (markdown-mode . writegood-mode))
(use-package org)
(use-package xclip :config (xclip-mode 1) :defer 1)
(use-package dumb-jump)
(use-package docker)
(use-package yasnippet :config (yas-global-mode 1))
(use-package ag)
(use-package expand-region :config (setq er/try-expand-list (append er/try-expand-list '(mark-paragraph mark-page))))
(use-package ranger :disabled)
(use-package chronos)
(use-package avy)
(use-package projectile :config (projectile-mode))
(use-package which-key :config (which-key-mode) (setq which-key-idle-delay 0.5))
(use-package lorem-ipsum)
(use-package loccur)
(use-package multiple-cursors)
(use-package smartparens
  :hook (after-init . smartparens-global-mode)
  :config
  (require 'smartparens-config)
  (sp-pair "=" "=" :actions '(wrap))
  (sp-pair "+" "+" :actions '(wrap))
  (sp-pair "<" ">" :actions '(wrap))
  (sp-pair "$" "$" :actions '(wrap)))

(use-package saveplace :hook (after-init . save-place-mode))

(use-package recentf
  :hook (after-init . recentf-mode)
  :init (setq-default recent-save-file "~/.emacs.d/recentf"))
(use-package hide-mode-line-mode)
(use-package rainbow-delimiters :hook (prog-mode . rainbow-delimiters-mode))
(use-package highlight-indent-guides
  :hook (prog-mode . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-method 'column)
  (highlight-indentation-blank-lines t)
  (highlight-indent-guides-auto-enabled nil)
  :config
  (set-face-background 'highlight-indent-guides-odd-face "color-233")
  (set-face-background 'highlight-indent-guides-even-face "color-233")
  (set-face-foreground 'highlight-indent-guides-character-face "color-233"))

;; Themes
(use-package sublime-themes)
(use-package blackboard-theme :defer t)
(use-package clues-theme :defer t)
(use-package monochrome-theme :defer t)
(use-package golden-ratio :config (golden-ratio-mode 1))

;; Aesthetics
(use-package fold-this)
(use-package beacon :init (beacon-mode 1) :config (setq beacon-color "red"))
(use-package origami)
(use-package olivetti)
(use-package linum-relative)
(use-package highlight)
(use-package insert-shebang)

;; Modes
(use-package nand2tetris
  :init (setq nand2tetris-core-base-dir "~/dev/projects/nand2tetris")
  :config (add-to-list 'auto-mode-alist '("\\.hdl\\'" . nand2tetris-mode))
  :mode ("\\.hdl\\'" . nand2tetris-mode))
(use-package pug-mode :mode ("\\.pug\\'" . pug-mode))
(use-package python-django :mode ("\\.py\\'" . python-mode))
(use-package markdown-mode :mode ("\\.md\\'" . markdown-mode))
(use-package tide :mode ("\\.ts\\'" . web-mode))
(use-package web-mode)
(use-package coffee-mode :mode ("\\.coffee\\'" . coffee-mode))

;; Evil
(use-package evil :config (evil-mode 1))
(use-package evil-collection
  :custom (evil-collection-setup-minibuffer t)
  :init (evil-collection-init))
(use-package evil-exchange :config (evil-exchange-install) :requires (evil))
(use-package evil-surround :config (global-evil-surround-mode 1) :requires (evil))

;; Helm
(use-package helm
  :config (setq helm-follow-mode-persistent t)
  :general
  ("C-h a" 'helm-apropos))

(use-package helm-swoop :requires (helm))
(use-package helm-mode-manager :requires (helm) :disabled)
(use-package helm-chronos :init (setq helm-chronos-standard-timers '( "25/Work For 25 Min" "")) :requires (helm chronos))
(use-package helm-c-yasnippet)
(use-package helm-themes :requires (helm))
(use-package helm-ag :requires (helm ag))
(use-package helm-projectile :requires (helm projectile) :config (helm-projectile-on))

;; Git
(use-package git-gutter
    :custom
    (git-gutter:modified-sign "~ ")
    (git-gutter:added-sign    "+ ")
    (git-gutter:deleted-sign  "- ")
    :config
    (global-git-gutter-mode +1))

(use-package git-timemachine) ;; Interactive view of all git tracked revisions for a buffer. Very cool

(use-package gist)
(use-package magit
  :custom
  (magit-stage-all-confirm nil)
  (magit-unstage-all-confirm nil))

;; Misc
(use-package elfeed
  :config
  (setq elfeed-feeds
        '(("http://nullprogram.com/feed/" blog emacs)
          "http://www.50ply.com/atom.xml"  ; no autotagging
          ("http://nedroid.com/feed/" webcomic)))
  )

;; lsp
(use-package lsp-mode
  :config
  (require 'lsp-clients)
  (add-hook 'python-mode-hook 'lsp)
  (add-hook 'shell-mode-hook 'lsp)
  (add-hook 'web-mode-hook 'lsp))

(provide 'packages)
;;; packages.el ends here
