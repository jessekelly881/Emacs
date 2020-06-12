;; -*- lexical-binding: t; -*-
;; Package Install And Base Config

;; Start server on init.
(use-package server
  :ensure nil
  :hook (after-init . server-start))

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

(use-package smart-hungry-delete
  :defer nil ;; dont defer so we can add our functions to hooks
  :config (smart-hungry-delete-add-default-hooks)
  )

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
(use-package highlight-thing
  :config (global-highlight-thing-mode)
  :hook
  (prog-mode . highlight-thing-mode)
  )

(use-package writegood-mode
  :hook
  (markdown-mode . writegood-mode)
  (org-mode . writegood-mode)
  )

(use-package org
  :custom
  (org-confirm-babel-evaluate nil)
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (python . t)
     (shell  . t)
     (rust   . t)
     )))

(use-package org-sticky-header
  :defer t
  :requires (org)
  :hook (org-mode . org-sticky-header-mode))

(use-package xclip :config (xclip-mode 1) :defer 1)
(use-package dumb-jump)
(use-package docker)
(use-package yasnippet
  :config
  (yas-global-mode 1)
  (add-to-list 'hippie-expand-try-functions-list  'yas-hippie-try-expand t))

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
(use-package hide-mode-line)
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

;; Theme Collection
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

(use-package golden-ratio :config (golden-ratio-mode 1))

;; Aesthetics
(use-package fold-this)
(use-package beacon :init (beacon-mode 1) :config (setq beacon-color "red"))
(use-package origami)
(use-package olivetti)
(use-package linum-relative
  :custom
  (linum-format " %d ")
  (linum-relative-backend 'display-line-numbers-mode)
  :hook
  (prog-mode . linum-relative-on)
  )
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

(use-package tide
  :hook (typescript-mode  'tide-mode))

(use-package web-mode)
(use-package coffee-mode :mode ("\\.coffee\\'" . coffee-mode))

;; Evil
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

;; Helm
(use-package helm
  :config (setq helm-follow-mode-persistent t)
  :general
  ("C-h a"   'helm-apropos)
  ("M-x"     'helm-M-x)
  ("C-x C-f" 'helm-find-files))

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
  (magit-unstage-all-confirm nil)
  (git-commit-major-mode 'org-mode)
  :hook
  (git-commit-mode . evil-normal-state)
  )

(use-package magit-todos
  :hook (after-init . magit-todos-mode))
(use-package gitignore-mode)
(use-package gitattributes-mode)
(use-package gitconfig-mode)

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
  :init
  :defer t
  :config
  (require 'lsp-clients)
  (add-to-list 'lsp-language-id-configuration '(js-mode . "typescriptreact"))
  :hook
  (latex-mode      . lsp)
  (python-mode     . lsp)
  (c-mode          . lsp)
  (c++-mode        . lsp)
  (shell-mode      . lsp)
  (web-mode        . lsp)
  (rust-mode       . lsp)
  (typescript-mode . lsp)
  (js-mode         . lsp ))

(use-package lsp-ui)

;; Company
(use-package company
  :hook
  (after-init . global-company-mode)
  :config
  (add-to-list 'company-backends 'company-files)
  (add-to-list 'company-backends 'company-yasnippet t)
  :custom
  (company-idle-delay 0.5)
  (company-minimum-prefix-length 3)
  )

(use-package company-lsp)

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

(use-package ace-window)

(use-package nodejs-repl)

;; This mode allows to paste whole buffers or parts of buffers to pastebin-like services.
;; It supports more than one service and will failover if one service fails
(use-package webpaste
  :custom
  (webpaste-paste-confirmation t)
  )

(use-package yankpad
  :config
  (add-to-list 'hippie-expand-try-functions-list #'yankpad-expand))

(use-package drag-stuff)
(use-package restart-emacs)
(use-package yaml-mode)
(use-package smart-semicolon
  :hook
  (prog-mode . smart-semicolon-mode)
  )

(use-package focus)

(use-package ledger-mode
  :mode ("\\.ledger\\'")
  :custom (ledger-clear-whole-transactions t))

(use-package nord-theme)
(use-package rust-mode)
(use-package ob-rust)

(use-package auto-package-update)
(use-package dart-mode)
(use-package dockerfile-mode)

(use-package js2-mode
  :hook
  (js-mode . js2-minor-mode))

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

(use-package git-auto-commit-mode
  :hook
  (fundamental-mode . git-auto-commit-mode)
  :custom
  (gac-ask-for-summary-p t))

(use-package google-translate)

(use-package flycheck
  :init (global-flycheck-mode))

(use-package flyspell ;; depends on aspell; yay -S aspell
  :init (global-flyspell-mode))

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

  :hook
  (go-mode . go-doc)
  (js-mode . js-doc)
  (python-mode . python-doc)
  (scss-mode . scss-doc)
  )

(use-package company-tabnine
  :defer 1
  :custom
  (company-tabnine-max-num-results 9)
  :hook
  (lsp-after-open . (lambda ()
                      (setq company-tabnine-max-num-results 3)
                      (add-to-list 'company-transformers 'company//sort-by-tabnine t)
                      (add-to-list 'company-backends '(company-lsp :with company-tabnine :separate))))
  (kill-emacs . company-tabnine-kill-process)
  :config
  ;; Enable TabNine on default
  (add-to-list 'company-backends #'company-tabnine)

  ;; Integrate company-tabnine with lsp-mode
  (defun company//sort-by-tabnine (candidates)
    (if (or (functionp company-backend)
           (not (and (listp company-backend) (memq 'company-tabnine company-backend))))
        candidates
      (let ((candidates-table (make-hash-table :test #'equal))
            candidates-lsp
            candidates-tabnine)
        (dolist (candidate candidates)
          (if (eq (get-text-property 0 'company-backend candidate)
                 'company-tabnine)
              (unless (gethash candidate candidates-table)
                (push candidate candidates-tabnine))
            (push candidate candidates-lsp)
            (puthash candidate t candidates-table)))
        (setq candidates-lsp (nreverse candidates-lsp))
        (setq candidates-tabnine (nreverse candidates-tabnine))
        (nconc (seq-take candidates-tabnine 3)
               (seq-take candidates-lsp 6))))))


(use-package indium
  :custom (indium-chrome-executable "google-chrome-stable")
  :hook (js-mode . indium-interaction-mode))

(use-package js-doc)
(use-package npm-mode)

(use-package rainbow-mode)

(use-package dired-subtree :ensure t
  :after dired
  :config
  (bind-key "<tab>" #'dired-subtree-toggle dired-mode-map)
  (bind-key "<backtab>" #'dired-subtree-cycle dired-mode-map))

(provide 'packages)
;;; packages.el ends here
