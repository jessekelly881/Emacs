;; Increace gc threshold - decreaces startup by 2-3s
(setq gc-cons-threshold (* 100 1000 1000))

;; Personal info
(load (expand-file-name "config/personal.el" user-emacs-directory))

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

;; Display startup time
(message "Emacs ready in %s with %d garbage collections."
         (format "%.2f seconds"
                 (float-time
                  (time-subtract after-init-time before-init-time)))
         gcs-done)

;; Decrace gc threshold back to normal
(setq gc-cons-threshold (* 2 1000 1000))

;; Automatically make scripts executable
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

(provide 'core)
;;; core.el ends here
