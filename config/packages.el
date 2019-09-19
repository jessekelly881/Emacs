;; Package Install And Base Config

;; General purpose - Core

;; General purpose - Non core
(use-package xclip :config (xclip-mode 1) :defer 1)
(use-package beacon :init (beacon-mode 1) :config (setq beacon-color "red"))
(use-package dumb-jump)
(use-package docker)
(use-package yasnippet :config (yas-global-mode 1))
(use-package ag)
(use-package golden-ratio :config (golden-ratio-mode 1))
(use-package expand-region :config (setq er/try-expand-list (append er/try-expand-list '(mark-paragraph mark-page))))
(use-package general)
(use-package ranger :disabled)
(use-package chronos)
(use-package avy)
(use-package hydra)
(use-package general)
(use-package projectile :config (projectile-mode))
(use-package linum-relative)
(use-package which-key :config (which-key-mode) (setq which-key-idle-delay 0.5))
(use-package magit)
(use-package crux)
(use-package origami)
(use-package olivetti)
(use-package lorem-ipsum)
(use-package company)
(use-package coffee-mode)
(use-package auto-complete :config (ac-config-default))
(use-package evil :config (evil-mode 1))
(use-package blackboard-theme :defer t)
(use-package clues-theme :defer t)
(use-package sublime-themes)
(use-package monochrome-theme :defer t)
(use-package highlight)
(use-package fold-this)
(use-package loccur)
(use-package gist)
(use-package multiple-cursors)

;; Mode Specific
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
