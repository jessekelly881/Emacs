(defconst emacs-start-time (current-time))
(set-face-attribute 'default nil :height 80) ;;Set font size for UI


;;Core Packages. Used Throughout Config.
(use-package helm)
(use-package helm-swoop)
(use-package helm-themes)
(use-package helm-mode-manager)
(use-package yasnippet :config (yas-global-mode 1))
(use-package helm-c-yasnippet)
(use-package ag)
(use-package helm-ag)
(use-package expand-region :config
  (setq er/try-expand-list
    (append er/try-expand-list '(mark-paragraph mark-page))))

(use-package general)

(use-package chronos)
(use-package helm-chronos :init
  (setq helm-chronos-standard-timers
    '( ""
       "")))

(use-package evil :config
  (evil-mode 1))
(setq evil-normal-state-cursor '("#FFFF4D" box) ;;Pale Yellow
          evil-insert-state-cursor '("#B30000" hbar) ;;Dark Red
          evil-visual-state-cursor '("grey" hbar)
          evil-replace-state-cursor '("#FF4D4D" hbar)) ;;Pinkish


(use-package avy)
(use-package which-key :config (which-key-mode))
(use-package hydra)
(use-package evil :config (evil-mode 1))
(use-package general)
(use-package projectile :config (projectile-global-mode))
(use-package linum-relative
  ;; :config (global-linum-mode t) (linum-relative-toggle)
  )
(use-package which-key :config (which-key-mode) (setq which-key-idle-delay 0.2))
(use-package magit)

;;Misc. Non-Core Packages.
(use-package crux)
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

(load-theme 'graham t)


(defun on-frame-open (&optional frame)
  "If the FRAME created in terminal don't load background color."
  (unless (display-graphic-p frame)
    (set-face-background 'default "unspecified-bg" frame)
    (set-face-background 'font-lock-comment-face "unspecified-bg" frame)
    ))

(add-hook 'after-make-frame-functions 'on-frame-open)

;;Mode Line
(setq-default mode-line-format
  (list
   " "
   "%m. "
   "%b. "
   "line %l. "
   ))


;;Highlight Curent Line
(global-hl-line-mode +1)

;;Mode Specific Configs.
(load (expand-file-name "el.el" user-emacs-directory))
(load (expand-file-name "py.el" user-emacs-directory))
(load (expand-file-name "web.el" user-emacs-directory))

;;Leader Keys
(general-create-definer leader-key :prefix "SPC")
(general-create-definer file-leader-key :prefix "SPC f")
(general-create-definer set-leader-key :prefix "SPC s")
(general-create-definer buffer-leader-key :prefix "SPC b")
(general-create-definer project-leader-key :prefix "SPC p")
(general-create-definer settings-leader-key :prefix "SPC s")
(general-create-definer insert-leader-key :prefix "SPC i")
(general-create-definer info-leader-key :prefix "SPC I")

;;Core Bindings
(general-def 'normal
  "<escape>" 'save-buffer
  "<SPC><SPC>" 'helm-M-x
  "/" 'helm-swoop
  "q" 'delete-frame
  "Q" 'kill-emacs
  "U" 'undo-tree-visualize
  "f" 'avy-goto-char-timer
  "F" 'avy-goto-line

  "g b" 'helm-bookmarks
  "g c" 'crux-find-user-init-file

  "?" 'helm-ag

  "m" 'er/expand-region

  "TAB" 'next-buffer
  "<backtab>" 'previous-buffer
)


(general-def 'visual
  "#" 'comment-or-uncomment-region
  "<SPC><SPC>" 'helm-M-x
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
(info-leader-key  :keymaps 'normal
  "w" 'count-words
  "l" 'count-lines-page
)

;; Insert
(insert-leader-key :keymaps 'normal
  "l" 'lorem-ipsum-insert-paragraphs
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
