;; -*- lexical-binding: t; -*-
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(load (expand-file-name "config/core.el" user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(company-idle-delay 0)
 '(custom-safe-themes
   '("39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "43b219a31db8fddfdc8fdbfdbd97e3d64c09c1c9fdd5dff83f3ffc2ddb8f0ba0" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))
 '(evil-collection-setup-minibuffer t)
 '(fringe-mode 10 nil (fringe))
 '(git-commit-major-mode 'org-mode)
 '(git-gutter:added-sign "+ ")
 '(git-gutter:deleted-sign "- ")
 '(git-gutter:modified-sign "~ ")
 '(highlight-indent-guides-auto-enabled nil)
 '(highlight-indent-guides-method 'column)
 '(highlight-indentation-blank-lines t t)
 '(keyfreq-excluded-commands
   '(evil-append evil-backward-char evil-change evil-delete evil-delete evil-forward-char evil-insert evil-insert-line evil-next-line evil-normal-state evil-open-below evil-previous-line evil-repeat helm-M-x helm-next-line helm-previous-line keyboard-quit magit-next-line magit-previous-line minibuffer-complete my/quit next-line org-self-insert-command save-buffer self-insert-command self-insert-command undo-tree-undo) t)
 '(ledger-clear-whole-transactions t t)
 '(ledger-reports
   '(("Balance" "ledger -f /home/jesse/docs/personal/accounting/transactions.ledger balance Assets Liabilities")
     ("Worth" "ledger -f 2019.ledger money.ledger balance Assets Liabilities")
     ("NetWorth" "ledger -f money.ledger balance Assets Liabilities")
     ("tset" "ledger ")
     ("bal" "%(binary) -f %(ledger-file) bal")
     ("reg" "%(binary) -f %(ledger-file) reg")
     ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
     ("account" "%(binary) -f %(ledger-file) reg %(account)")))
 '(linum-format " %6d ")
 '(linum-relative-backend 'display-line-numbers-mode)
 '(magit-diff-arguments '("--ignore-all-space" "--no-ext-diff" "--stat"))
 '(magit-diff-section-arguments '("--ignore-all-space" "--no-ext-diff"))
 '(magit-stage-all-confirm nil t)
 '(magit-unstage-all-confirm nil t)
 '(main-line-color1 "#222232")
 '(main-line-color2 "#333343")
 '(mu4e-drafts-folder "/gmail/Drafts" t)
 '(mu4e-maildir "~/.mail" t)
 '(mu4e-refile-folder "/gmail/Archive" t)
 '(mu4e-sent-folder "/gmail/Sent Mail" t)
 '(org-confirm-babel-evaluate nil)
 '(org-ellipsis "  .")
 '(org-mu4e-link-query-in-headers-mode nil t)
 '(package-selected-packages
   '(prettier-js indium clojure-mode js-doc js-mode dart-server dart-mode auto-package-update ob-rust togetherly gitconfig-mode gitattributes-mode gitignore-mode magit-todos rust-mode ledger-mode htmlize fancy-narrow smart-semicolon restart-emacs drag-stuff move-text yankpad forge python-black pyimpsort impatient-mode simple-httpd hide-mode-line-mode org-mu4e mu4e smart-backspace evil-dvorak js2-mode hippie-expand-slime smart-tab ox-twbs lsp-ui xclip company-lsp highlight-indent-guides lsp-python-ms lsp-python spinner borg lsp-mode elfeed git-timemachine smart-hungry-delete keyfreq evil-mc dashboard skeletor highlight-thing writegood-mode try nlinum-hl nlinum-relative evil-collection evil-magit nord-theme fill-column-indicator org-link-minor-mode org-plus-contrib rainbow-delimiters hide-mode-line insert-shebang google-translate posframe smartparens all-the-icons beacon neotree gist dumb-jump loccur hyperbole golden-ratio go-mode go yaml-mode origami web-mode dired-sidebar helm-projectile emmet-mode docker symbol-overlay highlight highlight-symbol evil-surround evil-exchange monochrome-theme sublime-themes clues-theme blackboard-theme helm-themes crux dracula-theme git-gutter-fringe coffee-mode tide fish-mode telephone-line mark-multiple multiple-cursors nand2tetris helm-mode-manager helm-swoop helm-chronos chronos olivetti lorem-ipsum expand-region helm-c-yasnippet helm-ag ag magit markdown-mode pug-mode avy elpy yasnippet which-key smart-mode-line linum-relative yas hydra helm use-package "use-package" ##))
 '(powerline-color1 "#222232")
 '(powerline-color2 "#333343")
 '(safe-local-variable-values
   '((eval add-hook 'after-save-hook 'org-html-export-to-html nil t)
     (org-html-htmlize-output-type . css)
     (eval message "A test")))
 '(selective-display-ellipses t)
 '(send-mail-function 'mailclient-send-it)
 '(skeletor-project-directory "/home/jesse/dev/projects/active")
 '(truncate-lines t)
 '(webpaste-paste-confirmation t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(avy-background-face ((t nil)))
 '(avy-goto-char-timer-face ((t (:foreground "color-52" :underline t :weight bold))))
 '(avy-lead-face ((t (:background "undefinded-bg" :foreground "color-52" :underline t :weight bold))))
 '(avy-lead-face-0 ((t (:background "undefinded-bg" :foreground "color-52" :underline t :weight bold))))
 '(avy-lead-face-1 ((t (:background "undefinded-bg" :foreground "color-52" :underline t :weight bold))))
 '(avy-lead-face-2 ((t (:background "undefinded-bg" :foreground "color-52" :underline t :weight bold))))
 '(company-scrollbar-bg ((t (:background "white" :foreground "white"))))
 '(company-scrollbar-fg ((t (:background "blue" :foreground "blue"))))
 '(company-tooltip ((t (:background "white" :foreground "blue" :weight bold))))
 '(company-tooltip-common ((t (:foreground "blue" :underline t :weight semi-bold))))
 '(company-tooltip-common-selection ((t (:background "blue" :foreground "white" :underline t))))
 '(company-tooltip-selection ((t (:background "blue" :foreground "white" :weight bold))))
 '(flycheck-warning ((t (:foreground "green" :underline t :weight bold))))
 '(flymake-error ((t (:underline t))))
 '(flymake-note ((t nil)))
 '(font-lock-builtin-face ((t (:foreground "magenta"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "color-241"))))
 '(font-lock-comment-face ((t (:background "unspecified-bg" :foreground "color-241"))))
 '(font-lock-constant-face ((t (:foreground "white"))))
 '(font-lock-function-name-face ((t (:foreground "blue"))))
 '(font-lock-keyword-face ((t (:foreground "magenta"))))
 '(font-lock-type-face ((t (:foreground "green"))))
 '(font-lock-variable-name-face ((t (:foreground "white"))))
 '(fringe ((t nil)))
 '(git-gutter:added ((t (:background "undefinded-bg" :foreground "green"))))
 '(git-gutter:deleted ((t (:background "undefinded-bg" :foreground "red"))))
 '(git-gutter:modified ((t (:background "undefinded-bg" :foreground "yellow"))))
 '(header-line ((t (:inherit mode-line :background "unspecified-bg" :foreground "#EEEEEE" :box nil))))
 '(helm-M-x-key ((t (:foreground "green" :underline t))))
 '(helm-candidate-number ((t (:background "color-16" :foreground "white"))))
 '(helm-grep-match ((t (:foreground "brightwhite" :weight bold))))
 '(helm-header ((t (:inherit header-line :background "color-16" :foreground "brightwhite"))))
 '(helm-match ((t (:foreground "brightwhite" :weight bold))))
 '(helm-minibuffer-prompt ((t (:foreground "green"))))
 '(helm-selection ((t (:background "color-233" :foreground "brightwhite" :underline t))))
 '(helm-selection-line ((t (:background "undefinded-bg" :foreground "color-52" :weight bold))))
 '(helm-separator ((t (:background "color-233" :foreground "white"))))
 '(helm-source-header ((t (:background "color-233" :foreground "white" :box (:line-width 1 :style released-button) :underline nil :weight bold))))
 '(helm-swoop-target-line-face ((t (:background "unspecified-bg" :foreground "color-52"))))
 '(helm-swoop-target-word-face ((t (:background "unspecified-bg" :foreground "color-52" :underline t :weight bold))))
 '(highlight ((t (:background "   unspecified-bg" :foreground "white" :weight ultra-bold))))
 '(highlight-indent-guides-even-face ((t (:background "color-234"))))
 '(highlight-indent-guides-odd-face ((t (:background "color-234"))))
 '(highlight-indent-guides-stack-even-face ((t (:background "color-234"))))
 '(highlight-indent-guides-stack-odd-face ((t (:background "color-234"))))
 '(highlight-indent-guides-top-even-face ((t (:background "color-234"))))
 '(highlight-indent-guides-top-odd-face ((t (:background "color-234"))))
 '(highlight-indentation-face ((t (:background "color-234"))))
 '(highlight-thing ((t (:inherit 'highlight))))
 '(hl-line ((t (:background "undefinded-bg" :underline t))))
 '(isearch ((t (:background "undefinded-bg" :foreground "color-52" :weight bold))))
 '(linum ((t (:background "undefinded-bg" :foreground "green"))))
 '(linum-relative-current-face ((t (:background "unspecified-bg" :foreground "brightwhite" :weight bold))))
 '(lsp-face-highlight-write ((t (:inherit highlight))))
 '(lsp-ui-doc-background ((t (:background "undefinded-bg" :weight bold))))
 '(lsp-ui-sideline-symbol-info ((t (:height 0.99))))
 '(magit-blame-highlight ((t (:background "undefinded-bg" :foreground "yellow"))))
 '(magit-diff-added ((t (:background "undefinded-bg" :foreground "color-22"))))
 '(magit-diff-added-highlight ((t (:background "undefinded-bg" :foreground "color-22" :weight bold))))
 '(magit-diff-context-highlight ((t (:background "undefinded-bg" :foreground "red"))))
 '(magit-diff-hunk-heading ((t (:background "undefinded-bg" :foreground "red"))))
 '(magit-diff-hunk-heading-highlight ((t (:background "undefinded-bg" :foreground "red"))))
 '(magit-diff-removed ((t (:background "undefinded-bg" :foreground "#aa2222"))))
 '(magit-diff-removed-highlight ((t (:background "undefinded-bg" :foreground "#aa2222" :weight bold))))
 '(magit-section-highlight ((t (:background "undefinded-bg" :foreground "red"))))
 '(markdown-comment-face ((t nil)))
 '(minibuffer-prompt ((t (:foreground "green"))))
 '(mode-line ((t (:inherit variable-pitch :background "color-233" :foreground "brightwhite" :box nil :weight bold))))
 '(mode-line-inactive ((t (:inherit mode-line :background "color-233" :foreground "color-244"))))
 '(org-date ((t (:foreground "white"))))
 '(org-done ((t (:foreground "color-240" :weight bold))))
 '(org-drawer ((t (:foreground "blue"))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.0))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
 '(org-meta-line ((t (:foreground "color-235"))))
 '(org-special-keyword ((t (:foreground "blue"))))
 '(org-table ((t (:foreground "blue"))))
 '(popup-face ((t (:inherit default :background "brightwhite" :foreground "green"))))
 '(popup-menu-selection-face ((t (:inherit default :background "green" :foreground "brightwhite"))))
 '(popup-tip-face ((t (:background "undefinded-bg" :foreground "green" :weight extra-bold))))
 '(rainbow-delimiters-base-face ((t (:inherit nil :weight bold))))
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "cyan"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "green"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "yellow"))))
 '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "blue"))))
 '(rainbow-delimiters-mismatched-face ((t (:inherit rainbow-delimiters-unmatched-face))))
 '(region ((t (:background "#1D1F21" :weight bold))))
 '(ruler-mode-default ((t (:inherit default :background "undefinded-bg" :foreground "blue"))))
 '(show-paren-match ((t (:background "unspecified-bg" :foreground "color-52" :weight bold))))
 '(tab-bar ((t (:background "undefinded-bg"))))
 '(web-mode-current-column-highlight-face ((t (:background "blue"))))
 '(writegood-duplicates-face ((t (:background "undefinded-bg" :underline t :weight bold))))
 '(writegood-passive-voice-face ((t (:background "undefinded-bg" :weight bold))))
 '(writegood-weasels-face ((t (:background "undefinded-bg" :weight bold)))))
(put 'narrow-to-region 'disabled nil)
