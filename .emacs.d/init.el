(load-file "~/.emacs.d/cedet-1.1/common/cedet.el")

(require 'package)
(package-initialize)

(add-to-list 'package-archives 
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(require 'hippie-exp)

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

(require 'uniquify) 
(setq 
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

(defun load-init-el ()
  "Loads init.el"
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun find-init-el ()
  "Finds init.el"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(windmove-default-keybindings 'meta)

;; Beginning of the el4r block:
;; RCtool generated this block automatically. DO NOT MODIFY this block!
;(add-to-list 'load-path "/home/ibrahim/.rvm/rubies/ruby-1.9.3-p125/share/emacs/site-lisp")
;(require 'el4r)
;(el4r-boot)
;; End of the el4r block.
;; User-setting area is below this line.

(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))

(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/saves" t)))

(global-ede-mode t)

; Semantic stuff
(semantic-load-enable-excessive-code-helpers)
(require 'semantic-ia)
(require 'semantic-gcc)
(semantic-add-system-include "/usr/include" 'c++-mode)

(ede-cpp-root-project "Bulletsim"
                :name "Bulletsim"
                :file "~/research/bulletsim/CMakeLists.txt"
                :include-path '("/"
                                "/src"
                               )
                :system-include-path '("/opt/gurobi501/linux64/include")
                :spp-table '(("isUnix" . "")
                             ("BOOST_TEST_DYN_LINK" . "")))

(global-unset-key (kbd "<mouse-2>"))

(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key (kbd "<mouse-2>") 'semantic-ia-fast-jump))
(add-hook 'c-mode-common-hook 'my-cedet-hook)

(global-linum-mode 1)
(show-paren-mode 1)

(require 'undo-tree)
(global-undo-tree-mode 1)

(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
(global-set-key (kbd "C-S-z") 'redo) ; 【Ctrl+Shift+z】

; MobileOrg
(setq org-mobile-directory "~/Dropbox/Org")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-safe-themes (quote ("21d9280256d9d3cf79cbcf62c3e7f3f243209e6251b215aede5026e0c5ad853f" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

