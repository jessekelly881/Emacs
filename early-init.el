(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; GC - Avoid garbage collection at startup but reenable as late as possible
(setq gc-cons-threshold most-positive-fixnum ; 2^61 bytes
      gc-cons-percentage 0.6)

(add-hook 'emacs-startup-hook
  (lambda ()
    (setq gc-cons-threshold 16777216 ; 16mb
          gc-cons-percentage 0.1)))
