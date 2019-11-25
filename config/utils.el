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
   ((org-buffer-narrowed-p) (widen))
   (fancy-buffer-narrowed-p (progn (fancy-widen) (setq fancy-buffer-narrowed-p nil)))
   ((not (one-window-p)) (kill-buffer-and-window))
   (t (kill-current-buffer)))) ;; If narrowed widen, else delete frame

;; Capitalize only the first character of the input STRING.
(defun my/capitalize-first-char (&optional string)
  "Capitalize only the first character of the input STRING."
  (interactive)
  (when (and string (> (length string) 0))
    (let ((first-char (substring string nil 1))
          (rest-str   (substring string 1)))
      (concat (capitalize first-char) rest-str))))

;; Run shell command on buffer(and open new buffer with output)
(defun shell-command-on-buffer ()
  (interactive)
  (shell-command-on-region (point-min) (point-max) (read-shell-command "Shell command on buffer: ") nil))

;; Insert shell command output
(defun put-shell-command ()
  (interactive)
  (insert (shell-command-to-string (read-shell-command "Shell command on buffer: "))))

(defun emmet-hippie-try-expand-line (args)
  (interactive "P")
  (when emmet-mode
    (emmet-expand-line args)))

(defun my/org-copy-region-as-html (beg end &optional level)
  "Make it easier to copy code for Wordpress posts and other things."
  (interactive "r\np")
  (let ((org-export-html-preamble nil)
        (org-html-toplevel-hlevel (or level 3)))
    (kill-new
     (org-export-string-as (buffer-substring beg end) 'html t))))

(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"))

(defun my/visit-ielm ()
  "Create or visit a `ielm' buffer."
  (interactive)
  (if (not (get-buffer "*ielm*"))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (ielm))
    (switch-to-buffer-other-window "*ielm*")))

(defun my/run-repl ()
  (interactive)
  (cond
   ((member major-mode '(web-mode js-mode js2-mode))(nodejs-repl))
   ((member major-mode '(python-mode))(run-python))
   ((member major-mode '(emacs-lisp-mode))(my/visit-ielm))
   (t (shell))
   ))


(provide 'util)
;;; utils.el ends here
