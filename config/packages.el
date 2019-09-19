;; Package Install And Base Config
(use-package helm :config (setq helm-follow-mode-persistent t))
(use-package xclip :config (xclip-mode 1) :defer 1)
(use-package helm-swoop)
(use-package beacon :init (beacon-mode 1) :config (setq beacon-color "red"))
(use-package dumb-jump :defer t)
(use-package helm-mode-manager :defer t)
(use-package docker :defer t)
(use-package yasnippet :config (yas-global-mode 1) :defer t)
(use-package helm-c-yasnippet :defer t)
(use-package ag :defer t)
(use-package helm-ag :defer t)
(use-package golden-ratio :config (golden-ratio-mode 1) :defer t)
(use-package expand-region :config (setq er/try-expand-list (append er/try-expand-list '(mark-paragraph mark-page))))
(use-package general)
(use-package ranger :defer t)
(use-package chronos :defer t)
(use-package helm-chronos :init (setq helm-chronos-standard-timers '( "25/Work For 25 Min" "")) :defer t)
(use-package evil-exchange :config (evil-exchange-install))
(use-package evil-surround :config (global-evil-surround-mode 1))
(use-package avy)
(use-package hydra)
(use-package evil :config (evil-mode 1))
(use-package general)
(use-package projectile :config (projectile-mode))
(use-package linum-relative)
(use-package which-key :config (which-key-mode) (setq which-key-idle-delay 0.5))
(use-package magit :defer t)
(use-package web-mode)
(use-package crux)
(use-package origami :defer t)
(use-package olivetti :defer t)
(use-package lorem-ipsum :defer t)
(use-package markdown-mode :mode ("\\.md\\'" . markdown-mode))
(use-package company)
(use-package coffee-mode)
(use-package auto-complete :config (ac-config-default))
(use-package evil :config (evil-mode 1))
(use-package blackboard-theme :defer t)
(use-package clues-theme :defer t)
(use-package sublime-themes)
(use-package monochrome-theme :defer t)
(use-package python-django :mode ("\\.py\\'" . python-mode))
(use-package helm-themes :defer t)
(use-package highlight :defer t)
(use-package fold-this :defer t)
(use-package loccur)
(use-package tide :mode ("\\.ts\\'" . web-mode))
(use-package elpy :config (elpy-enable) :mode ("\\.py\\'" . python-mode))
(use-package gist :defer t)
(use-package pug-mode :mode ("\\.pug\\'" . pug-mode))
(use-package nand2tetris
  :init (setq nand2tetris-core-base-dir "~/dev/projects/nand2tetris")
  :config (add-to-list 'auto-mode-alist '("\\.hdl\\'" . nand2tetris-mode))
  :mode ("\\.hdl\\'" . nand2tetris-mode))
(use-package multiple-cursors :defer t)


(provide 'packages)
;;; packages.el ends here
