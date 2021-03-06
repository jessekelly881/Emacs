;; -*- lexical-binding: t; -*-
;; Shared keys
(general-def :states '(normal visual)
  "<SPC><SPC>" '(helm-M-x :which-key "M-x")
  "<SPC> TAB" '(helm-for-files :which-key "Switch to Buffer")

  "f" 'avy-goto-char-timer
  "F" 'avy-goto-line
  "t" 'avy-goto-char-in-line
  )

(general-def :states '(normal insert)
  "DEL" '(smart-backspace :which-key "Smart delete back")
  )

(general-def
  :states '(insert)
  :keymaps 'prog-mode-map
  "TAB" 'hippie-expand
)

;; Dired
(bind-key "C-x d" #'dired-jump prog-mode-map)


;; Normal Mode
(general-def 'normal
  "C-m" 'hlt-unhighlight-region
  "<escape>" 'save-buffer

  "<SPC> B" '(buffer-hydra/body :which-key "Buffer hydra")
  "<SPC> W" '(window-hydra/body :which-key "Window hydra")
  "<SPC> $" '(my/run-repl :which-key "REPL/Shell")

  "/" '(helm-swoop :which-key "Search")
  "q" 'my/quit
  "Q" 'save-buffers-kill-terminal
  "U" 'undo-tree-visualize
  "g b" '(helm-bookmarks :which-key "Goto bookmark")
  "g f" 'helm-imenu
  "g d" '(dumb-jump-go-other-window :which-key "Goto definition")
  "g D" '(helm-dash-at-point :which-key "Goto docs")
  "g n e" '(flycheck-next-error : which-key "Next error")
  "g t" 'web-mode-tag-match
  "?" 'helm-ag
  "m" 'er/expand-region
  "M" 'my/mark-region
  "<backtab>" 'evil-jump-forward
  "TAB" 'evil-jump-backward
  "C-p" 'helm-show-kill-ring
  )

;; Visual Mode
(general-def 'visual
  "TAB" 'indent-for-tab-command

  ;; Text
  "r" '(replace-string :which-key "Replace")
  "s" '(sort-lines :which-key "Sort")

  "J" 'drag-stuff-down
  "K" 'drag-stuff-up

  "#" 'comment-or-uncomment-region
  "m" 'my/highlight-region
  "u" 'undo

  "p" '(mc/mark-previous-word-like-this :which-key "Mark previous")
  "n" '(mc/mark-next-word-like-this :which-key "Mark next")
  "a" '(mc/mark-all-like-this :which-key "Mark all")
  "A" '(mc/edit-lines :which-key "Edit lines")

  "RET" '(mc/skip-to-next-like-this :which-key "Skip next")
  "DEL" '(mc/skip-to-previous-like-this :which-key "Skip next")

  "v a" '(loccur-current :which-key "Show all occurances")
  "v n" '(my/fancy-narrow :which-key "Narrow in current buffer")
  "v N" '(my/narrow :which-key "Narrow to new buffer")
  "v f" '(fold-this :which-key "Fold")

  "g t" '(web-mode-tag-match :which-key "Jump to tag pair")

  "Y y" '(yankpad-capture-snippet :which-key "Yankpad")
  "Y g" '(gist-region :which-key "Gist")
  "Y w" '(webpaste-paste-region :which-key "Webpaste")
  "Y s" '(yas-new-snippet :which-key "Snippet(yas)")

  "x c" '(carbon-now-sh)
  )

(general-def 'visual
  :keymaps 'org-mode-map
  "Y h" '(my/org-copy-region-as-html :which-key "As html")
  )

;; Leader Keys
(general-create-definer leader-key :prefix "SPC")
(general-create-definer refactor-leader-key :prefix "SPC r")
(general-create-definer config-leader-key :prefix "SPC C")

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
(general-create-definer resource-leader-key :prefix "SPC R")

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
  "g" '(ace-window :which-key "Go")

  "h" '(windmove-left :which-key "Left")
  "j" '(windmove-down :which-key "Down")
  "k" '(windmove-up :which-key "Up")
  "l" '(windmove-right :which-key "Right")
  "L" '(split-window-right :which-key "Split right")
  "J" '(split-window-below :which-key "Right")
  "o" '(ranger :which-key "Open file")
)

;; Buffer
(buffer-leader-key  :states '(normal visual)
  "s" '(save-buffer :which-key "Save")
  "c" '(recenter-top-bottom :which-key "reCenter")
  "d" '(diff-buffer-with-file :which-key "Diff with file")
)

;; Git
(git-leader-key :states '(normal visual)
  "S" '(magit-status :which-key "Status")
  "P" '(magit-push-other :which-key "Push(other)")
  "R" '(magit-rebase-interactive :which-key "Rebase")

  "s" '(magit-stage-modified :which-key "Stage")
  "t" '(magit-todos-list :which-key "Todo")
  "u" '(magit-unstage-all :which-key "Unstage")
  "p" '(magit-push-current :which-key "Push(current)")
  "d" '(magit-diff :which-key "Diff")

  "r h" '(magit-reset-hard :which-key "Hard")

  "b b" '(magit-branch-checkout :which-key "Checkout")
  "b n" '(magit-branch-create :which-key "New")
  "b c" '(magit-branch-and-checkout :which-key "Create and checkout")
  "b d" '(magit-branch-delete :which-key "Delete")
  "b r" '(magit-branch-rename :which-key "Rename")

  "c" '(magit-commit-create :which-key "Commit")
)

(which-key-add-key-based-replacements "SPC g r" "Reset")
(which-key-add-key-based-replacements "SPC g b" "Branch")
(which-key-add-key-based-replacements "SPC g c" "Commit")

;; Project
(project-leader-key :states '(normal visual)
  "c" '(skeletor-create-project-at :which-key "Create")
  "s" '(helm-projectile-switch-project :which-key "Switch")
  "o" '(helm-projectile-recentf :which-key "Open recent file")
  "O" '(helm-projectile-find-file :which-key "Open file")
  "/" '(helm-projectile-ag :which-key "Search")
  "$" '(projectile-run-shell :which-key "Shell")
  )

;; Resources
(resource-leader-key :states '(normal visual)
  ;; Abbrevs
  "a c" '(define-global-abbrev :which-key "Create")
  "a l" '(list-abbrevs :which-key "Create")

  "t" '(google-translate-at-point :which-key "Translate")

  ;; Yankpad
  "y e" '(yankpad-edit :which-key "Gists")
  "y c" '(yankpad-capture-snippet :which-key "Capture")
  "y a" '(yankpad-append-category :which-key "Append category")
  "y s" '(yankpad-set-category :which-key "Set category")

  "g" '(gist-list :which-key "Gists")
  "w" '(webpaste-paste-buffer :which-key "Webpaste")
  "f" '(elfeed :which-key "Feed")
  "m" '(mu4e :which-key "Mail")
  "w" '(helm-wikipedia-suggest :which-key "Wikipedia")

  ;; Packages
  "p i" '(package-install :which-key "Install")
  "p r" '(package-refresh-contents :which-key "Refresh")
  "p d" '(package-delete :which-key "Delete")
  "p t" '(try :which-key "Try")
  "p u" '(auto-package-update-now :which-key "Update")
  )

(which-key-add-key-based-replacements "SPC r a" "Abbrevs")
(which-key-add-key-based-replacements "SPC r p" "Packages")
(which-key-add-key-based-replacements "SPC r y" "Yankpad")

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
  "b" '(beacon-blink :which-key "Beacon")
  "e" '(flycheck-list-errors :which-key "List errors")
  "t" '(toggle-truncate-lines :which-key "Toggle truncate lines")
  "r" '(ruler-mode :which-key "Ruler")
  "o" 'olivetti-mode
  "O" 'olivetti-hydra/body
  "m" '(hide-mode-line-mode :which-key "Toggle modeline")
  "l" 'linum-relative-mode
  "L" 'display-line-numbers-mode
  "f" '(lsp-ui-imenu :which-key "Function tree")
  "F" 'fold-this-unfold-all
  "c" '(rainbow-mode :which-key "Rainbow mode")
  "T" 'helm-themes

  "g" '(git-gutter :which-key "Gutter")
  "G" '(git-timemachine :which-key "Timemachine")

  "h t" 'sgml-tags-invisible

  "n" '(narrow-to-defun :which-key "Narrow to function")
)

(which-key-add-key-based-replacements "SPC v g" "Git")

;; Config
(config-leader-key :states '(normal visual)
  "c" '(my/open-config-core :which-key "Core")
  "k" '(my/open-config-keys :which-key "Keys")
  "p" '(my/open-config-packages :which-key "Packages")
  "u" '(my/open-config-utils :which-key "Utils")
  "m" '(my/open-config-modehooks :which-key "Mode Hooks")
)

;; Insert
(insert-leader-key :states '(normal)
  "y" '(yankpad-insert :which-key "Yankpad")
  "l" '(lorem-ipsum-insert-paragraphs :which-key "Lorem text")
  "s" '(helm-c-yas-complete :which-key "Snippet")
  "d" '(crux-insert-date :which-key "Date")
  "/" '(web-mode-element-close :which-key "Closing tag")
  "$" '(put-shell-command :which-key "Shell command")
  )

;; Text
(text-leader-key :states '(normal visual)
  "t l" '(transpose-lines :which-key "Lines")
  "t w" '(transpose-words :which-key "Words")
  "t c" '(transpose-chars :which-key "Characters")
  "t s" '(transpose-sentences :which-key "Sentences")
  "t p" '(transpose-paragraphs :which-key "Paragraphs")

  "c c" '(capitalize-region :which-key "Capitalize")
  "c u" '(upcase-region :which-key "Upcase")
  "c d" '(downcase-region :which-key "Downcase")
)

(which-key-add-key-based-replacements "SPC t t" "Transpose")
(which-key-add-key-based-replacements "SPC t c" "Case")

;; ;; lsp
;; (general-define-key
;;  :states '(normal visual)
;;  :keymaps 'lsp-mode-map
;;  "g d" '(lsp-find-definition :which-key "Goto def")
;;  )

(insert-leader-key
 :states '(normal visual)
 :keymaps 'js-mode-map
 "<SPC>" '(html-insert-nbsp :which-key "Insert nbsp")
 )


;; org
(general-define-key
 :states '(normal visual)
 :keymaps 'org-mode-map
 "SPC v n" '(org-narrow-to-element :which-key "Narrow")
 )

;; Refactor
(refactor-leader-key :states '(normal visual)
  "i" '(lsp-organize-imports :which-key "Organize imports")
)

(which-key-add-key-based-replacements "SPC r" "Refactor")


(provide 'keys)
;;; keys.el ends here
