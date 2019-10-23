;; Global
(mapc (lambda (pair) (push pair prettify-symbols-alist))
      '(
        ("alpha"   . #x03B1)
        ("beta"    . #x03B2)
        ("gamma"   . #x03B3)
        ("delta"   . #x03B4)
        ("epsilon" . #x03B5)
        ("zeta"    . #x03B6)
        ("eta"     . #x03B7)
        ("theta"   . #x03B8)
        ("iota"    . #x03B9)
        ("kappa"   . #x03BA)
        ("lambda"  . #x03BB)
        ("mu"      . #x03BC)
        ("nu"      . #x03BD)
        ("xi"      . #x03BE)
        ("omicron" . #x03BF)
        ("pi"      . #x03C0)
        ("rho"     . #x03C1)
        ("sigma"   . #x03C3)
        ("tau"     . #x03C4)
        ("upsilon" . #x03C5)
        ("phi"     . #x03C6)
        ("chi"     . #x03C7)
        ("psi"     . #x03C8)
        ("omega"   . #x03C9)
        ("omega"   . #x03C9)
        ))

;; Org
(add-hook 'org-mode-hook
 (lambda ()
   (mapc (lambda (pair) (push pair prettify-symbols-alist))
         '(
           ("#+BEGIN_SRC" . #x0192)
           ("#+END_SRC" . #x0192)
           ))))

;; Web
(add-hook 'web-mode-hook
 (lambda ()
   (mapc (lambda (pair) (push pair prettify-symbols-alist))
         '(
           ("function" . #x0192)
           ("class" .    #x039E)
           ("implements" . #x22B4)
           ("export" .   #x21F1)
           ("return" .   #x219E)
           ("this" .     #x21BA)

           ("true" .     #x1E6A)
           ("false" .    #x1E1E)

           ("import" .   #x03A9)
           ("from" .     #x00A7)

           ("for" .      #x2200)
           ("in" .       #x2208)
           ("else if" .  #x00BF)
           ("else" .     #x00BB)
           ("if" .       #x003F)
           ("div" .      #x2023)
           ))))

;; Python
(add-hook 'python-mode-hook
 (lambda ()
   (mapc (lambda (pair) (push pair prettify-symbols-alist))
         '(
           ("def" .      #x0192)
           ("not" .      #x0021)
           ("in" .       #x2208)
           ("not in" .   #x2209)
           ("return" .   #x219E)
           ("yield" .    #x21E0)
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

(provide 'pretty-symbols)
;;; pretty-symbols.el ends here
