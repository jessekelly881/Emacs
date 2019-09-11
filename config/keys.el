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

;; Info
(leader-key  :keymaps 'normal
  "w" 'window-hydra/body
)

(info-leader-key  :keymaps 'normal
  "w" 'count-words
  "l" 'count-lines-page
)

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

(config-leader-key  :keymaps 'normal
  "c" 'my/open-config-core
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


(general-define-key
 :keymaps 'web-mode-map
 "TAB" 'emmet-expand-line
 )
