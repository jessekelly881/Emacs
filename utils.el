(defhydra window-hydra ()
  "
    Movement^   ^Split^         ^Switch^       ^^^Resize^         ^Window Purpose^
    ------------------------------------------------------------------------------------------------------
    _h_ ←
    _j_ ↓
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
