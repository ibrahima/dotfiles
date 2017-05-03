;;; package --- My init.el file

;;; Commentary:

;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(alert-default-style (quote libnotify))
 '(android-mode-sdk-dir "~/android/sdk")
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(asm-comment-char 64)
 '(coffee-tab-width 2)
 '(column-number-mode t)
 '(compilation-scroll-output (quote first-error))
 '(custom-safe-themes
   (quote
    ("756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "21d9280256d9d3cf79cbcf62c3e7f3f243209e6251b215aede5026e0c5ad853f" default)))
 '(desktop-restore-eager 10)
 '(eclim-eclipse-dirs
   (quote
    ("/opt/eclipse" "/Applications/eclipse" "/usr/lib/eclipse" "/usr/local/lib/eclipse" "/usr/share/eclipse")))
 '(eclim-executable
   "/home/ibrahim/.eclipse/org.eclipse.platform_4.4.2_1473617060_linux_gtk_x86_64/eclim")
 '(eclimd-default-workspace "~/git")
 '(eclimd-wait-for-process nil)
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-sane-defaults)))
 '(flycheck-checkers
   (quote
    (ada-gnat asciidoc c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint d-dmd emacs-lisp emacs-lisp-checkdoc erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck go-unconvert groovy haml handlebars haskell-stack-ghc haskell-ghc haskell-hlint html-tidy jade javascript-eslint javascript-jshint javascript-gjslint javascript-jscs javascript-standard json-jsonlint json-python-json less lua-luacheck lua perl perl-perlcritic php php-phpmd php-phpcs processing puppet-parser puppet-lint python-flake8 python-pylint python-pycompile r-lintr racket rpm-rpmlint markdown-mdl rst-sphinx rst ruby-rubocop ruby-rubylint ruby ruby-jruby rust-cargo rust sass scala scala-scalastyle scheme-chicken scss-lint scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim slim-lint sql-sqlint tex-chktex tex-lacheck texinfo typescript-tslint verilog-verilator xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby)))
 '(flycheck-rubylintrc "~/.ruby-lint.yml")
 '(flycheck-slim-lint-executable "slim-lint")
 '(flymake-coffee-coffeelint-configuration-file "/home/ibrahim/.coffeelint.json")
 '(httpd-root "~/git/console-mock/")
 '(jdee-server-dir "~/.emacs.d/")
 '(js-indent-level 2)
 '(matlab-completion-technique (quote increment))
 '(matlab-functions-have-end t)
 '(matlab-indent-function-body t)
 '(matlab-keyword-list
   (quote
    ("global" "persistent" "for" "parfor" "while" "spmd" "if" "elseif" "else" "endfunction" "return" "break" "continue" "switch" "case" "otherwise" "try" "catch" "tic" "toc" "classdef" "properties" "methods" "enumeration" "cvx_begin" "cvx_end")))
 '(matlab-mode-install-path
   (quote
    (/home/ibrahim/git/matlab-scripts/ /home/ibrahim/Documents/MATLAB/lightspeed/)))
 '(org-agenda-custom-commands
   (quote
    (("n" "Agenda and all TODO's"
      ((agenda "")
       (alltodo)))
     ("x" "Examgrader" alltodo ""
      ((org-agenda-files
        (quote
         ("~/SparkleShare/braindump/examgrader.org"))))))))
 '(org-agenda-files
   (quote
    ("/home/ibrahim/SparkleShare/braindump/android.org" "/home/ibrahim/SparkleShare/braindump/bb8.org" "/home/ibrahim/SparkleShare/braindump/cf_firmware.org" "/home/ibrahim/SparkleShare/braindump/emacs.org" "/home/ibrahim/SparkleShare/braindump/from-mobile.org" "/home/ibrahim/SparkleShare/braindump/gradescope.org" "/home/ibrahim/SparkleShare/braindump/gradschool.org" "/home/ibrahim/SparkleShare/braindump/groupmeeting.org" "/home/ibrahim/SparkleShare/braindump/iot.org" "/home/ibrahim/SparkleShare/braindump/linux.org" "/home/ibrahim/SparkleShare/braindump/misc.org" "/home/ibrahim/SparkleShare/braindump/neuro.org")))
 '(package-selected-packages
   (quote
    (counsel-projectile helm-open-github dockerfile-mode robe company-lua google-contacts google-maps syslog-mode evil-tutor evil goto-chg company-inf-ruby dumb-jump bundler dired-quick-sort dired-rainbow multi-term nssh ssh-config-mode org pdf-tools company-tern tern fooddice counsel swiper mmm-jinja2 jinja2-mode spotify helm-spotify nlinum terraform-mode mvn slack yaml-mode wsd-mode whitespace-cleanup-mode websocket web-mode web wc-mode visual-regexp-steroids vagrant-tramp vagrant use-package undo-tree turnip tabbar-ruler sws-mode sqlite smex smartparens smart-mode-line smali-mode slime-company slim-mode skewer-mode shorten scala-mode sass-mode rubocop rinari readline-complete react-snippets rbenv rainbow-delimiters pyvenv purty-mode projectile-rails pretty-mode pinboard pg parse-csv paredit-everywhere paradox pandoc-mode org-dashboard nasm-mode multiple-cursors multi-eshell moz-controller mmm-mode markdown-mode mark-multiple malabar-mode magit lxc lui lua-mode litable lcs latex-preview-pane latex-pretty-symbols kv kill-ring-search json-rpc jdee java-snippets jade-mode ipython inf-groovy idomenu ido-ubiquitous iasm-mode hyde httprepl hlinum highlight-indentation helm-ls-git helm-c-yasnippet guile-scheme gscholar-bibtex graphviz-dot-mode gradle-mode go-mode github-theme git-timemachine gist ggtags flycheck-pyflakes flx-ido find-file-in-project expand-region esqlite ensime emacsql emacs-eclim elscreen edit-server edbi-sqlite edbi-minor-mode dropbox dot-mode docbook disaster dired-single dired+ diffview diffscuss-mode diff-hl darkroom csv-mode creole-mode corral company-quickhelp company-jedi company-cider company-anaconda color-identifiers-mode coffee-mode codesearch closure-lint-mode clojure-test-mode clojure-cheatsheet circe bison-mode beacon auto-complete auctex-latexmk ansible android-mode ag ack-and-a-half ack ace-window ace-jump-mode 4clojure 2048-game)))
 '(paradox-automatically-star t)
 '(paradox-execute-asynchronously t)
 '(paradox-github-token "11a0faeff9586db82e7865c4951e8019711ea69d" t)
 '(paradox-spinner-type (quote horizontal-breathing))
 '(pinboard-url "http://feeds.pinboard.in/json/u:ibrahima/?count=10")
 '(projectile-project-root-files-functions
   (quote
    (projectile-root-local projectile-root-bottom-up projectile-root-top-down projectile-root-top-down-recurring)))
 '(ruby-align-chained-calls t)
 '(safe-local-variable-values
   (quote
    ((c-comment-only-line-offset 0 . 0)
     (eval progn
           (defun my/point-in-defun-declaration-p nil
             (let
                 ((bod
                   (save-excursion
                     (c-beginning-of-defun)
                     (point))))
               (<= bod
                   (point)
                   (save-excursion
                     (goto-char bod)
                     (re-search-forward "{")
                     (point)))))
           (defun my/is-string-concatenation-p nil "Returns true if the previous line is a string concatenation"
                  (save-excursion
                    (let
                        ((start
                          (point)))
                      (forward-line -1)
                      (if
                          (re-search-forward " \\+$" start t)
                          t nil))))
           (defun my/inside-java-lambda-p nil "Returns true if point is the first statement inside of a lambda"
                  (save-excursion
                    (c-beginning-of-statement-1)
                    (let
                        ((start
                          (point)))
                      (forward-line -1)
                      (if
                          (search-forward " -> {" start t)
                          t nil))))
           (defun my/trailing-paren-p nil "Returns true if point is a training paren and semicolon"
                  (save-excursion
                    (end-of-line)
                    (let
                        ((endpoint
                          (point)))
                      (beginning-of-line)
                      (if
                          (re-search-forward "[ ]*);$" endpoint t)
                          t nil))))
           (defun my/prev-line-call-with-no-args-p nil "Return true if the previous line is a function call with no arguments"
                  (save-excursion
                    (let
                        ((start
                          (point)))
                      (forward-line -1)
                      (if
                          (re-search-forward ".($" start t)
                          t nil))))
           (defun my/arglist-cont-nonempty-indentation
               (arg)
             (if
                 (my/inside-java-lambda-p)
                 (quote +)
               (if
                   (my/is-string-concatenation-p)
                   16
                 (unless
                     (my/point-in-defun-declaration-p)
                   (quote ++)))))
           (defun my/statement-block-intro
               (arg)
             (if
                 (and
                  (c-at-statement-start-p)
                  (my/inside-java-lambda-p))
                 0
               (quote +)))
           (defun my/block-close
               (arg)
             (if
                 (my/inside-java-lambda-p)
                 (quote -)
               0))
           (defun my/arglist-close
               (arg)
             (if
                 (my/trailing-paren-p)
                 0
               (quote --)))
           (defun my/arglist-intro
               (arg)
             (if
                 (my/prev-line-call-with-no-args-p)
                 (quote ++)
               0))
           (c-set-offset
            (quote inline-open)
            0)
           (c-set-offset
            (quote topmost-intro-cont)
            (quote +))
           (c-set-offset
            (quote statement-block-intro)
            (quote my/statement-block-intro))
           (c-set-offset
            (quote block-close)
            (quote my/block-close))
           (c-set-offset
            (quote knr-argdecl-intro)
            (quote +))
           (c-set-offset
            (quote substatement-open)
            (quote +))
           (c-set-offset
            (quote substatement-label)
            (quote +))
           (c-set-offset
            (quote case-label)
            (quote +))
           (c-set-offset
            (quote label)
            (quote +))
           (c-set-offset
            (quote statement-case-open)
            (quote +))
           (c-set-offset
            (quote statement-cont)
            (quote ++))
           (c-set-offset
            (quote arglist-intro)
            (quote my/arglist-intro))
           (c-set-offset
            (quote arglist-cont-nonempty)
            (quote
             (my/arglist-cont-nonempty-indentation c-lineup-arglist)))
           (c-set-offset
            (quote arglist-close)
            (quote my/arglist-close))
           (c-set-offset
            (quote inexpr-class)
            0)
           (c-set-offset
            (quote access-label)
            0)
           (c-set-offset
            (quote inher-intro)
            (quote ++))
           (c-set-offset
            (quote inher-cont)
            (quote ++))
           (c-set-offset
            (quote brace-list-intro)
            (quote +))
           (c-set-offset
            (quote func-decl-cont)
            (quote ++)))
     (encoding . utf-8)
     (flycheck-disabled-checkers
      (quote ruby-rubylint))
     (projectile-project-root . /home/ibrahim/gradescope/gradescope-app/)
     (projectile-project-root . "/home/ibrahim/gradescope/gradescope-app/")
     (projectile-custom-root . "/home/ibrahim/gradescope/gradescope-app/")
     (projectile-custom-root . "/home/ibrahim/git/gradescope-app/")
     (projectile-custom-root . "~/git/gradescope-app")
     (projectile-custom-root . ~/git/gradescope-app/)
     (eval when
           (and
            (buffer-file-name)
            (file-regular-p
             (buffer-file-name))
            (string-match-p "^[^.]"
                            (buffer-file-name)))
           (emacs-lisp-mode)
           (when
               (fboundp
                (quote flycheck-mode))
             (flycheck-mode -1))
           (unless
               (featurep
                (quote package-build))
             (let
                 ((load-path
                   (cons ".." load-path)))
               (require
                (quote package-build))))
           (package-build-minor-mode)
           (set
            (make-local-variable
             (quote package-build-working-dir))
            (expand-file-name "../working/"))
           (set
            (make-local-variable
             (quote package-build-archive-dir))
            (expand-file-name "../packages/"))
           (set
            (make-local-variable
             (quote package-build-recipes-dir))
            default-directory))
     (comment-start quote @)
     (comment-start . @)
     (TeX-master . "ProbabilityStatistics")
     (TeX-engine . pdflatex)
     (projectile-custom-root . "/home/ibrahim/git/webwork/Webwork_AdaptiveHints/")
     (projectile-custom-root . "/home/ibrahim/git/webwork/Webwork_AdaptiveHints/.git")
     (projectile-custom-root . "/home/ibrahim/git/webwork/Webwork_AdaptiveHints")
     (projectile-custom-root quote /home/ibrahim/git/webwork/Webwork_AdaptiveHints)
     (projectile-custom-root . /home/ibrahim/git/webwork/Webwork_AdaptiveHints)
     (projectile-custom-root . ~/git/webwork/Webwork_AdaptiveHints)
     (setq tab-width 2)
     (setq ruby-indent-tabs-mode nil)
     (ruby-compilation-executable . "ruby")
     (ruby-compilation-executable . "ruby1.8")
     (ruby-compilation-executable . "ruby1.9")
     (ruby-compilation-executable . "rbx")
     (ruby-compilation-executable . "jruby")
     (whitespace-line-column . 80)
     (lexical-binding . t))))
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))

(require 'cl)
(require 'hippie-exp)
(require 'ido)

(load-theme 'deeper-blue)
(ignore-errors
  (load "~/.emacs.d/my-packages.el"))
(ignore-errors
  (load "~/.emacs.d/my-functions.el"))
(load "~/.emacs.d/my-tokens.el")

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

;; (setq default-tab-width 4)

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

(global-set-key (kbd "M-S-<left>")  'windmove-left)
(global-set-key (kbd "M-S-<right>") 'windmove-right)
(global-set-key (kbd "M-S-<up>")    'windmove-up)
(global-set-key (kbd "M-S-<down>")  'windmove-down)

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
;; disable lockfiles
;; see http://www.gnu.org/software/emacs/manual/html_node/emacs/Interlocking.html
(setq create-lockfiles nil)

;; Org mode
(setq org-directory "~/SparkleShare/braindump/")
(setq org-default-notes-file (concat org-directory "notes.org"))
;; (setq org-agenda-files '("~/SparkleShare/braindump"
;;              ))
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

(add-hook 'prog-mode-hook 'linum-mode)

;; (global-linum-mode 1) ;; Global linum mode screws up pdf-view mode
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


; Ace jump mode - jump to anything on the screen easily
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

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
(require 'smtpmail)

(setq
 mu4e-maildir       "~/Maildir"   ;; top-level Maildir
 mu4e-sent-folder   "/ibrahim.awwal@gmail.com/sent"       ;; folder for sent messages
 mu4e-drafts-folder "/ibrahim.awwal@gmail.com/drafts"     ;; unfinished messages
 mu4e-trash-folder  "/ibrahim.awwal@gmail.com/trash"      ;; trashed messages
 mu4e-refile-folder "/ibrahim.awwal@gmail.com/archive"    ;; saved messages
 user-mail-address "ibrahim.awwal@gmail.com"
 smtpmail-default-smtp-server "smtp.gmail.com"
 smtpmail-local-domain "gmail.com"
 smtpmail-smtp-server "smtp.gmail.com"
 smtpmail-stream-type 'starttls
 smtpmail-smtp-service 587
)

(defvar my-mu4e-account-alist
  '(("ibrahim.awwal@gmail.com"
     (mu4e-sent-folder "/ibrahim.awwal@gmail.com/sent")
     (mu4e-drafts-folder "/ibrahim.awwal@gmail.com/drafts")
     (user-mail-address "ibrahim.awwal@gmail.com")
     (smtpmail-default-smtp-server "smtp.gmail.com")
     (smtpmail-local-domain "gmail.com")
     (smtpmail-smtp-server "smtp.gmail.com")
     (smtpmail-smtp-service 587))
    ("iawwal@eng.ucsd.edu"
     (mu4e-sent-folder "/iawwal@eng.ucsd.edu/sent")
     (mu4e-drafts-folder "/iawwal@eng.ucsd.edu/drafts")
     (user-mail-address "iawwal@eng.ucsd.edu")
     (smtpmail-default-smtp-server "smtp.gmail.com")
     (smtpmail-local-domain "eng.ucsd.edu")
     (smtpmail-smtp-server "smtp.gmail.com")
     (smtpmail-smtp-service 587))))

(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var)) my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))

(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)

(setq
 mu4e-get-mail-command "offlineimap"   ;; or fetchmail, or ...
 mu4e-update-interval 300)             ;; update every 5 minutes

(defun json-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)
    )
  )

(defun json-format-jq ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "jq ." (buffer-name) t)
    )
  )
;; (setq window-min-height 0)﻿
(defun tinify-window ()
  (interactive)
  (adjust-window-trailing-edge nil -10000)
  )
(global-set-key (kbd "C-)") 'tinify-window)

;; (add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'company-mode)
(add-hook 'ruby-mode-hook
          (lambda () (rbenv-use-corresponding)))

(add-hook 'coffee-mode-hook
          (lambda () (set-variable 'tab-width 2)))



(add-hook 'coffee-mode-hook 'company-mode)
(add-hook 'coffee-mode-hook 'flymake-mode)
(add-hook 'coffee-mode-hook 'subword-mode)
(add-hook 'after-init-hook 'global-company-mode)
;; (global-set-key "\t" 'company-complete-common)

(add-to-list 'auto-mode-alist '("\\.cjsx\\'" . coffee-mode))

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))

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

;; (ignore-errors
;;   (load "~/git/quickopen/elisp/quickopen.el"))

(display-battery-mode)

(setq c-default-style "linux"
      c-basic-offset 4)
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

(add-hook 'MATLAB-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("\\<\\(FIXME\\|TODO\\|BUG\\)" 1 font-lock-warning-face t)))))

(defun highlight-todos ()
  (font-lock-add-keywords nil
                          '(("\\<\\(FIXME\\|TODO\\|BUG\\)" 1 font-lock-warning-face t))))
(add-hook 'prog-mode-hook 'highlight-todos)

(global-set-key (kbd "C-9") 'sp-backward-slurp-sexp)
(global-set-key (kbd "C-0") 'sp-forward-slurp-sexp)

(global-set-key (kbd "C-(") 'sp-backward-barf-sexp)
(global-set-key (kbd "C-)") 'sp-forward-barf-sexp)

; Persist org mode clocking history over sessions
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(setq explicit-shell-file-name "bash")
(setq explicit-bash-args '("-c" "export EMACS=; stty echo; bash"))
(setq comint-process-echoes t)

(add-hook 'rlc-no-readline-hook (lambda () (company-mode -1)))

(defun shell-mode-keys ()
  "Modify keymaps used by `shell-mode'."
  (local-set-key "\t" 'company-complete-common)
  (local-set-key (kbd "TAB") 'company-complete-common)
  (local-set-key (kbd "[TAB]") 'company-complete-common)
  )

(global-set-key (kbd "C-c g") 'magit-status)
(add-hook 'term-mode-hook (lambda () (setq term-buffer-maximum-size 8192) ))
(add-hook 'comint-mode-hook 'shell-mode-keys)
(put 'erase-buffer 'disabled nil)

;; Lets you type commands like in vim, without holding ctrl
;; (require 'god-mode)
(global-set-key (kbd "C-x C-1") 'delete-other-windows)
(global-set-key (kbd "C-x C-2") 'split-window-below)
(global-set-key (kbd "C-x C-3") 'split-window-right)
(global-set-key (kbd "C-x C-0") 'delete-window)

;; SOURCE: `http://wenshanren.org/?p=298'
(defun edit-current-file-as-root ()
  "Edit the file that is associated with the current buffer as root"
  (interactive)
  (if (buffer-file-name)
      (progn
        (setq file (concat "/sudo:root@localhost:" (buffer-file-name)))
        (find-file file))
    (message "Current buffer does not have an associated file.")))

;; (setq-default show-trailing-whitespace nil)

(defun set-show-trailing-whitespace ()
  "Set 'show-trailing-whitespace' to true."
  (setq show-trailing-whitespace t)
  )

(global-diff-hl-mode t)
;; (global-git-gutter-mode t)
;; (git-gutter:linum-setup)

(add-hook 'prog-mode-hook 'set-show-trailing-whitespace)

;; Auto revert log files
(add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-mode))

(setq nxml-slash-auto-complete-flag t)


(add-hook 'elpy-mode-hook
          (lambda()
            (define-key elpy-mode-map (kbd "<C-left>") nil)
            (define-key elpy-mode-map (kbd "<C-right>") nil)))

;; (require 'company-emacs-eclim)
;; (company-emacs-eclim-setup)

;; (pdf-tools-install)

;; (add-hook 'prog-mode-hook #'hs-minor-mode)

(add-hook 'after-init-hook #'global-flycheck-mode)

(setq flycheck-disabled-checkers '(ruby-rubylint))

;; Colors in term-mode
(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq sml/no-confirm-load-theme t)
(sml/setup)

;; (setq yas-snippet-dirs
;;       '("~/.emacs.d/snippets"                 ;; personal snippets
;;         "~/.emacs.d/yas-snippets"             ;; the default collection
;;         ))

;; (yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.

;; (add-to-list 'yas/root-directory "~/.emacs.d/yasnippet-snippets/")
;; (yas/initialize)

;; (defun my/python-mode-hook ()
;;   (add-to-list 'company-backends 'company-jedi))

;; (add-hook 'python-mode-hook 'my/python-mode-hook)

;; enable inline images
(setq mu4e-view-show-images t)
;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
   (imagemagick-register-types))


;; don't confirm opening large files
(setq large-file-warning-threshold nil)

(defun bury-compile-buffer-if-successful (buffer string)
  "Bury a compilation buffer if succeeded without warnings "
  (if (and
       (string-match "compilation" (buffer-name buffer))
       (string-match "finished" string)
       (not
        (with-current-buffer buffer
          (goto-char 1)
          (search-forward "warning" nil t)))
       (not
        (with-current-buffer buffer
          (goto-char 1)
          (search-forward "magit" nil t))))
      (run-with-timer 0 nil
                      (lambda (buf)
                        (bury-buffer buf)
                        (switch-to-prev-buffer (get-buffer-window buf) 'kill))
                      buffer)))
(add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)

(latex-preview-pane-enable)

(defun asm-calculate-indentation ()
  (or
   ;; Flush labels to the left margin.
   (and (looking-at "\\(\\sw\\|\\s_\\)+:") 0)
   ;; Same thing for `;;;' comments.
   (and (looking-at "\\s<\\s<\\s<") 0)
   ;; And .directives
   (and (looking-at "\\..*") 0)
   ;; Simple `;' comments go to the comment-column.
   (and (looking-at "\\s<\\(\\S<\\|\\'\\)") comment-column)
   ;; The rest goes at the first tab stop.
   (or (car tab-stop-list) tab-width)))

(defun my-asm-mode-hook ()
  ;; you can use `comment-dwim' (M-;) for this kind of behaviour anyway
  (local-unset-key (vector asm-comment-char))
  ;; asm-mode sets it locally to nil, to "stay closer to the old TAB behaviour".
  (setq tab-always-indent (default-value 'tab-always-indent)))

(add-hook 'asm-mode-hook #'my-asm-mode-hook)

;; (load "~/.emacs.d/smali-mode.el")
;; (require 'smali-mode)
;; (autoload 'smali-mode "smali-mode" "Major mode for editing and viewing smali issues" t)
;; (add-to-list 'auto-mode-alist '(".smali$" . smali-mode))

;; For trackpad/trackpoint scrolling
(global-set-key (kbd "<mouse-6>") 'scroll-right)
(global-set-key (kbd "<mouse-7>") 'scroll-left)

(put 'scroll-left 'disabled nil)

;; (load "~/.emacs.d/magit-gh-pulls/magit-gh-pulls.el")
;; (require 'magit-gh-pulls)
;; (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)
(remove-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)

(add-hook 'ruby-mode-hook 'subword-mode)

; This is for pronto/linter output
(add-to-list 'compilation-error-regexp-alist '("^\\(.*?\\):\\([0-9]+\\)" 1 2))

(defun esk-paredit-nonlisp ()
  "Turn on paredit mode for non-lisps."
  (set (make-local-variable paredit-space-delimiter-chars) (list ?\"))
  (paredit-mode +1))

(defun gist-paredit-nonlisp ()
  "Turn on paredit mode for non-lisps."
  (add-to-list (make-local-variable 'paredit-space-for-delimiter-predicates)
               (lambda (_ _) nil))
  (enable-paredit-mode))

(require 'flycheck)
(flycheck-define-checker ruby-reek
  "A Ruby smell checker using reek
See URL `https://github.com/troessner/reek'."
  :command ("reek" "--format=xml"
            source)
  :standard-input t
  :error-parser flycheck-parse-checkstyle
  :modes (enh-ruby-mode ruby-mode))

(add-to-list 'flycheck-checkers 'ruby-reek 'append)

(flycheck-add-next-checker 'ruby-rubocop '(t . ruby-reek) t)

(setq ruby-insert-encoding-magic-comment nil)

;; (flycheck-define-checker rails-bp
;;   "Rails best practices checker
;; See URL `https://github.com/troessner/reek'."
;;   :command ("rails_best_practices"
;;             source-original)
;;   :error-parser flycheck-parse-with-patterns
;;   :error-patterns ((warning line-start (file-name) ":" line " - " (message) line-end)
;;                    )
;;   :modes (enh-ruby-mode ruby-mode)
;;   :next-checkers ((info . ruby-reek)))



;; (add-to-list 'flycheck-checkers 'rails-bp)


(setq css-indent-offset 2)

(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))


(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)

(global-set-key (kbd "C-<tab>") 'hs-toggle-hiding)

(eval-after-load "hideshow"
  '(add-to-list 'hs-special-modes-alist
    `(ruby-mode
      ,(rx (or "def" "class" "module" "do" "{" "[")) ; Block start
      ,(rx (or "}" "]" "end"))                       ; Block end
      ,(rx (or "#" "=begin"))                        ; Comment start
      ruby-forward-sexp nil)))

(provide 'init)
;;; init.el ends here
