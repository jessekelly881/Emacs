(defconst emacs-start-time (current-time))

(load (expand-file-name "config/packages.el" user-emacs-directory))
(load (expand-file-name "config/utils.el" user-emacs-directory))
(load (expand-file-name "config/keys.el" user-emacs-directory))

(load (expand-file-name "config/aesthetics/global.el" user-emacs-directory))



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
(general-create-definer text-leader-key :prefix "SPC t")

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

(defun my/complete ()
  (interactive)
  (cond
   ((equal major-mode 'web-mode) (emmet-expand-line (line-beginning-position) (line-end-position)))
   ))

(setq helm-boring-buffer-regexp-list
      (quote
       (  "\\Minibuf.+\\*"
               "\\` "
               "\\*.+\\*"
                  )))

(defun my/narrow () (interactive) (narrow-to-region (point) (mark)) (evil-normal-state))
(defun my/highlight-region () (interactive) (hlt-highlight-region) (evil-normal-state))

(defun my/fancy-narrow ()
  (interactive)
  (fancy-narrow-to-region (point) (mark))
  (evil-normal-state)
  (setq fancy-buffer-narrowed-p t)
  )





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

  "g t" 'web-mode-tag-match

  "<backtab>" 'projectile-previous-project-buffer
  "TAB" 'projectile-next-project-buffer

  "P" 'helm-show-kill-ring
)

(general-def 'visual
  "<SPC><SPC>" 'helm-M-x
  "TAB" 'indent-for-tab-command

  "f" 'avy-goto-char-timer
  "F" 'avy-goto-line

  "#" 'comment-or-uncomment-region
  "r" 'replace-string
  "m" 'my/highlight-region
  "u" 'undo

  "p" 'mc/mark-previous-like-this
  "n" 'mc/mark-next-like-this
  "M a" 'mc/mark-all-like-this

  "v a" 'loccur-current
  "v n" 'my/fancy-narrow
  "v N" 'my/narrow
  "v f" 'fold-this

  "g t" 'web-mode-tag-match
  )


;;Org: Hide Leading Stars
(defun org-mode-remove-stars ()
  (font-lock-add-keywords
   nil
   '(("^\\*+ "
      (0
       (prog1 nil
         (put-text-property (match-beginning 0) (match-end 0)
                            'invisible t)))))))

(add-hook 'org-mode-hook #'org-mode-remove-stars)

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
  "/" 'web-mode-element-close
)

(text-leader-key :keymaps 'normal
  "t l" 'transpose-lines
  "t w" 'transpose-words
  "t c" 'transpose-chars
  "t s" 'transpose-sentences
  "t p" 'transpose-paragraphs
)

;; Mark Hydra
(use-package multiple-cursors)
(defhydra hydra-mark (:hint nil)
)

;; Unlimited Undo Tree
(global-undo-tree-mode)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))



;;Python
(elpy-enable)


(add-hook 'python-mode-hook
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
           ("None" .     #x2205)
           ("del" .      #x2296)
           ("super" .    #x25EE)
           ("==" .       #x2261)
           ;; Base Types
           ("int" .      #x2124)
           ("float" .    #x211d)
           ("str" .      #x1E61)
           ("True" .     #x1E6A)
           ("False" .    #x1E1E)
           ;; Mypy
           ("Dict" .     #x1d507)
           ("List" .     #x2112)
           ("Tuple" .    #x2a02)
           ("Iterable" . #x1d50a)
           ("Any" .      #x2754)
           ("Union" .    #x22c3)))))

(add-hook 'sgml-mode-hook 'emmet-mode)

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(setq web-mode-enable-auto-closing t)

(general-define-key
 :keymaps 'web-mode-map
 "TAB" 'emmet-expand-line
 )

(defun my/web-mode-settings ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-enable-current-column-highlight t)
)
(add-hook 'web-mode-hook  'my/web-mode-settings)

(setq next-line-add-newlines t)
(setq prettify-symbols-unprettify-at-point 'right-edge)

;; (setq-default 'truncate-lines t)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
