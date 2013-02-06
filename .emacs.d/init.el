(ignore-errors
  (load-file "~/.emacs.d/cedet-1.1/common/cedet.el"))

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

; Desktop mode saves your emacs session and restores it when you start emacs
(desktop-save-mode 1)

(ignore-errors
  (require 'rosemacs)
  (invoke-rosemacs))
;; Color theme is not used in emacs 24
;; (if (display-graphic-p)
;;     (require 'color-theme)
;;   (eval-after-load "color-theme"
;;     '(progn
;;        (color-theme-initialize)
;;        (color-theme-subtle-hacker))))

(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq-default tab-width 2)
(setq require-final-newline nil)

(add-hook 'python-mode-hook '(lambda () 
 (setq python-indent 4)))

(setq default-tab-width 4)

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

(add-hook 'c-mode-common-hook
  (lambda() 
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

(windmove-default-keybindings 'meta)

(xterm-mouse-mode)

;; Global key bindings
;;; Org mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;;; Compilation
(global-set-key (kbd "<f5>") 'compile)

(global-set-key "\C-c,c" 'semantic-ia-fast-jump)

;; Use my bash env in shells (such as for M-x compile)
;; This slows down the launch a little but in my case I have an alias for make
;; that automatically parallelizes builds, plus this is more reproducible
;; [Commented out for now because it's slow, but I might want it later]
; (setq shell-file-name "bash")
; (setq shell-command-switch "-ic")

;; Beginning of the el4r block:
;; RCtool generated this block automatically. DO NOT MODIFY this block!
;(add-to-list 'load-path "/home/ibrahim/.rvm/rubies/ruby-1.9.3-p125/share/emacs/site-lisp")
;(require 'el4r)
;(el4r-boot)
;; End of the el4r block.
;; User-setting area is below this line.

(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))

(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/saves" t)))

;; Org mode
(setq org-agenda-files '("~/SparkleShare/braindump"
						 ))
(setq org-todo-keywords
	  '((sequence "TODO" "WIP" "|" "DONE")))

(global-ede-mode t)

; Semantic stuff
(semantic-load-enable-excessive-code-helpers)
(require 'semantic-ia)
(require 'semantic-gcc)
(semantic-add-system-include "/usr/include" 'c++-mode)

(ede-cpp-root-project "Bulletsim"
                :name "Bulletsim"
                :file "~/research/bulletsim/CMakeLists.txt"
                :include-path '("/src"
                                "/src/sqp"
                                "/src/moveit"
                                "/src/roots"
                                "/src/simulation"
                               )
                :system-include-path '("/opt/gurobi501/linux64/include")
                :spp-table '(("isUnix" . "")
                             ("BOOST_TEST_DYN_LINK" . "")))

(ede-cpp-root-project "Trajopt"
                :name "trajopt"
                :file "~/research/trajopt/CMakeLists.txt"
                :include-path '("/src"
                                "/src/ipi"
                                "/src/ipi/sco"
                                "/src/utils"
                                "/src/trajopt"
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

(setq mouse-autoselect-window t)

; MobileOrg
(setq org-mobile-directory "~/Dropbox/Org")

; OpenRAVE include paths, can't believe I didn't know about this though it was right on the site
(defun openrave-package-path ()
  (save-excursion
    (with-temp-buffer
      (call-process "openrave-config" nil t nil "--cflags-only-I")
      (goto-char (point-min))
      (re-search-forward "^-I\\(.*\\)[ \\|$]")
      (match-string 1))))

(setq openrave-base-dir (openrave-package-path))
(semantic-add-system-include openrave-base-dir 'c++-mode)
(semantic-add-system-include openrave-base-dir 'c-mode)
(add-to-list 'auto-mode-alist (cons openrave-base-dir 'c++-mode))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat openrave-base-dir "/openrave/config.h"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-safe-themes (quote ("21d9280256d9d3cf79cbcf62c3e7f3f243209e6251b215aede5026e0c5ad853f" default)))
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; Ace jump mode - jump to anything on the screen easily
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

