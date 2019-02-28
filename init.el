
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load (expand-file-name "normalize.el"  user-emacs-directory))
(load (expand-file-name "core.el" user-emacs-directory))

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
    ("58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "43b219a31db8fddfdc8fdbfdbd97e3d64c09c1c9fdd5dff83f3ffc2ddb8f0ba0" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(package-selected-packages
   (quote
    (sublime-themes clues-theme blackboard-theme helm-themes crux dracula-theme git-gutter-fringe coffee-mode company tide fish-mode telephone-line mark-multiple multiple-cursors nand2tetris helm-mode-manager helm-swoop helm-chronos chronos olivetti lorem-ipsum expand-region helm-c-yasnippet helm-ag ag magit markdown-mode pug-mode avy elpy yasnippet which-key smart-mode-line linum-relative yas hydra helm use-package "use-package" ##))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 16777216)) (:foreground "#C0E9F6" :background "#110B14")) (((class color) (min-colors 88)) (:foreground "#fff" :background "#000")) (((class color) (min-colors 16)) (:foreground "#fff" :background "#000")) (((class color) (min-colors 8)) (:foreground "#fff" :background "#000"))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.0))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))
