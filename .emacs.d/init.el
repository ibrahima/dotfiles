(require 'package)
(package-initialize)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(if (display-graphic-p)
    (require 'color-theme)
  (eval-after-load "color-theme"
    '(progn
       (color-theme-initialize)
       (color-theme-subtle-hacker))))

(setq indent-tabs-mode nil)
(setq require-final-newline nil)

(add-hook 'python-mode-hook '(lambda () 
 (setq python-indent 4)))

;; Python Hook
(add-hook 'python-mode-hook
          (function (lambda ()
                      (setq indent-tabs-mode nil
                            tab-width 4))))

(column-number-mode)
(require 'tabbar)
(tabbar-mode)

;; Beginning of the el4r block:
;; RCtool generated this block automatically. DO NOT MODIFY this block!
;(add-to-list 'load-path "/home/ibrahim/.rvm/rubies/ruby-1.9.3-p125/share/emacs/site-lisp")
;(require 'el4r)
;(el4r-boot)
;; End of the el4r block.
;; User-setting area is below this line.

(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))
