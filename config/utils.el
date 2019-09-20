;; A general complete after word function. A *tab* complete
(defun my/complete ()
  (interactive)
  (cond
   ((equal major-mode 'web-mode) (emmet-expand-line (line-beginning-position) (line-end-position)))
   ))


(defun my/narrow () (interactive) (narrow-to-region (point) (mark)) (evil-normal-state))
(defun my/highlight-region () (interactive) (hlt-highlight-region) (evil-normal-state))

(defun my/fancy-narrow ()
  (interactive)
  (fancy-narrow-to-region (point) (mark))
  (evil-normal-state)
  (setq fancy-buffer-narrowed-p t)
  )

;; Config Files
(defun my/open-config-core () (interactive) (find-file-other-window "/home/jesse/.emacs.d/config/core.el"))
(defun my/open-config-packages () (interactive) (find-file-other-window "/home/jesse/.emacs.d/config/packages.el"))
(defun my/open-config-keys () (interactive) (find-file-other-window "/home/jesse/.emacs.d/config/keys.el"))
(defun my/open-config-utils () (interactive) (find-file-other-window "/home/jesse/.emacs.d/config/utils.el"))
(defun my/open-config-modehooks () (interactive) (find-file-other-window "/home/jesse/.emacs.d/config/modehooks.el"))

;; Clean View
(defun my/clean-view (interactive) ()
  (progn
    (setq header-line-format " ")
    (olivetti-mode)
    (olivetti-hide-mode-line)
  ))

(defun my/quit ()
  "An overloaded quit function. Takes context into account."
  (interactive)
  (cond
   ((bound-and-true-p loccur-mode) (loccur-current))
   ((buffer-narrowed-p) (widen))
   (fancy-buffer-narrowed-p (progn (fancy-widen) (setq fancy-buffer-narrowed-p nil)))
   ((not (one-window-p)) (kill-buffer-and-window))
   (t (delete-frame)))) ;; If narrowed widen, else delete frame

(provide 'util)
;;; utils.el ends here
