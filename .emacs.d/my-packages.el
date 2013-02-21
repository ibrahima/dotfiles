(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))


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
                      )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
