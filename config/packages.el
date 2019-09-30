;; Package Install And Base Config

;; Utility
(use-package crux)
(use-package hydra)
(use-package general)
(use-package posframe)

;; General
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
(use-package auto-complete :defer 2 :config (ac-config-default) (ac-flyspell-workaround) (setq ac-auto-show-menu 0.2))
(use-package jedi :config (add-hook 'python-mode-hook 'jedi:setup) (setq jedi:complete-on-dot t))
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
(use-package elpy :defer t :init (advice-add 'python-mode :before 'elpy-enable))
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

;; Git
(use-package git-gutter
    :custom
    (git-gutter:modified-sign "~ ")
    (git-gutter:added-sign    "+ ")
    (git-gutter:deleted-sign  "- ")
    :config
    (global-git-gutter-mode +1))

(use-package gist)
(use-package magit)

(provide 'packages)
;;; packages.el ends here
