(require 'package)
;;; Code:

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Add in your own as you wish:
(defvar my-packages '(
                      ack
                      auto-complete
                      clojure-mode
                      company
                      company-inf-ruby
                      company-lua
                      edit-server ;; Lets you edit text fields in Chrome using emacs
                      elscreen
                      expand-region
                      flx
                      flx-ido
                      gist
                      go-mode
                      helm
                      helm-c-yasnippet
                      helm-ls-git
                      kill-ring-search
                      lua-mode
                      mark-multiple
                      sass-mode
                      smex
                      tabbar-ruler
                      undo-tree
                      yaml-mode
                      yasnippet
                      )
  "A list of packages to ensure are installed at launch.")

(require 'cl) ;; A lot of packages need cl but don't require it

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'use-package)

(setq use-package-always-ensure t)

(use-package magit
  :config
  (magit-define-popup-switch 'magit-log-popup
    ?v "Reverse log" "--reverse")
  )

(use-package projectile
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
  (counsel-projectile-mode +1)
  )


(use-package projectile-rails
  :config
  (define-key projectile-rails-mode-map (kbd "C-c r H") 'hydra-projectile-rails/body)
  )

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go))
  :config (setq dumb-jump-selector 'ivy)
  )

(use-package pdf-tools
             :config
             ;; (pdf-tools-install)
             :ensure t
)

(use-package smart-mode-line
  :defer 5
  :config
  (sml/setup)
  )

(use-package csv-mode)

(use-package groovy-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.gradle$" . groovy-mode))
  )

(use-package gradle-mode)

;; (use-package robe)

(use-package visual-regexp
  :bind (("C-c r" . vr/replace)
         ("C-c q" . vr/query-replace)
         ("C-c m" . vr/mc-mark))
  )

(use-package visual-regexp-steroids)

;; (use-package god-mode
;;   :ensure t
;;   :config
;;   (global-set-key (kbd "<escape>") 'god-local-mode)
;;   (define-key god-local-mode-map (kbd "i") 'god-local-mode)
;;   (defun my-update-cursor ()
;;     (setq cursor-type (if (or god-local-mode buffer-read-only)
;;                           'box
;;                         'bar)))

;;   (add-hook 'god-mode-enabled-hook 'my-update-cursor)
;;   (add-hook 'god-mode-disabled-hook 'my-update-cursor)
;; )

(use-package wc-mode)

(use-package multiple-cursors
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
  )

(use-package ein)

(use-package smartparens
  :config
  (require 'smartparens)
  (require 'smartparens-html)
  (smartparens-global-mode t))

(use-package skewer-mode
  :config
  (add-hook 'css-mode-hook 'skewer-css-mode)
  (add-hook 'html-mode-hook 'skewer-html-mode)
)

(use-package js2-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
  (add-hook 'js2-mode-hook 'skewer-mode)
  (add-hook 'js2-mode-hook (lambda () (setq js-switch-indent-offset 2)))
  )

(use-package js2-refactor
  :config
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  )
(use-package vagrant-tramp
  :config
  (eval-after-load 'tramp
    '(vagrant-tramp-enable)))

(use-package codesearch)

(use-package eclim
  :config
  (require 'eclimd))

(use-package ensime
  :config
  (add-hook 'scala-mode-hook 'ensime-scala-mode-hook))

(use-package corral
  :config
  (global-set-key (kbd "M-9") 'corral-parentheses-backward)
  (global-set-key (kbd "M-0") 'corral-parentheses-forward)
  ;; (global-set-key (kbd "M-[") 'corral-brackets-backward)
  ;; (global-set-key (kbd "M-]") 'corral-brackets-forward)
  (global-set-key (kbd "M-{") 'corral-braces-backward)
  (global-set-key (kbd "M-}") 'corral-braces-forward)
  (global-set-key (kbd "M-\"") 'corral-double-quotes-backward))

;; (use-package slack
;;   :commands (slack-start)
;;   :init
;;   (setq slack-enable-emoji t) ;; if you want to enable emoji, default nil
;;   (setq slack-room-subscription '(general slackbot))
;;   (setq slack-client-id "2896257985.20364130438")
;;   (setq slack-client-secret "3d5cb7a3e53183475bc021d1e723968b")
;;   (setq slack-token "xoxp-2896257985-13136753316-20364228934-f601a776cc"))
;; (setq slack-user-name "ibrahim-emacs")

(use-package coffee-mode
  :init
  (setq coffee-indenters-bol
  '("class" "for" "if" "else" "unless" "while" "until"
                               "try" "catch" "finally" "switch" "when"))
  (setq coffee-indenters-eol '(?> ?{ ?\[ ?:)))

(use-package dired-quick-sort
  :init
  (dired-quick-sort-setup)
  )

(use-package paradox)

(use-package avy)
(use-package counsel)
(use-package counsel-projectile)
(use-package ivy)
(use-package swiper)
(use-package ag)

(use-package ansible)
(use-package alert)
(use-package bundler)

(use-package dash-functional)
(use-package diff-hl)
(use-package diffview)
(use-package dired-rainbow)
(use-package dired-quick-sort)
(use-package dockerfile-mode)
(use-package flycheck)
(use-package git-timemachine)
(use-package jinja2-mode)
(use-package json-mode)
(use-package json-reformat)
(use-package jump)
(use-package js2-refactor)
(use-package js2-highlight-vars)


(use-package latex-preview-pane)
(use-package multi-term)
(use-package nlinum)
(use-package rainbow-delimiters)
(use-package rbenv)
(use-package rjsx-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
  )
(use-package slim-mode)
(use-package simple-httpd)
(use-package ssh-config-mode)
(use-package syslog-mode)
(use-package terraform-mode)
(use-package typescript-mode)
(use-package tide)
(use-package vagrant)
(use-package wc-mode)
(use-package helm-open-github)
(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (add-hook 'web-mode-hook
            (lambda ()
              (when (string-equal "tsx" (file-name-extension buffer-file-name))
                (setup-tide-mode))))
  )
(use-package zoom-frm)

(use-package ruby-block)

(add-to-list 'load-path "/home/ibrahim/.emacs.d/emacs-libvterm")
(require 'vterm)
;; (elpy-enable)

(provide 'my-packages)
;;; my-packages.el ends here
