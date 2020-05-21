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
 '(ansi-color-names-vector ["white" "#303030" "#b3b3b3" "#606060"])
 '(company-idle-delay 1)
 '(company-minimum-prefix-length 3)
 '(company-tabnine-max-num-results 9)
 '(evil-collection-setup-minibuffer t)
 '(gac-ask-for-summary-p t t)
 '(git-commit-major-mode 'org-mode)
 '(git-gutter:added-sign " + ")
 '(git-gutter:deleted-sign " - ")
 '(git-gutter:modified-sign " ~ ")
 '(highlight-indent-guides-auto-enabled nil)
 '(highlight-indent-guides-method 'column)
 '(highlight-indentation-blank-lines t t)
 '(indium-chrome-executable "google-chrome-stable")
 '(keyfreq-excluded-commands
   '(evil-append evil-backward-char evil-change evil-delete evil-delete evil-forward-char evil-insert evil-insert-line evil-next-line evil-normal-state evil-open-below evil-previous-line evil-repeat helm-M-x helm-next-line helm-previous-line keyboard-quit magit-next-line magit-previous-line minibuffer-complete my/quit next-line org-self-insert-command save-buffer self-insert-command self-insert-command undo-tree-undo) t)
 '(ledger-clear-whole-transactions t t)
 '(linum-format "%d")
 '(linum-relative-backend 'display-line-numbers-mode)
 '(magit-stage-all-confirm nil t)
 '(magit-unstage-all-confirm nil t)
 '(org-confirm-babel-evaluate nil)
 '(package-selected-packages
   '(paper-theme js-import dired-subtree emr rainbow-mode almost-mono-themes purp-theme dracula-theme yankpad yaml-mode xclip writegood-mode which-key webpaste web-mode use-package try tide sublime-themes smartparens smart-semicolon smart-hungry-delete smart-backspace skeletor rust-mode restart-emacs ranger rainbow-delimiters python-django pug-mode prettier-js posframe origami org-sticky-header olivetti ob-rust npm-mode nord-theme nodejs-repl nand2tetris monochrome-theme mermaid-mode magit-todos lsp-ui lorem-ipsum loccur linum-relative ledger-mode keyfreq js-doc insert-shebang indium hydra highlight-thing highlight-indent-guides highlight hide-mode-line helm-themes helm-swoop helm-projectile helm-eww helm-dash helm-chronos helm-c-yasnippet helm-ag google-translate golden-ratio gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-gutter git-auto-commit-mode gist general fold-this focus expand-region evil-surround evil-exchange evil-collection emmet-mode elfeed dumb-jump drag-stuff dockerfile-mode docker devdocs dart-mode crux company-tabnine company-lsp coffee-mode clues-theme bug-hunter blackboard-theme beacon auto-package-update ag ace-window))
 '(skeletor-project-directory "/home/jesse/dev/projects/active")
 '(webpaste-paste-confirmation t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(dired-subtree-depth-1-face ((t (:background "undefinded-bg"))))
 '(dired-subtree-depth-2-face ((t (:background "undefinded-bg"))))
 '(flycheck-warning ((t (:underline "dim gray" :weight extra-bold))))
 '(font-lock-constant-face ((t (:background "undefinded-bg"))))
 '(font-lock-function-name-face ((t (:background "undefinded-bg"))))
 '(font-lock-keyword-face ((t (:background "undefinded-bg"))))
 '(font-lock-preprocessor-face ((t (:background "undefinded-bg"))))
 '(font-lock-string-face ((t (:background "undefinded-bg"))))
 '(font-lock-type-face ((t (:background "undefinded-bg"))))
 '(font-lock-variable-name-face ((t (:background "undefinded-bg"))))
 '(helm-selection ((t (:background "undefinded-bg" :underline t))))
 '(helm-source-header ((t (:background "undefinded-bg" :weight bold))))
 '(highlight ((t (:background "undefinded-bg" :underline t))))
 '(highlight-thing ((t (:inherit 'highlight))))
 '(hl-line ((t (:extend t :background "undefinded-bg" :underline t))))
 '(magit-diff-added ((t (:extend t :background "undefinded-bg"))))
 '(magit-diff-added-highlight ((t (:extend t :background "undefinded-bg"))))
 '(magit-diff-base ((t (:extend t :background "undefinded-bg"))))
 '(magit-diff-base-highlight ((t (:extend t :background "undefinded-bg"))))
 '(magit-diff-context-highlight ((t (:extend t :background "undefinded-bg"))))
 '(magit-diff-hunk-heading ((t (:extend t :background "undefinded-bg"))))
 '(magit-diff-hunk-heading-highlight ((t (:extend t :background "undefinded-bg"))))
 '(magit-diff-removed ((t (:extend t :background "undefinded-bg"))))
 '(magit-diff-removed-highlight ((t (:extend t :background "undefinded-bg"))))
 '(magit-section-highlight ((t (:extend t :background "undefinded-bg"))))
 '(mode-line ((t (:background "undefinded-bg" :foreground "#000000"))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.0))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
 '(show-paren-match ((t (:background "undefinded-bg" :underline t :weight bold)))))
