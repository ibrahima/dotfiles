
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
            while (string-match "savefig(\\([[:alnum:]]+\\),[[:space:]]*\\([[:digit:]]+\\))" mcontents start)
            do
            (if (= (mod count 2) 0)
                (insert (format "
\\begin{figure}[!ht]
  \\begin{minipage}[b]{0.5\\linewidth}
    \\centering
    \\includegraphics[width=\\linewidth]{fig%s}
    \\caption{}
    \\label{fig:%s}
  \\end{minipage}
  \\hspace{0.5cm}" (match-string 2 mcontents) (match-string 2 mcontents)))
              (insert (format "
  \\begin{minipage}[b]{0.5\\linewidth}
    \\centering
    \\includegraphics[width=\\linewidth]{fig%s}
    \\caption{}
    \\label{fig:%s}
  \\end{minipage}
\\end{figure}
" (match-string 2 mcontents) (match-string 2 mcontents)))
                )
            (setq start (match-end 0))
            finally return count) )
      (if (= (mod figurecount 2) 1)
          (insert "\\end{figure}")
          )
      )
    )
  )
