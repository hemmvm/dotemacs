(require 'popup)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Programmatically evaluate expressions

(defun util--clojure/cider-cmd (cmd)
  (lexical-let ((cmd cmd))
    (lambda ()
      (interactive)
      (cider-interactive-eval cmd))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Sexp Nav

(defun util--clojure/end-of-defun ()
  (interactive)
  (push-mark (point) t nil)
  (end-of-defun)
  (backward-char 1))

(defun util--clojure/goto-end-of-form-rec (p)
  (let ((next-pos (paxedit-sexp-move-to-core-start)))
    (cond ((looking-at ".comment")
           (progn (goto-char p)
                  (paredit-forward)))

          ((numberp next-pos)
           (util--clojure/goto-end-of-form-rec next-pos))

          (t
           (paredit-forward)))))

(defun util--clojure/goto-end-of-form ()
  (interactive)
  (util--clojure/goto-end-of-form-rec (point)))

(defun util--clojure/beginning-of-form ()
  (save-excursion
    (util--clojure/goto-end-of-form)
    (paredit-backward)
    (point)))

(defun util--clojure/end-of-form ()
  (save-excursion
    (util--clojure/goto-end-of-form)
    (point)))

(defun util--clojure/eval-form ()
  (interactive)
  (save-window-excursion
    (save-excursion
      (util--clojure/goto-end-of-form)
      (cider-eval-last-sexp))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Form Evaluation (Buffer)

(defun util--clojure/eval-region-or-defun ()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (cider-eval-region (region-beginning)
                           (region-end))
      (progn (end-of-defun)
             (cider-eval-last-sexp)))))

(defun util--clojure/eval-and-replace-region-or-last-sexp ()
  (interactive)
  (if (region-active-p)
      (progn
        (goto-char (region-end))
        (deactivate-mark)))
  (cider-eval-last-sexp-and-replace))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Form Evaluation (Repl)

(defun util--clojure/insert-region-or-last-sexp-into-repl ()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (cider-insert-region-in-repl (region-beginning)
                                     (region-end))
      (cider-insert-last-sexp-in-repl))))


(defun util--clojure/eval-region-or-last-sexp-in-repl ()
  (interactive)
  (save-window-excursion
    (save-excursion
      (if (region-active-p)
          (let ((log-size message-log-max))
            (setq message-log-max nil)
            (cider-insert-region-in-repl (region-beginning)
                                         (region-end))
            (setq message-log-max log-size))

        (cider-insert-last-sexp-in-repl))
      (cider-repl-return))))


(defun util--clojure/eval-form-in-repl ()
  (interactive)
  (save-window-excursion
    (save-excursion
      (util--clojure/goto-end-of-form)
      (util--clojure/eval-region-or-last-sexp-in-repl))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Stacktraces

(defun util--clojure/visit-error-buffer ()
  (interactive)
  (cider-visit-error-buffer)
  (switch-to-buffer-other-window "*cider-error*"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Popup doc

(defun util--clojure/popup-doc ()
  (interactive)
  (let ((doc-buffer (cider-create-doc-buffer (symbol-name (symbol-at-point)))))
    (popup-tip (save-current-buffer
		 (set-buffer doc-buffer)
		 (buffer-string))
               :point (cider-completion-symbol-start-pos)
               :around t
               :scroll-bar t
               :margin t)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'util--clojure)
