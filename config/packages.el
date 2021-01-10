;; -*- lexical-binding: t; -*-
;; Package Install And Base Config

;; Start server on init.

;; Elisp Libraries --------------------------------------------
(require 'ob-typescript)
(use-package crux)
(use-package hydra)
(use-package general)
(use-package posframe)
;; ------------------------------------------------------------

;; Core Packages ----------------------------------------------
(use-package server
  :ensure nil
  :hook (after-init . server-start))
(use-package auto-package-update)
(use-package restart-emacs)
(use-package try)
(use-package keyfreq
  ;; Allows you to find frequently used commands.
  ;; keyfreq-show shows command frequency

  :config (keyfreq-mode 1) (keyfreq-autosave-mode 1)
  :custom
  (keyfreq-excluded-commands
   '(
     evil-append
     evil-backward-char
     evil-change
     evil-delete
     evil-delete
     evil-forward-char
     evil-insert
     evil-insert-line
     evil-next-line
     evil-normal-state
     evil-open-below
     evil-previous-line
     evil-repeat
     helm-M-x
     helm-next-line
     helm-previous-line
     keyboard-quit
     magit-next-line
     magit-previous-line
     minibuffer-complete
     my/quit
     next-line
     org-self-insert-command
     save-buffer
     self-insert-command
     self-insert-command
     undo-tree-undo
     ))
  )
(use-package helm
  :config (setq helm-follow-mode-persistent t)
  :general
  ("C-h a"   'helm-apropos)
  ("M-x"     'helm-M-x)
  ("C-x C-f" 'helm-find-files))
(use-package chronos)
(use-package helm-chronos :init (setq helm-chronos-standard-timers '( "25/Work For 25 Min" "")) :requires (helm chronos))
(use-package which-key :config (which-key-mode) (setq which-key-idle-delay 0.5))
;; ------------------------------------------------------------


;; Aesthetics -------------------------------------------------
;;;; Theme Collection
(use-package sublime-themes)
(use-package blackboard-theme)
(use-package clues-theme)
(use-package monochrome-theme)
(use-package paper-theme)
(use-package zenburn-theme)
(use-package solarized-theme)
(use-package spacemacs-theme)
(use-package ample-theme)
(use-package plan9-theme)
(use-package anti-zenburn-theme)
(use-package espresso-theme)
(use-package soft-stone-theme)
(use-package faff-theme)
(use-package subatomic-theme)
(use-package tango-plus-theme)
(use-package github-theme)
(use-package nord-theme)

(use-package golden-ratio :config (golden-ratio-mode 1))
(use-package hide-mode-line)
(use-package fold-this)
(use-package fancy-narrow)
(use-package beacon :init (beacon-mode 1) :config (setq beacon-color "red"))
(use-package origami)
(use-package olivetti)
(use-package highlight)
(use-package helm-themes :requires (helm))
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
(use-package focus)
;; ------------------------------------------------------------

;; Navigation -------------------------------------------------
;;;; Avy/Ace
(use-package avy)
(use-package ace-window)

(use-package saveplace :hook (after-init . save-place-mode))
(use-package dumb-jump)
(use-package ag)
(use-package helm-swoop :requires (helm))
(use-package helm-ag :requires (helm ag))
(use-package recentf
  :hook (after-init . recentf-mode)
  :init (setq-default recent-save-file "~/.emacs.d/recentf"))
(use-package loccur)
;; ------------------------------------------------------------

;; Editing ----------------------------------------------------
;;;; Evil
(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))
(use-package evil-collection
  :requires (evil)
  :custom (evil-collection-setup-minibuffer t)
  :init (evil-collection-init))
(use-package evil-exchange :config (evil-exchange-install) :requires (evil))
(use-package evil-surround :config (global-evil-surround-mode 1) :requires (evil))

;;;; lsp
(use-package lsp-mode
  :init
  :defer t
  :config
  (require 'lsp-clients)
  (add-to-list 'lsp-language-id-configuration '(js-mode . "typescriptreact"))
  (add-to-list 'lsp-language-id-configuration '(typescript-mode . "typescriptreact"))
  :hook
  (prog-mode . lsp))
(use-package lsp-ui)

;;;; Company
(use-package company
  :hook
  (after-init . global-company-mode)
  :config
  (add-to-list 'company-backends 'company-files)
  (add-to-list 'company-backends 'company-yasnippet t)
  :custom
  (company-idle-delay 0.5))

;;;; Yasnippet
(use-package yasnippet
  :config
  (yas-global-mode 1)
  (add-to-list 'hippie-expand-try-functions-list  'yas-hippie-try-expand t))
(use-package helm-c-yasnippet)
(use-package yankpad
  :config
  (add-to-list 'hippie-expand-try-functions-list #'yankpad-expand))

(use-package writegood-mode
  :hook
  (markdown-mode . writegood-mode)
  (org-mode . writegood-mode)
  )
(use-package multiple-cursors)
(use-package hippie-exp
  :config
  (setq-default
   hippie-expand-try-functions-list
   '(
     try-expand-all-abbrevs
     try-expand-dabbrev-visible
     try-expand-dabbrev
     try-expand-dabbrev-all-buffers
     try-expand-dabbrev-from-kill
     try-complete-file-name-partially
     try-complete-file-name
     try-expand-list
     try-expand-line
     try-complete-lisp-symbol-partially
     try-complete-lisp-symbol
     )))
(use-package smart-backspace)
(use-package emmet-mode
  :defer t
  :config
  (add-to-list 'hippie-expand-try-functions-list  'emmet-hippie-try-expand-line t)
  :hook
  (web-mode         . emmet-mode)
  (scss-mode        . emmet-mode)
  (css-mode         . emmet-mode)
  (js2-mode         . emmet-mode)
  (js-mode          . emmet-mode)
  (typescript-mode  . emmet-mode)
  )
(use-package linum-relative
  :custom
  (linum-format " %d  ")
  (linum-relative-backend 'display-line-numbers-mode)
  :hook
  (prog-mode . linum-relative-on)
  )
(use-package flycheck
  :init (global-flycheck-mode))
(use-package flyspell ;; depends on aspell; yay -S aspell
  :init (global-flyspell-mode))
(use-package xclip :config (xclip-mode 1) :defer 1)
(use-package smart-hungry-delete
  :defer nil ;; dont defer so we can add our functions to hooks
  :config (smart-hungry-delete-add-default-hooks)
  )
(use-package smart-semicolon
  :hook
  (prog-mode . smart-semicolon-mode)
  )
(use-package rainbow-mode)
(use-package rainbow-delimiters :hook (prog-mode . rainbow-delimiters-mode))
(use-package highlight-thing
  :config (global-highlight-thing-mode)
  :hook
  (prog-mode . highlight-thing-mode)
  )
(use-package lorem-ipsum)
(use-package expand-region :config (setq er/try-expand-list (append er/try-expand-list '(mark-paragraph mark-page))))
(use-package smartparens
  :hook (after-init . smartparens-global-mode)
  :config
  (require 'smartparens-config)
  (sp-pair "=" "=" :actions '(wrap))
  (sp-pair "+" "+" :actions '(wrap))
  (sp-pair "<" ">" :actions '(wrap))
  (sp-pair "$" "$" :actions '(wrap)))
(use-package insert-shebang)
;; ------------------------------------------------------------

;; Project ----------------------------------------------------
;;;; Git
(use-package git-auto-commit-mode
  :hook
  (fundamental-mode . git-auto-commit-mode)
  :custom
  (gac-ask-for-summary-p t))
(use-package git-gutter
    :custom
    (git-gutter:modified-sign "~")
    (git-gutter:added-sign    "+")
    (git-gutter:deleted-sign  "-")
    :config
    (global-git-gutter-mode +1))
(use-package git-timemachine)
(use-package gist)
(use-package magit
  :custom
  (magit-stage-all-confirm nil)
  (magit-unstage-all-confirm nil)
  (git-commit-major-mode 'org-mode)
  :hook
  (git-commit-mode . evil-normal-state)
  )
(use-package magit-todos
  :hook (after-init . magit-todos-mode))
(use-package git-annex
  :custom (org-attach-git-annex-cutoff 10000))

;;;; Projective
(use-package projectile :config (projectile-mode))
(use-package helm-projectile :requires (helm projectile) :config (helm-projectile-on))

(use-package skeletor
  :custom (skeletor-project-directory "/home/jesse/dev/projects/active")
  :config
  (skeletor-define-template "~/.emacs.d/project-templates/latex"
    :title "Latex"
    :after-creation
    (lambda (dir)
      (skeletor-async-shell-command "make && make preview && make dev"))
  ))
;; ------------------------------------------------------------


;; Modes ------------------------------------------------------
;;;; Org Mode
(use-package org
  :custom
  (org-confirm-babel-evaluate nil)
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (python . t)
     (typescript . t)
     (js . t)
     (shell  . t)
     (rust   . t)
     (clojure   . t)
     )))
(use-package org-sticky-header
  :defer t
  :requires (org)
  :hook (org-mode . org-sticky-header-mode))
(use-package ob-rust)

(use-package pug-mode :mode ("\\.pug\\'" . pug-mode))
(use-package tide
  :hook (typescript-mode  'tide-mode))
(use-package web-mode)
(use-package coffee-mode :mode ("\\.coffee\\'" . coffee-mode))
(use-package markdown-mode :mode ("\\.md\\'" . markdown-mode))
(use-package clojure-mode
  :custom
  (clojure-indent-style 'always-indent))
(use-package haskell-mode)
(use-package nand2tetris
  :init (setq nand2tetris-core-base-dir "~/dev/projects/nand2tetris")
  :config (add-to-list 'auto-mode-alist '("\\.hdl\\'" . nand2tetris-mode))
  :mode ("\\.hdl\\'" . nand2tetris-mode))
(use-package python-django :mode ("\\.py\\'" . python-mode))
(use-package dart-mode)
(use-package dockerfile-mode)
(use-package js2-mode
  :hook
  (js-mode . js2-minor-mode))
(use-package ledger-mode
  :mode ("\\.ledger\\'")
  :custom (ledger-clear-whole-transactions t))
(use-package rust-mode)
(use-package gitignore-mode)
(use-package gitattributes-mode)
(use-package gitconfig-mode)
(use-package yaml-mode)
(use-package elm-mode)

;;;; Mode utils
(use-package dired-subtree
  :after dired
  :config
  (bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
  (bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map))
(use-package dired-narrow
  :after dired
  :config
  (bind-key "/" #'dired-narrow dired-mode-map)
  )
(use-package indium
  :custom (indium-chrome-executable "google-chrome-stable")
  :hook (js-mode . indium-interaction-mode))
(use-package js-doc)
(use-package npm-mode)
(use-package nodejs-repl)
(use-package prettier-js
  :hook
  (js-mode . prettier-js-mode)
  (css-mode . prettier-js-mode)
  (scss-mode . prettier-js-mode)
  (yaml-mode . prettier-js-mode)
  (typescript-mode . prettier-js-mode)
  (markdown-mode . prettier-js-mode)
  :config
  (setq prettier-js-args '(
                           "--trailing-comma" "all"
                           "--tab-width" "4"
                           "--arrow-parens" "avoid"
                           "--jsx-bracket-same-line" "true"
                           )))
(use-package helm-mode-manager :requires (helm) :disabled)
(use-package ranger :disabled)
(use-package docker)
;; ------------------------------------------------------------

;; External Resources -----------------------------------------
(use-package google-translate)
(use-package helm-dash
  :config

  (defun go-doc ()
    (interactive)
    (setq-local dash-docs-docsets '("Go")))

  (defun js-doc ()
    (interactive)
    (setq-local dash-docs-docsets '("React" "CSS" "HTML" "Redux" "Ramda" "Express" "Ionic")))

  (defun python-doc ()
    (interactive)
    (setq-local dash-docs-docsets '("Python 3" "Django" "Flask" "SciPy")))

  (defun scss-doc ()
    (interactive)
    (setq-local dash-docs-docsets '("CSS" "Sass")))

  (defun clojure-doc ()
    (interactive)
    (setq-local dash-docs-docsets '("Clojure")))

  :hook
  (go-mode . go-doc)
  (js-mode . js-doc)
  (python-mode . python-doc)
  (scss-mode . scss-doc)
  (clojure-mode . clojure-doc)
  )
(use-package webpaste
  ;; This mode allows to paste whole buffers or parts of buffers to pastebin-like services.
  ;; It supports more than one service and will failover if one service fails
  :custom
  (webpaste-paste-confirmation t)
  )
(use-package elfeed
  :config
  (setq elfeed-feeds
        '(("http://nullprogram.com/feed/" blog emacs)
          "http://www.50ply.com/atom.xml"  ; no autotagging
          ("http://nedroid.com/feed/" webcomic)))
  )
;; ------------------------------------------------------------

(provide 'packages)
;;; packages.el ends here
