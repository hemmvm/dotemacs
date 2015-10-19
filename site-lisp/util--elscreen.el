(require 'elscreen)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun util--elscreen/start ()
  (when (not (elscreen-one-screen-p))
    (elscreen-start)))

(defun util--elscreen/create ()
  (interactive)
  (let ((buffer (current-buffer)))
    (elscreen-create)
    (switch-to-buffer buffer)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'util--elscreen)
