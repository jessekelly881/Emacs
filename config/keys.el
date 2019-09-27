;; Normal Mode
(general-def 'normal
  "C-m" 'hlt-unhighlight-region
  "<escape>" 'save-buffer

  "<SPC><SPC>" 'helm-M-x
  "<SPC> B" '(buffer-hydra/body :which-key "Buffer hydra")
  "<SPC> W" '(window-hydra/body :which-key "Window hydra")

  "/" 'helm-swoop
  "q" 'my/quit
  "Q" 'kill-emacs
  "U" 'undo-tree-visualize
  "f" 'avy-goto-char-timer
  "F" 'avy-goto-line
  "t" 'avy-goto-char-in-line
  "g b" '(helm-bookmarks :which-key "Goto bookmark")
  "g f" 'helm-imenu
  "g d" '(dumb-jump-go-other-window :which-key "Goto definition")
  "g t" 'web-mode-tag-match
  "?" 'helm-ag
  "m" 'er/expand-region
  "M" 'my/mark-region
  "<backtab>" 'projectile-previous-project-buffer
  "TAB" 'helm-mini
  "C-p" 'helm-show-kill-ring
)

;; Visual Mode
(general-def 'visual
  "<SPC><SPC>" '(helm-M-x :which-key "M-x")
  "TAB" 'indent-for-tab-command

  "b" '(beacon-blink :which-key "Blink cursor")

  "f" 'avy-goto-char-timer
  "F" 'avy-goto-line

  "#" 'comment-or-uncomment-region
  "r" 'replace-string
  "m" 'my/highlight-region
  "u" 'undo

  "M p" '(mc/mark-previous-like-this :which-key "MC - Mark previous")
  "M n" '(mc/mark-next-like-this :which-key "MC - Mark next")
  "M a" '(mc/mark-all-like-this :which-key "MC - Mark all")

  "v a" '(loccur-current :which-key "Show all occurances")
  "v n" '(my/fancy-narrow :which-key "Narrow in current buffer")
  "v N" '(my/narrow :which-key "Narrow to new buffer")
  "v f" '(fold-this :which-key "Fold")

  "g t" '(web-mode-tag-match :which-key "Jump to tag pair")

  "s g" '(gist-region :which-key "Gist")
  "s s" '(yas-new-snippet :which-key "Snippet(yas)")
  )

;; Leader Keys
(general-create-definer leader-key :prefix "SPC")
(general-create-definer config-leader-key :prefix "SPC c")

(general-create-definer git-leader-key :prefix "SPC g")
(general-create-definer project-leader-key :prefix "SPC p")

(general-create-definer file-leader-key :prefix "SPC f")
(general-create-definer view-leader-key :prefix "SPC v")
(general-create-definer buffer-leader-key :prefix "SPC b")
(general-create-definer window-leader-key :prefix "SPC w")
(general-create-definer project-leader-key :prefix "SPC p")
(general-create-definer settings-leader-key :prefix "SPC s")
(general-create-definer insert-leader-key :prefix "SPC i")
(general-create-definer info-leader-key :prefix "SPC I")
(general-create-definer text-leader-key :prefix "SPC t")
(general-create-definer resource-leader-key :prefix "SPC r")

(which-key-add-key-based-replacements
  "SPC c" "Config"

  "SPC g" "Git"
  "SPC p" "Project"

  "SPC f" "File"
  "SPC v" "View"
  "SPC s" "Set"
  "SPC b" "Buffer"
  "SPC w" "Window"
  "SPC p" "Project"
  "SPC i" "Insert"
  "SPC I" "Info"
  "SPC t" "Text"
  "SPC r" "Resources"
)

;; Window
(window-leader-key :states '(normal visual)
  "h" '(windmove-left :which-key "Left")
  "j" '(windmove-down :which-key "Down")
  "k" '(windmove-up :which-key "Up")
  "l" '(windmove-right :which-key "Right")
  "L" '(split-window-right :which-key "Split right")
  "J" '(split-window-below :which-key "Right")
  "o" '(ranger :which-key "Right")
)

;; Buffer
(buffer-leader-key  :states '(normal visual)
  "s" '(save-buffer :which-key "Save")
)

;; Git
(git-leader-key :states '(normal visual)
  "S" '(magit-status :which-key "Status")

  "s" '(magit-stage-modified :which-key "Stage")
  "u" '(magit-unstage-all :which-key "Unstage")
  "c" '(magit-commit :which-key "Commit")
  "p" '(magit-push :which-key "Push")

  "r h" '(magit-reset-hard :which-key "Hard")

  "b b" '(magit-branch-checkout :which-key "Checkout")
  "b n" '(magit-branch-create :which-key "New")
  "b c" '(magit-branch-and-checkout :which-key "Create and checkout")
  "b d" '(magit-branch-delete :which-key "Delete")
  "b r" '(magit-branch-rename :which-key "Rename")
)

(which-key-add-key-based-replacements "SPC g r" "Reset")
(which-key-add-key-based-replacements "SPC g b" "Branch")

;; Project
(project-leader-key :states '(normal visual)
  "s" '(helm-projectile-switch-project :which-key "Switch")
  "/" '(helm-projectile-ag :which-key "Switch")
  )

;; Resources
(resource-leader-key :states '(normal visual)
  "g" '(gist-list :which-key "Gists")
  "w" '(helm-wikipedia-suggest :which-key "Wikipedia")
)

;; Set
(settings-leader-key :states '(normal visual)
   "m m" '(markdown-mode :which-key "Markdown mode")
   "m o" '(org-mode :which-key "Org mode")
   "m w" '(web-mode :which-key "Web mode")
   "m p" '(python-mode :which-key "Python mode")
)

(which-key-add-key-based-replacements "SPC s m" "Mode")

;; Info
(info-leader-key :states '(normal visual)
  "w" '(count-words :which-key "Word count")
  "l" '(count-lines-page :which-key "Lines count")
)

;; View
(view-leader-key :states '(normal visual)
  "t" '(toggle-truncate-lines :which-key "Toggle truncate lines")
  "r" '(ruler-mode :which-key "Ruler")
  "o" 'olivetti-mode
  "O" 'olivetti-hydra/body
  "m" '(hide-mode-line-mode :which-key "Toggle modeline")
  "l" 'linum-relative-mode
  "L" 'display-line-numbers-mode
  "g" 'git-gutter
  "f" 'fold-this-unfold-all
  "c" 'my/clean-view
  "T" 'helm-themes

  "h t" 'sgml-tags-invisible
)

;; Config
(config-leader-key :states '(normal visual)
  "c" '(my/open-config-core :which-key "Core")
  "k" '(my/open-config-keys :which-key "Keys")
  "p" '(my/open-config-packages :which-key "Packages")
  "u" '(my/open-config-utils :which-key "Utils")
  "m" '(my/open-config-modehooks :which-key "Mode Hooks")
)

;; Insert
(insert-leader-key :keymaps 'normal
  "l" '(lorem-ipsum-insert-paragraphs :which-key "Lorem text")
  "s" '(helm-c-yas-complete :which-key "Snippet")
  "d" '(crux-insert-date :which-key "Date")
  "/" '(web-mode-element-close :which-key "Closing tag")
)

;; Text
(text-leader-key :states '(normal visual)
  "t l" '(transpose-lines :which-key "Lines")
  "t w" '(transpose-words :which-key "Words")
  "t c" '(transpose-chars :which-key "Characters")
  "t s" '(transpose-sentences :which-key "Sentences")
  "t p" '(transpose-paragraphs :which-key "Paragraphs")
)

(which-key-add-key-based-replacements "SPC t t" "Transpose")

;; Web mode
(general-define-key
 :keymaps 'emmet-mode-map
 "TAB" 'emmet-expand-line)

;; elpy
(general-define-key
 :states '(normal visual)
 :keymaps 'elpy-mode-map
  "g d" '(elpy-goto-definition-other-window :which-key "goto definition(elpy)")
 )

(provide 'keys)
;;; keys.el ends here
