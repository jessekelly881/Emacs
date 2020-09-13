;; -*- lexical-binding: t; -*-
;; Set personal info
(setq
 user-mail-address "kellyjesse881@gmail.com"
 user-full-name "Jesse Kelly")

;; Aliases - useful for M-x
(defalias 'om 'org-mode)
(defalias 'elm 'emacs-lisp-mode)

;; Copyright string
(setq my/copyright-string (concat "Copyright (C) " (format-time-string "%Y") " " user-full-name))

;; Set browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "surf")

;; Load normalize.el
(load (expand-file-name "config/normalize.el"  user-emacs-directory))

(load (expand-file-name "submodules/js-refactor/js2-refactor.el"  user-emacs-directory))

;; Core packages
(load (expand-file-name "config/packages.el" user-emacs-directory))
(load (expand-file-name "config/utils.el" user-emacs-directory))
(load (expand-file-name "config/hydras.el" user-emacs-directory))
(load (expand-file-name "config/keys.el" user-emacs-directory))
(load (expand-file-name "config/modehooks.el" user-emacs-directory))

;; Aesthetics packages
(load (expand-file-name "config/aesthetics/global.el" user-emacs-directory))
(load (expand-file-name "config/aesthetics/org.el" user-emacs-directory))
(load (expand-file-name "config/aesthetics/web.el" user-emacs-directory))

(load (expand-file-name "config/aesthetics/gui.el" user-emacs-directory))

;; Unlimited Undo Tree
(global-undo-tree-mode)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))

;; Display startup time
(message "Emacs ready in %s with %d garbage collections."
         (format "%.2f seconds"
                 (float-time
                  (time-subtract after-init-time before-init-time)))
         gcs-done)

;; Automatically make scripts executable
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; Keep buffers in sync with disk
(global-auto-revert-mode t)

;; org-export stuff
(setq org-html-htmlize-output-type 'css)
(setq org-export-with-broken-links t)
(setq org-export-with-section-numbers nil)
(setq org-html-include-timestamps nil)
(setq org-export-with-sub-superscripts nil)
(setq org-export-with-toc nil)

;; Supress warnings
(require 'warnings)
(add-to-list 'warning-suppress-types '(yasnippet backquote-change))

;; Garbage-collect on focus-out, Emacs should feel snappier.
(add-hook 'focus-out-hook #'garbage-collect)

;; tab sizes
(setq default-tab-width 4)
(setq tab-width 4)
(global-set-key (kbd "RET") 'newline-and-indent)

(setq warning-minimum-level :emergency)

(provide 'core)
;;; core.el ends here
