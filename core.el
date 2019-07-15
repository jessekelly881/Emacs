(defconst emacs-start-time (current-time))
(set-face-attribute 'default nil :height 80) ;;Set font size for UI

;;Core Packages. Used Throughout Config.
(use-package helm
  :config (setq helm-follow-mode-persistent t))

(use-package xclip :config (xclip-mode 1))
(use-package helm-swoop)
(use-package dumb-jump)
;; Disable pre-input
(use-package helm-mode-manager)
(use-package docker)
(use-package yasnippet :config (yas-global-mode 1))
(use-package helm-c-yasnippet)
(use-package ag)
(use-package helm-ag)
(use-package golden-ratio
  :config (golden-ratio-mode 1))
(use-package expand-region :config
  (setq er/try-expand-list
    (append er/try-expand-list '(mark-paragraph mark-page))))

(use-package general)

(use-package chronos)
(use-package helm-chronos :init
  (setq helm-chronos-standard-timers
    '( "25/Work For 25 Min"
       "")))

(use-package evil :config
  (evil-mode 1))
(setq evil-normal-state-cursor '("#FFFF4D" box) ;;Pale Yellow
          evil-insert-state-cursor '("#B30000" hbar) ;;Dark Red
          evil-visual-state-cursor '("grey" hbar)
          evil-replace-state-cursor '("#FF4D4D" hbar)) ;;Pinkish

(use-package evil-exchange :config (evil-exchange-install))
(use-package evil-surround :config (global-evil-surround-mode 1))


(use-package avy)
(use-package which-key :config (which-key-mode))
(use-package hydra)
(use-package evil :config (evil-mode 1))
(use-package general)
(use-package projectile :config (projectile-global-mode))
(use-package linum-relative)
(use-package which-key :config (which-key-mode) (setq which-key-idle-delay 0.2))
(use-package magit)
(use-package web-mode)


;;Misc. Non-Core Packages.
(use-package crux)
(use-package origami)
(use-package olivetti) ;;Centered text
(use-package lorem-ipsum)
(use-package markdown-mode)
(use-package company)
(use-package coffee-mode)
(use-package auto-complete
  :config (ac-config-default))
(use-package nand2tetris ;;Nand2Tetris Course. HDL Code
  :config
  (add-to-list 'auto-mode-alist '("\\.hdl\\'" . nand2tetris-mode))
  (setq nand2tetris-core-base-dir "~/dev/projects/nand2tetris")
  )

;; Typescript
(use-package tide)
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))


(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

;;Django
(use-package python-django)


;;Theme
(use-package blackboard-theme)
(use-package clues-theme)
(use-package sublime-themes)
(use-package monochrome-theme)

(load-theme 'brin t)


(defun on-frame-open (&optional frame)
  "If the FRAME created in terminal don't load background color."
  (unless (display-graphic-p frame)
    (set-face-background 'default "unspecified-bg" frame)
    (set-face-background 'font-lock-comment-face "unspecified-bg" frame)
    ))

(add-hook 'after-make-frame-functions 'on-frame-open)

(setq helm-swoop-pre-input-function
      (lambda () ""))

(use-package helm-themes)

(use-package highlight)
;;Mode Line
;; (setq-default mode-line-format
;;   (list
;;    " "
;;    "%m. "
;;    "%b. "
;;    "line %l. "
;;    ))
(setq-default mode-line-format nil)


;;Highlight Curent Line
(global-hl-line-mode +1)

;;Mode Specific Configs.
(load (expand-file-name "el.el" user-emacs-directory))
(load (expand-file-name "py.el" user-emacs-directory))
(load (expand-file-name "web.el" user-emacs-directory))
(load (expand-file-name "utils.el" user-emacs-directory))

;;Leader Keys
(general-create-definer leader-key :prefix "SPC")
(general-create-definer config-leader-key :prefix "SPC c")
(general-create-definer file-leader-key :prefix "SPC f")
(general-create-definer view-leader-key :prefix "SPC v")
(general-create-definer set-leader-key :prefix "SPC s")
(general-create-definer buffer-leader-key :prefix "SPC b")
(general-create-definer project-leader-key :prefix "SPC p")
(general-create-definer settings-leader-key :prefix "SPC s")
(general-create-definer insert-leader-key :prefix "SPC i")
(general-create-definer info-leader-key :prefix "SPC I")

;;Core Bindings
(setq fancy-buffer-narrowed-p nil)
(defun my/quit ()
  (interactive)
  (cond
   ((bound-and-true-p loccur-mode) (loccur-current))
   ((buffer-narrowed-p) (widen))
   (fancy-buffer-narrowed-p (progn (fancy-widen) (setq fancy-buffer-narrowed-p nil)))
   ((not (one-window-p)) (kill-buffer-and-window))
   (t (delete-frame)))) ;; If narrowed widen, else delete frame

(setq helm-boring-buffer-regexp-list
      (quote
       (  "\\Minibuf.+\\*"
               "\\` "
               "\\*.+\\*"
                  )))


(general-def 'normal
  "C-m" 'hlt-unhighlight-region
  "<escape>" 'save-buffer
  "<SPC><SPC>" 'helm-M-x
  "/" 'helm-swoop
  "q" 'my/quit
  "Q" 'kill-emacs
  "U" 'undo-tree-visualize
  "f" 'avy-goto-char-timer
  "F" 'avy-goto-line

  "t" 'avy-goto-char-in-line

  "g b" 'helm-bookmarks
  "g f" 'helm-imenu
  "g d" 'dumb-jump-go-other-window

  "?" 'helm-ag

  "m" 'er/expand-region
  "M" 'my/mark-region

  "TAB" 'helm-buffers-list
  "<backtab>" 'previous-buffer

  "P" 'helm-show-kill-ring
)



(defun my/narrow () (interactive) (narrow-to-region (point) (mark)) (evil-normal-state))
(defun my/highlight-region () (interactive) (hlt-highlight-region) (evil-normal-state))

(defun my/fancy-narrow ()
  (interactive)
  (fancy-narrow-to-region (point) (mark))
  (evil-normal-state)
  (setq fancy-buffer-narrowed-p t)
  )

(use-package fold-this)
(use-package loccur)



(general-def 'visual
  "#" 'comment-or-uncomment-region
  "<SPC><SPC>" 'helm-M-x
  "n" 'my/fancy-narrow
  "N" 'my/narrow
  "r" 'replace-string
  "m" 'my/highlight-region
  "f" 'fold-this
  "u" 'undo
  "a" 'loccur-current
  )


;;Org: Hide Leading Stars
(defun chunyang-org-mode-remove-stars ()
  (font-lock-add-keywords
   nil
   '(("^\\*+ "
      (0
       (prog1 nil
         (put-text-property (match-beginning 0) (match-end 0)
                            'invisible t)))))))

(add-hook 'org-mode-hook #'chunyang-org-mode-remove-stars)

;;Org Normalize Headers Size
(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.0))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
)


;; Info
(leader-key  :keymaps 'normal
  "w" 'window-hydra/body
)

(info-leader-key  :keymaps 'normal
  "w" 'count-words
  "l" 'count-lines-page
)
;; View
(defun my/clean-view (interactive) ()
  (progn
    (setq header-line-format " ")
    (olivetti-mode)
    (olivetti-hide-mode-line)
  ))

(view-leader-key  :keymaps 'normal
  "t" 'toggle-truncate-lines
  "o" 'olivetti-mode
  "O" 'olivetti-hydra/body
  "m" 'olivetti-toggle-hide-mode-line
  "l" 'linum-relative-mode
  "L" 'global-linum-mode
  "g" 'golden-ratio-mode
  "f" 'fold-this-unfold-all
  "c" 'my/clean-view
  "T" 'helm-themes

  "h t" 'sgml-tags-invisible
)

(defun open-config-core () (interactive) (find-file-other-window "/home/jesse/.emacs.d/core.el"))
(config-leader-key  :keymaps 'normal
  "c" 'open-config-core
)

;; Insert
(insert-leader-key :keymaps 'normal
  "l" 'lorem-ipsum-insert-paragraphs
  "s" 'helm-c-yas-complete
  "d" 'crux-insert-date
  "t c" 'sgml-close-tag
)
;; Mark Hydra
(use-package multiple-cursors)
(defhydra hydra-mark (:hint nil)
)

;; Unlimited Undo Tree
(global-undo-tree-mode)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))


;; Mu4e Email
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")

;;Python
(use-package elpy)
(elpy-enable)

;; Pretty Symbols
(global-prettify-symbols-mode 1)

(add-hook
 'python-mode-hook
 (lambda ()
   (mapc (lambda (pair) (push pair prettify-symbols-alist))
         '(;; Syntax
           ("def" .      #x0192)
           ("not" .      #x0021)
           ("in" .       #x2208)
           ("not in" .   #x2209)
           ("return" .   #x219E)
           ("yield" .    #x27fb)
           ("class" .    #x039E)
           ("for" .      #x2200)
           ("import" .   #x03A9)
           ("from" .     #x00A7)
           ("if" .       #x003F)
           ("if not" .   #x203D)
           ("elif" .     #x00BF)
           ("else" .     #x00BB)
           ("self" .     #x21BA)
           ("break" .    #x21B5)
           ("pass" .     #x21B7)
           ("==" .       #x2261)
           ;; Base Types
           ("int" .      #x2124)
           ("float" .    #x211d)
           ("str" .      #x1d54a)
           ("True" .     #x1E6A)
           ("False" .    #x1E1E)
           ;; Mypy
           ("Dict" .     #x1d507)
           ("List" .     #x2112)
           ("Tuple" .    #x2a02)
           ("Set" .      #x2126)
           ("Iterable" . #x1d50a)
           ("Any" .      #x2754)
           ("Union" .    #x22c3)))))
