;; -*- lexical-binding: t; -*-
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(load (expand-file-name "config/core.el" user-emacs-directory))

(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
