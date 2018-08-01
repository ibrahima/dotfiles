;;; package --- Some functions I wrote

;;; Commentary:

(require 'cl-lib)

;;; Code:
(defun how-many-str (regexp str)
  ;; From http://stackoverflow.com/a/11848341
  (cl-loop with start = 0
           for count from 0
           while (string-match regexp str start)
           do (setq start (match-end 0))
           finally return count))

(defun insert-savefig ()
  (interactive)
  (let ((figcount ( + 1 (how-many-str "savefig" (buffer-substring-no-properties 1 (window-point))))))

    (insert
     (format "savefig(gcf, %d);\n" figcount))
    (save-excursion
      (cl-loop with start = (window-point)
               for count from (+ 1 figcount)
               while (re-search-forward "savefig(\\([[:alnum:]]+\\),[[:space:]]*\\([[:digit:]]+\\))" nil t)
               do
               (setq start (match-end 0))
               (replace-match (format "savefig(\\1, %d)" count) )
               finally return count)
      )
    )
  )


(defun import-figures-from-m-file (m-file)
  (interactive
   (list (ido-completing-read "M-file: "(directory-files "." nil ".*\.m$"))
         ))
  (let ((mbuf (find-file-noselect m-file))
        (cbuf (current-buffer)))
    (set-buffer mbuf)
    (let ((mcontents (buffer-string)))
      (set-buffer cbuf)
      (setq figurecount (cl-loop with start = 0
                                 for count from 0
                                 ;; TODO: This stuff could just use save-excursion rather than string-match
                                 while (string-match "savefig(\\([[:alnum:]]+\\),[[:space:]]*\\([[:digit:]]+\\))" mcontents start)
                                 do
                                 (setq start (match-end 0))
                                 (let ((fignum (match-string 2 mcontents))
                                       (savefig-char (match-beginning 0))
                                       )
                                   (save-excursion
                                     (save-excursion
                                       (set-buffer mbuf)
                                       (goto-char (+ 1 savefig-char))
                                       (re-search-backward (rx "'" (group-n 1 (+ printing)) "'"))
                                       (setq titlestring (match-string 1) )
                                       )
                                     )
                                   (if (= (mod count 2) 0)
                                       (insert (format "
\\begin{figure}[!ht]
  \\begin{minipage}[b]{0.5\\linewidth}
    \\centering
    \\includegraphics[width=\\linewidth]{fig%s}
    \\caption{$%s$}
    \\label{fig:%s}
  \\end{minipage}
  \\hspace{0.5cm}" fignum titlestring fignum))
                                     (insert (format "
  \\begin{minipage}[b]{0.5\\linewidth}
    \\centering
    \\includegraphics[width=\\linewidth]{fig%s}
    \\caption{$%s$}
    \\label{fig:%s}
  \\end{minipage}
\\end{figure}
" fignum titlestring fignum))
                                     )
                                   )

                                 finally return count) )
      (if (= (mod figurecount 2) 1)
          (insert "\\end{figure}")
        )
      )
    )
  )

(defvar debug-func-history nil
  "History list for the insert-debug-func command")
(setq debug-func-history (list "printk();"))

(defun insert-debug-func (debug-string)
  (interactive (list
                (read-string "Code to insert (default: printk();): "
                             (car debug-func-history) debug-func-history "printk();")))
  (save-excursion
    (cl-loop with start = (window-point)
             for count from 0
             while (re-search-forward "^{$" nil t)
             do
             (setq start (match-end 0))
             (newline-and-indent)
             (insert (format "%s\n" debug-string))
             finally return count)
    )

  )


(defun org-log-current-defun ()
  (save-excursion
    (org-back-to-heading)
    (if (looking-at org-complex-heading-regexp)
        (match-string 4))))

(defun org-store-current-task ()
  (write-region (org-log-current-defun) nil "~/.current-task" nil)
  )


(add-hook 'org-clock-in-hook
          'org-store-current-task)

(add-hook 'org-clock-out-hook
          'org-store-current-task)

;; http://tuxicity.se/emacs/elisp/2010/11/16/delete-file-and-buffer-in-emacs.html
(defun delete-this-buffer-and-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

;; (global-set-key (kbd "C-c k") 'delete-this-buffer-and-file)

(defun httpd-show-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (httpd-serve-directory (file-name-directory buffer-file-name)) ;; Serve current buffer
  (browse-url (concat "http://localhost:8080/" (file-name-nondirectory buffer-file-name)))
  )

(defun is-pdf-latex-output ()
  (let ( (buffer-dir (file-name-sans-extension (buffer-file-name))) )
    (if (file-exists-p (concat buffer-dir ".tex"))
        (auto-revert-mode 1)
      )
    )
  )

(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun mg-TeX-delete-current-macro (&optional arg)
  "Remove the current macro.
With an optional argument ARG, delete just the ARG-th macro
starting from the innermost."
  (interactive "*p")
  (let (macro end)
    (when
        (dotimes (i arg macro)
          (goto-char (TeX-find-macro-start))
          (setq macro (TeX-current-macro)
                end (TeX-find-macro-end))
          ;; If we need to look for an outer macro we have to "exit" from the
          ;; current one.
          (backward-char))
      ;; Return to the beginning of the macro to be deleted.
      (forward-char)
      (re-search-forward
       (concat (regexp-quote TeX-esc) macro "\\(?:\\[[^]]*\\]\\)?"
               TeX-grop "\\(\\(.\\|\n\\)*\\)")
       end t)
      (replace-match "\\1")
      ;; Delete the closing brace.
      (delete-backward-char 1))))

(defun goto-student-feedback ()
  (interactive)
  (string-match
   (rx (group "hw" digit) (any ascii) (group "cs30f" (1+ alpha)))
   (buffer-file-name))

  (let* (
         (hwnum (match-string 1 (buffer-file-name)))
         (username (match-string 2 (buffer-file-name)))
         (feedback-path (concat "/home/linux/ieng6/cs30f/public/" hwnum "_feedback/style_feedback_" username))
         )
    (message feedback-path)
    (find-file-other-window feedback-path)
    )
  )

;;; http://emacsredux.com/blog/2013/06/25/boost-performance-by-leveraging-byte-compilation/
(defun byte-compile-init-dir ()
  "Byte-compile all your dotfiles."
  (interactive)
  (byte-recompile-directory user-emacs-directory 0))

(defun run-pronto ()
  (interactive)
  (let ((output-buffer (get-buffer-create "*pronto*")))
    (shell-command "bundle exec pronto run" output-buffer)
    (with-current-buffer output-buffer
      (compilation-mode)
      )
    )
  )


(defun print-flycheck-error-struct (err)
  "Prints ERR."
  (if (property-order-error? err)
      (print (format "Line %d: %s"
                     (flycheck-error-line err)
                     (correct-property-order err)))
    )
  )

(defun get-buffer-line (lineno)
  "Reads line at LINENO in buffer."
  (save-excursion
    (goto-char (point-min))
    (forward-line (- lineno 1))
    ;; (thing-at-point 'line)
    (buffer-substring-no-properties
     (line-beginning-position)
     (line-end-position)
     )
    ))

(defun css-property-match (lineno property)
  "True if the line LINENO has the value for PROPERTY."
  (let ((line (s-trim (get-buffer-line lineno))))
    (s-starts-with? property lineno)
    )
  )

(defun flycheck-print-errors ()
  "Loops through flycheck errors."
  (interactive)
  (cl-loop for error in flycheck-current-errors
           do
           (print-flycheck-error-struct error))
  )

(defun flycheck-iterate-errors (fixer)
  "Loop through flycheck errors and apply FIXER to them."
  (interactive)
  (cl-loop for error in flycheck-current-errors
           do
           (fixer error))
  )

(defun flycheck-fix-css-property-sort-order ()
  "Fixes SCSS-lint property sort order errors in the current buffer."
  (interactive)
  (cl-loop for error in flycheck-current-errors
           do
           (fix-css-property-order error))
  )

(defun correct-property-order (err)
  "Extracts correct CSS property order out of ERR."
  (let* ((err-msg (flycheck-error-message err))
         (sort-order-substr (s-chop-prefix "Properties should be ordered " err-msg))
         (correct-order-list )
         )
    (s-split ", " sort-order-substr)
    )
  )

(defun property-order-error? (err)
  "True if the flycheck error ERR is an scss property order error."
  (let ((err-msg (flycheck-error-message err)))
    (s-starts-with? "Properties should be ordered" err-msg)
    )
  )


(defun get-current-line ()
  "Gets the current line contents, stripped of whitespace."
  (s-trim
   (buffer-substring-no-properties
    (line-beginning-position)
    (line-end-position))))

(defun current-line-starts-with? (needle)
  "Return true if current line starts with NEEDLE."
  (s-starts-with? needle (get-current-line)))

(defun fix-css-property-order (err)
  "Fixes SCSS-lint's property order error marked by ERR."
  ;;; for property in correct order
  ;;;   find line that sets that property, below this line
  ;;;   move it up to the current line
  ;;;   go on to next line in file and property in list
  (if (property-order-error? err)
      (let* ((correct-order (correct-property-order err))
             (num-properties (length correct-order))
             (lineno (flycheck-error-line err))
             )
        (save-excursion
          (goto-char (point-min))
          (forward-line (- lineno 1)) ; Go to error line
          (cl-loop for property in correct-order
                   do
                   (push-mark) ; Save current line to mark
                   (save-excursion
                     (cl-loop until (current-line-starts-with? property) do (forward-line)) ; Find the line that starts with property
                     (ignore-errors (transpose-lines 0))
                     )
                   (pop-mark)
                   (forward-line)
                   ))
        )))


(defcustom flycheck-fix-error-functions nil
  "Functions to attempt to fix errors.

Each function in this hook must accept a single argument: A
Flycheck error to fix.  The function should, if applicable,
attempt to fix the error, or else return nil if it cannot.

All functions in this hook are called in order of appearance,
until a function returns non-nil.  Thus, a function in this hook
may return nil, to allow for further processing of the error, or
any non-nil value, to indicate that the error was fully fixed
and inhibit any further processing.

Note that these functions should only ever be called
interactively; Flycheck will not attempt to fix errors unsolicited.

This variable is an abnormal hook.  See Info
node `(elisp)Hooks'."
  :group 'flycheck
  :type 'hook
  :package-version '(flycheck . "0.24")
  :risky t)

(add-hook 'flycheck-fix-error-functions 'fix-css-property-order)

(defun flycheck-try-fix-errors-at-point ()
  "Attempts to fix errors at point using the list of fixer functions."
  (interactive)
  (let ((err (car-safe (flycheck-overlay-errors-at (point)))))
    (if err
        (run-hook-with-args-until-success 'flycheck-fix-error-functions err)
      (message "No errors at point to fix!"))))

(defhydra hydra-zoom (global-map "<f2>")
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))

;; (gh-pulls-api "api")
(defun print-pull-diff-comment (comment)
  (message "%s commented: '%s'" (oref (oref comment :user) :login) (oref comment :body))
  (message "on %s:%d" (oref comment :path) (or (oref comment :position) (* -1 (oref comment :original-position)))))

(defun comment-hash-key (comment)
  "Hash key for a COMMENT."
  (format "%s:%s" (oref comment :path)
          (or (oref comment :position) (format "-%d" (oref comment :original-position)))))

(defun print-issue-comment (comment)
  (message "%s commented: '%s'" (oref (oref comment :user) :login) (oref comment :body)))

(defun magit-gh-pulls-list-commits ())

(defun gh-pr-info ()
  ;;; Shows all comments on a pull request
  ;;; TODO: Need to get commit comments from all commits
  (magit-section-case
    (pull
     (let* ((req (magit-gh-section-req-data))
            (pull-id (oref req :number))
            (api (magit-gh-pulls-get-api))
            (config (magit-gh-pulls-get-repo-from-config))
            (user (car config))
            (repo (cdr config))
            (issues-api (magit-gh-issues-get-api)))
       (message "------------------")
       (message "Getting comments for PR #%d" pull-id)
       (let* ((comments-response (gh-pulls-comments-list api user repo pull-id))
              (comments (oref comments-response :data))
              (issue-comments (oref (gh-issues-comments-list issues-api user repo pull-id) :data)))
         ;; (mapc 'print-pull-diff-comment comments)
         (setq last-pr-comments (make-hash-table :test 'equal))
	 (setq last-pr-issue-comments (make-hash-table :test 'equal))
         (mapc (lambda (comment)
                 (let* ((key (comment-hash-key comment))
                        (existing-line-comments (gethash key last-pr-comments (list)))
                        (new-comments (-snoc existing-line-comments comment)))
                   (puthash key new-comments last-pr-comments)
                   )
                 )
               comments)
         ;; (mapc 'print-issue-comment issue-comments)
         )
       ))))

(advice-add 'magit-gh-pulls-diff-pull-request :before #'gh-pr-info)

(defun insert-issue-comments ()
  (mapc (lambda (comment) (insert (oref comment :body))) last-pr-issue-comments)
  (setq last-pr-issue-comments (list))
    )

(advice-add 'magit-gh-pulls-diff-pull-request :after #'insert-issue-comments)

(defun unset-last-pr-comments ()
    (setq last-pr-comments (make-hash-table :test 'equal))
    )

(advice-add 'magit-gh-pulls-diff-pull-request :after #'unset-last-pr-comments)

(setq magit-gh-pulls-pull-detail-limit 10)


(defun magit-run-git-with-input-and-output (&rest args)
  "Call Git in a separate process.
ARGS is flattened and then used as arguments to Git.

The current buffer's content is used as the process' standard
input.

Option `magit-git-executable' specifies the Git executable and
option `magit-git-global-arguments' specifies constant arguments.
The remaining arguments ARGS specify arguments to Git, they are
flattened before use.

Returns the git output."
  (declare (indent 1))
  (if (file-remote-p default-directory)
      ;; We lack `process-file-region', so fall back to asynch +
      ;; waiting in remote case.
      (progn
        (magit-start-git (current-buffer) args)
        (while (and magit-this-process
                    (eq (process-status magit-this-process) 'run))
          (sleep-for 0.005)))
    (run-hooks 'magit-pre-call-git-hook)
    (-let* ((process-environment (append (magit-cygwin-env-vars)
                                         process-environment))
            (default-process-coding-system (magit--process-coding-system))
            (flat-args (magit-process-git-arguments args))
            ((process-buf . section)
             (magit-process-setup magit-git-executable flat-args))
            (output-buf (generate-new-buffer "*magit-git-stdout*"))
            (inhibit-read-only t))
      (apply #'call-process-region (point-min) (point-max)
             magit-git-executable nil output-buf nil flat-args)
      (with-current-buffer output-buf
        (let ((stdout-contents (buffer-string)))
          (kill-buffer)
          stdout-contents
          )))))


(define-derived-mode magit-gh-pull-request-mode magit-diff-mode "Magit PR"
  "Mode for looking at a Github Pull Request.

This mode is documented in info node `(magit)Revision buffer'.

\\<magit-mode-map>\
Type \\[magit-refresh] to refresh the current buffer.
Type \\[magit-section-toggle] to expand or hide the section at point.
Type \\[magit-visit-thing] to visit the hunk or file at point.

Staging and applying changes is documented in info node
`(magit)Staging and unstaging' and info node `(magit)Applying'.

\\<magit-hunk-section-map>Type \
\\[magit-apply] to apply the change at point, \
\\[magit-stage] to stage,
\\[magit-unstage] to unstage, \
\\[magit-discard] to discard, or \
\\[magit-reverse] to reverse it.

\\{magit-revision-mode-map}"
  :group 'magit-gh-pulls
  (hack-dir-local-variables-non-file-buffer))

(defun delete-old-backup-files ()
  "Delete backup files older than a week."
  (message "Deleting old backup files...")
  (let ((week (* 60 60 24 7))
        (current (float-time (current-time))))
    (dolist (file (directory-files "~/.emacs.d/saves" t))
      (when (and (backup-file-name-p file)
                 (> (- current (float-time (fifth (file-attributes file))))
                    week))
        (message "%s" file)
        (delete-file file))))
  )

(delete-old-backup-files)

https://emacs.stackexchange.com/questions/13822/set-default-branch-or-revision-to-diff-against-in-magit
(defun magit-diff-master (&optional args)
  "Show diff range master...HEAD"
  (interactive)
  (magit-diff "master...HEAD" args))

(defun magit-diff-mbase (&optional args)
  "Show diff of $(git merge-base master HEAD) to working tree."
  (interactive)
  (magit-diff-working-tree
   (magit-git-string "merge-base" "master" "HEAD") args))

(magit-define-popup-action 'magit-diff-popup
  ?m "Diff merge-base master" 'magit-diff-mbase)

(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let* ((name (buffer-name))
        (filename (buffer-file-name))
        (basename (file-name-nondirectory filename)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " (file-name-directory filename) basename nil basename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

;; (defun org-clock-in-by-name ()
;;   "Clocks into an agenda task by name (fuzzy match)"
;;   (interactive)
;;   (org-todo-list)
;;   (swiper)
;;   (org-agenda-clock-in)
;;   ;; (counsel-org-goto-all)
;;   ;; (org-clock-in)
;;   )

(defun counsel-clock-in-by-name ()
  "Clocks into an agenda task by name (fuzzy match)"
  (interactive)
  (condition-case err
      (progn
        (switch-to-buffer "gradescope_activity.org")
        (counsel-org-goto)
        ;; This doesn't work because somehow it doesn't switch buffers
        ;; before org-clock-in gets called
        ;; (counsel-org-goto-all)
        (org-clock-in)
        )
    ;; If task was not found, it's a new task, so make one under some heading
    (wrong-type-argument
     (message "%s" err)
     (let ((task-name (caddr err)))
       (message "Creating new task %s" task-name)
       (switch-to-buffer "gradescope_activity.org")
       (counsel-org-goto)
       (org-insert-todo-subheading '(4))
       (insert task-name)
       (org-clock-in nil)
       )
     )
    )
  )


(defun set-font-size ()
    "Set the font size."
  (interactive)
  (set-face-attribute
   'default nil :height
   (string-to-number
    (read-string "Font size: " (number-to-string (face-attribute 'default :height nil))))))


;; (define-advice secrets-search-items (:override (collection &rest attributes) my-secrets-search-fixed)
;;   "Fix cons building in dbus-call-method call"
;;   (let ((collection-path (secrets-unlock-collection collection))
;;         result props)
;;     (unless (secrets-empty-path collection-path)
;;       ;; Create attributes list.
;;       (while (consp (cdr attributes))
;;         (unless (keywordp (car attributes))
;;           (error 'wrong-type-argument (car attributes)))
;;         (unless (stringp (cadr attributes))
;;           (error 'wrong-type-argument (cadr attributes)))
;;         (setq props (append
;;                      props
;;                      (list :dict-entry
;;                            (substring (symbol-name (car attributes)) 1)
;;                            (cadr attributes)))
;;               attributes (cddr attributes)))
;;       ;; Search.  The result is a list of object paths.
;;       (setq result
;;             (dbus-call-method
;;              :session secrets-service collection-path
;;              secrets-interface-collection "SearchItems"
;;              (if props
;;                  (cons :array props)
;;                '(:array :signature "{ss}"))))
;;       ;; Return the found items.
;;       (mapcar
;;        (lambda (item-path) (secrets-get-item-property item-path "Label"))
;;        result))))

(eval-after-load "secrets"
  (defun secrets-search-items (collection &rest attributes)
    "Search items in COLLECTION with ATTRIBUTES.
ATTRIBUTES are key-value pairs.  The keys are keyword symbols,
starting with a colon.  Example:

  (secrets-search-items \"Tramp collection\" :user \"joe\")

The object labels of the found items are returned as list."
    (let ((collection-path (secrets-unlock-collection collection))
          result props)
      (unless (secrets-empty-path collection-path)
        ;; Create attributes list.
        (while (consp (cdr attributes))
          (unless (keywordp (car attributes))
            (error 'wrong-type-argument (car attributes)))
          (unless (stringp (cadr attributes))
            (error 'wrong-type-argument (cadr attributes)))
          (setq props (append
                       props
                       (list :dict-entry
                             ;; HACK fixed so that dict entries are conses
                             (list
                              (substring (symbol-name (car attributes)) 1)
                              (cadr attributes))))
                attributes (cddr attributes)))
        (prin1 props)
        ;; Search.  The result is a list of object paths.
        (setq result
              (dbus-call-method
               :session secrets-service collection-path
               secrets-interface-collection "SearchItems"
               (if props
                   (cons :array props)
                 '(:array :signature "{ss}"))))
        ;; Return the found items.
        (mapcar
         (lambda (item-path) (secrets-get-item-property item-path "Label"))
         result))))
  )

(provide 'my-functions)
;;; my-functions.el ends here
