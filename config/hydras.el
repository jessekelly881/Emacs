(defhydra window-hydra ()
  "
    Movement^   ^Split^       ^Buffer^
    ------------------------------------------------------------------------------------------------------
    _h_ ←       _L_ ←             _o_ open
    _j_ ↓       _J_ ↓
    _k_ ↑
    _l_ →
    ^^^^^^^
    ^^^^^^^
    _x_ M-x      _q_ quit
    "
  ("h" windmove-left)
  ("j" windmove-down)
  ("k" windmove-up)
  ("l" windmove-right)
  ("L" split-window-right)
  ("J" split-window-below)
  ("o" ranger :exit t)
  ("x" helm-M-x)
  ("q" nil)
  )



(defun scroll-up-in-place (n)
  (interactive "p")
  (forward-line (- n))
  (scroll-down n))

(defun scroll-down-in-place (n)
      (interactive "p")
      (forward-line n)
      (scroll-up n))

(defhydra buffer-hydra (:pre (beacon-mode 0) :post (beacon-mode 1))

  "
    Movement^
    ------------------------------------------------------------------------------------------------------
    _j_ ↓
    _k_ ↑
    ^^^^^^^
    ^^^^^^^
    _x_ M-x      _q_ quit
    "

  ("j" scroll-down-in-place)
  ("k" scroll-up-in-place)
  ("x" helm-M-x)
  ("q" nil)
  )

(defhydra olivetti-hydra ()
  "
    Movement^
    ---------
    _h_ ←
    _l_ →
    ^^^^^^^
    ^^^^^^^
   _t_ toggle  _x_ M-x      _q_ quit
    "
  ("h" olivetti-expand)
  ("l" olivetti-shrink)
  ("t" olivetti-mode)
  ("x" helm-M-x)
  ("q" nil)
  )


(provide 'hydras)
;;; hydras.el ends here
