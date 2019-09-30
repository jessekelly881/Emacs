
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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
 '(custom-safe-themes
   (quote
    ("39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "43b219a31db8fddfdc8fdbfdbd97e3d64c09c1c9fdd5dff83f3ffc2ddb8f0ba0" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(evil-collection-setup-minibuffer t)
 '(git-gutter:added-sign "+ ")
 '(git-gutter:deleted-sign "- ")
 '(git-gutter:modified-sign "~ ")
 '(package-selected-packages
   (quote
    (highlight-thing writegood-mode try nlinum-hl nlinum-relative evil-collection jedi evil-magit nord-theme fill-column-indicator org-link-minor-mode org-plus-contrib rainbow-delimiters hide-mode-line insert-shebang google-translate posframe smartparens all-the-icons beacon neotree gist dumb-jump loccur hyperbole golden-ratio go-mode go yaml-mode origami web-mode dired-sidebar helm-projectile emmet-mode docker symbol-overlay highlight highlight-symbol evil-surround evil-exchange monochrome-theme sublime-themes clues-theme blackboard-theme helm-themes crux dracula-theme git-gutter-fringe coffee-mode company tide fish-mode telephone-line mark-multiple multiple-cursors nand2tetris helm-mode-manager helm-swoop helm-chronos chronos olivetti lorem-ipsum expand-region helm-c-yasnippet helm-ag ag magit markdown-mode pug-mode avy elpy yasnippet which-key smart-mode-line linum-relative yas hydra helm use-package "use-package" ##)))
 '(send-mail-function (quote mailclient-send-it))
 '(truncate-lines t))
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
 '(cursor ((t (:background "color-18" :weight bold))))
 '(flycheck-warning ((t (:foreground "green" :underline t :weight bold))))
 '(font-lock-comment-delimiter-face ((t (:inherit default :foreground "brightwhite"))))
 '(font-lock-comment-face ((t (:background "unspecified-bg" :foreground "brightgreen" :slant italic))))
 '(fringe ((t nil)))
 '(header-line ((t (:inherit mode-line :background "unspecified-bg" :foreground "#EEEEEE" :box nil))))
 '(helm-M-x-key ((t (:foreground "green" :underline t))))
 '(helm-candidate-number ((t (:background "color-16" :foreground "white"))))
 '(helm-grep-match ((t (:foreground "brightwhite" :weight bold))))
 '(helm-header ((t (:inherit header-line :background "color-16" :foreground "brightwhite"))))
 '(helm-match ((t (:foreground "brightwhite" :weight bold))))
 '(helm-minibuffer-prompt ((t (:foreground "green"))))
 '(helm-selection ((t (:background "color-233" :foreground "brightwhite" :underline t))))
 '(helm-separator ((t (:background "color-233" :foreground "white"))))
 '(helm-source-header ((t (:background "color-233" :foreground "white" :box (:line-width 1 :style released-button) :underline nil :weight bold))))
 '(helm-swoop-target-line-face ((t (:background "unspecified-bg" :foreground "color-52"))))
 '(helm-swoop-target-word-face ((t (:background "unspecified-bg" :foreground "color-52" :underline t :weight bold))))
 '(highlight ((t (:background "   unspecified-bg" :foreground "color-52" :weight ultra-bold))))
 '(highlight-indentation-face ((t (:background "color-234"))))
 '(highlight-thing ((t (:inherit (quote highlight)))))
 '(hl-line ((t (:background "undefinded-bg" :underline t))))
 '(isearch ((t (:background "undefinded-bg" :foreground "color-52" :weight bold))))
 '(linum ((t (:background "unspecified-bg" :foreground "blue"))))
 '(linum-relative-current-face ((t (:background "unspecified-bg" :foreground "brightwhite" :weight bold))))
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
 '(org-level-1 ((t (:inherit outline-1 :height 1.0))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
 '(popup-face ((t (:inherit default :background "brightwhite" :foreground "green"))))
 '(popup-menu-selection-face ((t (:inherit default :background "green" :foreground "brightwhite"))))
 '(popup-tip-face ((t (:background "undefinded-bg" :foreground "green" :weight extra-bold))))
 '(rainbow-delimiters-base-face ((t (:inherit nil :weight bold))))
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "color-235"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "brightcyan"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "brightwhite"))))
 '(rainbow-delimiters-mismatched-face ((t (:inherit rainbow-delimiters-unmatched-face))))
 '(region ((t (:background "#1D1F21" :weight bold))))
 '(ruler-mode-default ((t (:inherit default :background "undefinded-bg" :foreground "blue"))))
 '(show-paren-match ((t (:background "unspecified-bg" :foreground "color-52" :weight bold))))
 '(web-mode-current-column-highlight-face ((t (:background "blue"))))
 '(writegood-duplicates-face ((t (:background "undefinded-bg" :underline t :weight bold))))
 '(writegood-passive-voice-face ((t (:background "undefinded-bg" :weight bold))))
 '(writegood-weasels-face ((t (:background "undefinded-bg" :weight bold)))))
(put 'narrow-to-region 'disabled nil)
