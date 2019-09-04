# My Emacs Configuration
> I love emacs. Lets share the love! If you are new to emacs check out the [Emacs Website](https://www.gnu.org/software/emacs/).

![made-with-emacs](https://img.shields.io/badge/Made%20with-Emacs%20Lisp-8b0000.svg)

## How to use

1. Clone repo to ~/.emacs.d

```bash
git clone https://github.com/jessekelly881/.emacs.d ~/.emacs.d
```

2. Run emacs

```bash
emacs
```

**Warning** If you already have an emacs config be sure to back it up first.


## Contributing

If you wish to contribute please contact me at kellyjesse881@gmail.com or create a push request. I will try to review as quickly as possible.


## Some Useful Snippets

It is always enlightening to see other developers emacs config so here are a few code snippets that have been incredibly useful for me.

**Warning** I use emacs exclusively in the terminal with no GUI mode so these snippets may not play well with the GUI. You have been warned. Now, enjoy!

### Transparent Background
```lisp
(defun on-frame-open (&optional frame)
  "If the FRAME created in terminal don't load background color."
  (unless (display-graphic-p frame)
    (set-face-background 'default "unspecified-bg" frame)
    (set-face-background 'font-lock-comment-face "unspecified-bg" frame)
    (set-face-foreground 'linum "unspecified-bg" frame)
    ))

(add-hook 'after-make-frame-functions 'on-frame-open)
```
