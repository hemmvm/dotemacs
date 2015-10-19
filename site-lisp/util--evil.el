(require 'util)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Buffers

(defun util--evil/save-all-buffers! ()
  (interactive)
  (evil-force-normal-state)
  (util/save-all-buffers!))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Motion

(evil-define-motion util--evil/motion-5-lines-down ()
  :type exclusive
  (let ((line-move-visual t))
    (evil-line-move 5)))

(evil-define-motion util--evil/motion-5-lines-up ()
  :type exclusive
  (let ((line-move-visual t))
    (evil-line-move -5)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Misc

(defun util--evil/insert-line-above (count)
  (interactive "p")
  (save-excursion
    (evil-save-state (evil-open-above count))))

(defun util--evil/insert-line-below (count)
  (interactive "p")
  (save-excursion
    (evil-save-state (evil-open-below count))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'util--evil)
