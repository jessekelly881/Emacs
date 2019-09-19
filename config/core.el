(defconst emacs-start-time (current-time))

;; Core packages
(load (expand-file-name "config/packages.el" user-emacs-directory))
(load (expand-file-name "config/utils.el" user-emacs-directory))
(load (expand-file-name "config/hydras.el" user-emacs-directory))
(load (expand-file-name "config/keys.el" user-emacs-directory))
(load (expand-file-name "config/modehooks.el" user-emacs-directory))

;; Aesthetics packages
(load (expand-file-name "config/aesthetics/global.el" user-emacs-directory))
(load (expand-file-name "config/aesthetics/gui.el" user-emacs-directory))
(load (expand-file-name "config/aesthetics/org.el" user-emacs-directory))
(load (expand-file-name "config/aesthetics/py.el" user-emacs-directory))
(load (expand-file-name "config/aesthetics/web.el" user-emacs-directory))

;; Unlimited Undo Tree
(global-undo-tree-mode)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))

;; Global Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'core)
;;; core.el ends here
