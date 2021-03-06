;; -*- lexical-binding: t; -*-
;;normalize.el - Make everything "normal".

;;Disable Mouse Interface
(global-visual-line-mode t)
(show-paren-mode 1)
(electric-pair-mode)
(global-auto-revert-mode 1)
(global-prettify-symbols-mode 1)
(add-hook 'write-file-hooks 'delete-trailing-whitespace)
(set-default 'truncate-lines t)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default
 indent-tabs-mode nil
 tab-width 2)

;; Base settings
(setq
 inhibit-startup-message t
 initial-scratch-message ""
 make-backup-files nil  ; stop creating backup~ files
 auto-save-default nil  ; stop creating #autosave# files
 create-lockfiles nil
 show-paren-delay 0
 )

;;Setup Package Repositories
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-always-ensure t)


;; Do not show ^M in files containing mixed UNIX and DOS line endings.
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(add-hook 'text-mode-hook 'remove-dos-eol)
(add-hook 'web-mode-hook 'remove-dos-eol)

(provide 'normalize)
;;; normalize.el ends here
