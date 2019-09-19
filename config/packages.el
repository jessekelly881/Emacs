;; Package Install And Base Config
(use-package helm :config (setq helm-follow-mode-persistent t))
(use-package xclip :config (xclip-mode 1))
(use-package helm-swoop)
(use-package beacon :init (beacon-mode 1) :config (setq beacon-color "red"))
(use-package dumb-jump)
(use-package helm-mode-manager)
(use-package docker)
(use-package yasnippet :config (yas-global-mode 1))
(use-package helm-c-yasnippet)
(use-package ag)
(use-package helm-ag)
(use-package golden-ratio :config (golden-ratio-mode 1))
(use-package expand-region :config (setq er/try-expand-list (append er/try-expand-list '(mark-paragraph mark-page))))
(use-package general)
(use-package ranger)
(use-package chronos)
(use-package helm-chronos :init (setq helm-chronos-standard-timers '( "25/Work For 25 Min" "")))
(use-package evil-exchange :config (evil-exchange-install))
(use-package evil-surround :config (global-evil-surround-mode 1))
(use-package avy)
(use-package hydra)
(use-package evil :config (evil-mode 1))
(use-package general)
(use-package projectile :config (projectile-mode))
(use-package linum-relative)
(use-package which-key :config (which-key-mode) (setq which-key-idle-delay 0.5))
(use-package magit)
(use-package web-mode)
(use-package crux)
(use-package origami)
(use-package olivetti)
(use-package lorem-ipsum)
(use-package markdown-mode)
(use-package company)
(use-package coffee-mode)
(use-package auto-complete :config (ac-config-default))
(use-package evil :config (evil-mode 1))
(use-package blackboard-theme)
(use-package clues-theme)
(use-package sublime-themes)
(use-package monochrome-theme)
(use-package python-django)
(use-package helm-themes)
(use-package highlight)
(use-package fold-this)
(use-package loccur)
(use-package tide)
(use-package elpy :config (elpy-enable))
(use-package gist)
(use-package pug-mode)
(use-package nand2tetris
  :init (setq nand2tetris-core-base-dir "~/dev/projects/nand2tetris")
  :config (add-to-list 'auto-mode-alist '("\\.hdl\\'" . nand2tetris-mode)))
(use-package multiple-cursors)


(provide 'packages)
;;; packages.el ends here
