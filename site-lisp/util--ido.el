
(defun ido--util/home ()
  (interactive)
  (if (looking-back "/")
      (insert "~/")
    (call-interactively 'self-insert-command)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'util--ido)
