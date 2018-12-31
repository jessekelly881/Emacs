(use-package helm)
(use-package which-key :config (which-key-mode))
(use-package hydra)
(use-package evil :config (evil-mode 1))
(use-package general)
(use-package yasnippet)
(use-package linum-relative :config (global-linum-mode t) (linum-relative-toggle))
(use-package which-key :config (which-key-mode) (setq which-key-idle-delay 0.2))

;;Mode Line
(setq mode-line-format
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

;;Leader Keys
(general-create-definer leader-key :prefix "SPC")
(general-create-definer file-leader-key :prefix "SPC f")
(general-create-definer buffer-leader-key :prefix "SPC b")
(general-create-definer project-leader-key :prefix "SPC p")
(general-create-definer settings-leader-key :prefix "SPC s")

;;Core Bindings
