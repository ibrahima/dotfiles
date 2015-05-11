(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Add in your own as you wish:
(defvar my-packages '(
                      go-mode
                      scala-mode
                      clojure-mode
                      yasnippet
                      magit
                      auto-complete
                      expand-region
                      mark-multiple
                      scss-mode
                      undo-tree
                      kill-ring-search
                      coffee-mode
                      ack
                      ack-and-a-half
                      helm
                      helm-ls-git
                      helm-c-yasnippet
                      elscreen
                      ido-ubiquitous
                      multi-eshell
                      gist
                      dired+
                      sass-mode
                      yaml-mode
                      edit-server ;; Lets you edit text fields in
    ;; Chrome using emacs
                      flx
                      flx-ido
                      smex
                      projectile
                      company
                      tabbar-ruler
                      smartparens
                      lua-mode
                      )
  "A list of packages to ensure are installed at launch.")

(require 'cl) ;; A lot of packages need cl but don't require it

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
(require 'use-package)
(use-package pdf-tools
             :config
             (pdf-tools-install)
             :ensure t)
(use-package smart-mode-line
  :defer 5
  :config
  (sml/setup)
  )

(use-package csv-mode)

(use-package scala-mode2)

(use-package groovy-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.gradle$" . groovy-mode))
  )

(use-package gradle-mode)

(use-package robe)

(use-package visual-regexp)

(use-package visual-regexp-steroids)

(use-package god-mode
  :ensure t
  :config
  (global-set-key (kbd "<escape>") 'god-local-mode)
  (define-key god-local-mode-map (kbd "i") 'god-local-mode)
  (defun my-update-cursor ()
    (setq cursor-type (if (or god-local-mode buffer-read-only)
                          'box
                        'bar)))

  (add-hook 'god-mode-enabled-hook 'my-update-cursor)
  (add-hook 'god-mode-disabled-hook 'my-update-cursor)
)

(use-package wc-mode)

(use-package multiple-cursors
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
  )

(use-package ein)

(use-package smartparens)

(use-package skewer-mode
  :config
  (add-hook 'css-mode-hook 'skewer-css-mode)
  (add-hook 'html-mode-hook 'skewer-html-mode)
)

(use-package js2-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
  (add-hook 'js2-mode-hook 'skewer-mode)
  )

(use-package vagrant-tramp
  :config
  (eval-after-load 'tramp
    '(vagrant-tramp-enable)))
;; (elpy-enable)
