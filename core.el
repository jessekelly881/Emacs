;;Core Packages. Used Throughout Config.
(use-package helm)
(use-package general)
(use-package evil :config (evil-mode 1))
(use-package avy)
(use-package which-key :config (which-key-mode))
(use-package hydra)
(use-package evil :config (evil-mode 1))
(use-package general)
(use-package yasnippet)
(use-package projectile :config (projectile-global-mode))
(use-package linum-relative :config (global-linum-mode t) (linum-relative-toggle))
(use-package which-key :config (which-key-mode) (setq which-key-idle-delay 0.2))
(use-package magit)

;;Misc. Non-Core Packages.
(use-package markdown-mode)
(use-package auto-complete
  :config (ac-config-default))


;;Mode Line
(setq-default mode-line-format
  (list
   "%m. "
   "%b. "
   "line %l. "
   ))

;;Highlight Curent Line
(global-hl-line-mode +1)

;;Mode Specific Configs.
(load (expand-file-name "el.el" user-emacs-directory))    ;;Emacs Lisp
(load (expand-file-name "py.el" user-emacs-directory))   ;;Python
(load (expand-file-name "web.el" user-emacs-directory))   ;;Web Stuff

;;Leader Keys
(general-create-definer leader-key :prefix "SPC")
(general-create-definer file-leader-key :prefix "SPC f")
(general-create-definer buffer-leader-key :prefix "SPC b")
(general-create-definer project-leader-key :prefix "SPC p")
(general-create-definer settings-leader-key :prefix "SPC s")

;;Core Bindings
(general-def 'normal
  "<escape>" 'save-buffer
  "<SPC><SPC>" 'helm-M-x
  "q" 'delete-frame
  "Q" 'kill-emacs
  "U" 'undo-tree-visualize
  "f" 'avy-goto-char-timer
  "F" 'avy-goto-line

  "g b" 'helm-bookmarks
)

;;Org
(use-package org-bullets :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
