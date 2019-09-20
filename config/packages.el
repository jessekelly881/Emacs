;; Package Install And Base Config

;; Utility
(use-package crux)
(use-package hydra)
(use-package general)

;; General
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
(use-package magit)
(use-package lorem-ipsum)
(use-package company)
(use-package auto-complete :config (ac-config-default))
(use-package loccur)
(use-package gist)
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

;; Modes
(use-package nand2tetris
  :init (setq nand2tetris-core-base-dir "~/dev/projects/nand2tetris")
  :config (add-to-list 'auto-mode-alist '("\\.hdl\\'" . nand2tetris-mode))
  :mode ("\\.hdl\\'" . nand2tetris-mode))
(use-package pug-mode :mode ("\\.pug\\'" . pug-mode))
(use-package python-django :mode ("\\.py\\'" . python-mode))
(use-package markdown-mode :mode ("\\.md\\'" . markdown-mode))
(use-package tide :mode ("\\.ts\\'" . web-mode))
(use-package elpy :config (elpy-enable) :mode ("\\.py\\'" . python-mode))
(use-package web-mode)
(use-package coffee-mode :mode ("\\.coffee\\'" . coffee-mode))

;; Evil
(use-package evil :config (evil-mode 1))
(use-package evil-exchange :config (evil-exchange-install) :requires (evil))
(use-package evil-surround :config (global-evil-surround-mode 1) :requires (evil))

;; Helm
(use-package helm :config (setq helm-follow-mode-persistent t))
(use-package helm-swoop :requires (helm))
(use-package helm-mode-manager :requires (helm) :disabled)
(use-package helm-chronos :init (setq helm-chronos-standard-timers '( "25/Work For 25 Min" "")) :requires (helm chronos))
(use-package helm-c-yasnippet :requires (helm yasnippet))
(use-package helm-themes :requires (helm))
(use-package helm-ag :requires (helm ag))


(provide 'packages)
;;; packages.el ends here
