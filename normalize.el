;;normalize.el - Make everything "normal".

;;Disable Mouse Interface
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(visual-line-mode t)
(show-paren-mode 1)
(global-auto-revert-mode 1)
(global-prettify-symbols-mode 1)
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

(fset 'yes-or-no-p 'y-or-no-p)

(setq-default
 indent-tabs-mode nil
 tab-width 2)

;;utf-8
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

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
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.milkbox.net/packages/")
	     t)
(package-initialize)
(package-install 'use-package)
(setq use-package-always-ensure t)
