;; (ignore-errors
;;   (load-file "~/.emacs.d/cedet-1.1/common/cedet.el"))


(load "~/.emacs.d/my-packages.el")
(load "~/.emacs.d/my-functions.el")

(require 'hippie-exp)

(require 'ido)
(ido-mode t)
(ido-everywhere)
; (setq ido-enable-flex-matching t)
(flx-ido-mode t)
; (setq ido-use-faces nil)
; Desktop mode saves your emacs session and restores it when you start emacs
(desktop-save-mode 1)
(projectile-global-mode)

(setenv "PAGER" (executable-find "cat"))

(ignore-errors
  (require 'rosemacs)
  (invoke-rosemacs))

(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

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

;; (global-set-key "\C-c,c" 'semantic-ia-fast-jump)

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
(setq org-directory "~/SparkleShare/braindump/")
(setq org-agenda-files '("~/SparkleShare/braindump"
						 ))
(setq org-todo-keywords
	  '((sequence "TODO" "WIP" "|" "DONE")))

;; (global-ede-mode t)

; Semantic stuff
;; (semantic-load-enable-excessive-code-helpers)
;; (require 'semantic-ia)
;; (require 'semantic-gcc)
;; (semantic-add-system-include "/usr/include" 'c++-mode)

;; (ede-cpp-root-project "Bulletsim"
;;                 :name "Bulletsim"
;;                 :file "~/research/bulletsim/CMakeLists.txt"
;;                 :include-path '("/src"
;;                                 "/src/sqp"
;;                                 "/src/moveit"
;;                                 "/src/roots"
;;                                 "/src/simulation"
;;                                )
;;                 :system-include-path '("/opt/gurobi501/linux64/include")
;;                 :spp-table '(("isUnix" . "")
;;                              ("BOOST_TEST_DYN_LINK" . "")))

;; (ede-cpp-root-project "Trajopt"
;;                 :name "trajopt"
;;                 :file "~/research/trajopt/CMakeLists.txt"
;;                 :include-path '("/src"
;;                                 "/src/ipi"
;;                                 "/src/ipi/sco"
;;                                 "/src/utils"
;;                                 "/src/trajopt"
;;                                )
;;                 :system-include-path '("/opt/gurobi501/linux64/include")
;;                 :spp-table '(("isUnix" . "")
;;                              ("BOOST_TEST_DYN_LINK" . "")))

(global-unset-key (kbd "<mouse-2>"))

;; (defun my-cedet-hook ()
;;   (local-set-key [(control return)] 'semantic-ia-complete-symbol)
;;   (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
;;   (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
;;   (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
;;   (local-set-key (kbd "<mouse-2>") 'semantic-ia-fast-jump))
;; (add-hook 'c-mode-common-hook 'my-cedet-hook)

(global-linum-mode 1)
(show-paren-mode 1)

(require 'undo-tree)
(global-undo-tree-mode 1)

(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
(global-set-key (kbd "C-S-z") 'redo) ; 【Ctrl+Shift+z】

(setq mouse-autoselect-window t)

; MobileOrg
(if (eq system-type 'windows-nt)
    (setq org-mobile-directory "f:/Dropbox/MobileOrg")
  (setq org-mobile-directory "~/Dropbox/MobileOrg"))
(setq org-mobile-inbox-for-pull (concat (file-name-as-directory org-mobile-directory) "from-mobile.org"))

; OpenRAVE include paths, can't believe I didn't know about this though it was right on the site
(defun openrave-package-path ()
  (save-excursion
    (with-temp-buffer
      (call-process "openrave-config" nil t nil "--cflags-only-I")
      (goto-char (point-min))
      (re-search-forward "^-I\\(.*\\)[ \\|$]")
      (match-string 1))))

;; (setq openrave-base-dir (openrave-package-path))
;; (semantic-add-system-include openrave-base-dir 'c++-mode)
;; (semantic-add-system-include openrave-base-dir 'c-mode)
;; (add-to-list 'auto-mode-alist (cons openrave-base-dir 'c++-mode))
;; (add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat openrave-base-dir "/openrave/config.h"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(column-number-mode t)
 '(custom-safe-themes (quote ("21d9280256d9d3cf79cbcf62c3e7f3f243209e6251b215aede5026e0c5ad853f" default)))
 '(flymake-coffee-coffeelint-configuration-file "/home/ibrahim/.coffeelint.json")
 '(org-agenda-custom-commands (quote (("n" "Agenda and all TODO's" ((agenda "") (alltodo))) ("x" "Examgrader" alltodo "" ((org-agenda-files (quote ("~/SparkleShare/braindump/examgrader.org"))))))))
 '(safe-local-variable-values (quote ((setq tab-width 2) (setq ruby-indent-tabs-mode nil) (ruby-compilation-executable . "ruby") (ruby-compilation-executable . "ruby1.8") (ruby-compilation-executable . "ruby1.9") (ruby-compilation-executable . "rbx") (ruby-compilation-executable . "jruby") (whitespace-line-column . 80) (lexical-binding . t))))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))

; Ace jump mode - jump to anything on the screen easily
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(load-theme 'deeper-blue)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; (defun org-mobile-push-with-delay (secs)
;;   (when org-mobile-push-timer
;;     (cancel-timer org-mobile-push-timer))
;;   (setq org-mobile-push-timer
;;         (run-with-idle-timer
;;          (* 1 secs) nil 'org-mobile-push)))

;; (add-hook 'after-save-hook
;;  (lambda ()
;;    (when (eq major-mode 'org-mode)
;;      (dolist (file (org-mobile-files-alist))
;;        (if (string= (expand-file-name (car file)) (buffer-file-name))
;;            (org-mobile-push-with-delay 30)))
;;    )))

;; (run-at-time "00:05" 86400 '(lambda () (org-mobile-push-with-delay 1))) ;; refreshes agenda file each day

;; (defun install-monitor (file secs)
;;   (run-with-timer
;;    0 secs
;;    (lambda (f p)
;;      (unless (< p (second (time-since (elt (file-attributes f) 5))))
;;        (org-mobile-pull)))
;;    file secs))

;; (install-monitor (file-truename
;;                   (concat
;;                    (file-name-as-directory org-mobile-directory)
;;                           "from-mobile.org"))
;;                  5)

;; Do a pull every 5 minutes to circumvent problems with timestamping
;; (ie. dropbox bugs)
;; (run-with-timer 0 (* 5 60) 'org-mobile-pull)

;; Don't open a new frame for edit server, really annoying for tiling
;; window managers
(setq edit-server-new-frame nil)

;; (auto-indent-global-mode)

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(require 'mu4e)

(setq
 mu4e-maildir       "~/Maildir"   ;; top-level Maildir
 mu4e-sent-folder   "/sent"       ;; folder for sent messages
 mu4e-drafts-folder "/drafts"     ;; unfinished messages
 mu4e-trash-folder  "/trash"      ;; trashed messages
 mu4e-refile-folder "/archive")   ;; saved messages

(setq
 mu4e-get-mail-command "offlineimap"   ;; or fetchmail, or ...
 mu4e-update-interval 300)             ;; update every 5 minutes

(defun json-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)
    )
  )
;; (setq window-min-height 0)﻿
(defun tinify-window ()
  (interactive)
  (adjust-window-trailing-edge nil -10000)
  )
(global-set-key (kbd "C-)") 'tinify-window)

(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'company-mode)
(add-hook 'ruby-mode-hook
          (lambda () (rbenv-use-corresponding)))

(add-hook 'coffee-mode-hook
          (lambda () (set-variable 'tab-width 2)))

(add-hook 'coffee-mode-hook 'company-mode)
(add-hook 'coffee-mode-hook 'flymake-mode)

(smartparens-global-mode t)

(defun emacs-process-p (pid)
  "If pid is the process ID of an emacs process, return t, else nil.
Also returns nil if pid is nil."
  (when pid
    (let* ((cmdline-file (concat "/proc/" (int-to-string pid) "/cmdline")))
      (when (file-exists-p cmdline-file)
        (with-temp-buffer
          (insert-file-contents-literally cmdline-file)
          (goto-char (point-min))
          (search-forward "emacs" nil t)
          pid)))))

(defadvice desktop-owner (after pry-from-cold-dead-hands activate)
  "Don't allow dead emacsen to own the desktop file."
  (when (not (emacs-process-p ad-return-value))
    (setq ad-return-value nil)))

(ignore-errors
   (load-file "~/git/codesearch.el/codesearch.el"))

(ignore-errors
  (load "~/git/quickopen/elisp/quickopen.el"))

(display-battery-mode)

(add-to-list 'load-path "~/.emacs.d/matlab-emacs")
(load-library "matlab-load")
(matlab-cedet-setup)
(add-hook 'matlab-mode
          (lambda ()
            (auto-complete-mode 1)
            ))

(setq TeX-auto-save t)
(setq TeX-save-query nil)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'MATLAB-mode-hook
          (lambda () (local-set-key (kbd "C-0") #'run-latexmk)))

(add-hook 'prog-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))
