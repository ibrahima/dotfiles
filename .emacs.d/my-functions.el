
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
