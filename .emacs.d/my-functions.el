
(defun how-many-str (regexp str)
  ;; From http://stackoverflow.com/a/11848341
  (loop with start = 0
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
      (loop with start = (window-point)
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
      (setq figurecount (loop with start = 0
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
    (loop with start = (window-point)
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

(global-set-key (kbd "C-c k") 'delete-this-buffer-and-file)
