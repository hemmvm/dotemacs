(require 'eval-sexp-fu)
(require 'util--clojure)
(require 'cider-eval-sexp-fu)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Duration

(setq eval-sexp-fu-flash-duration 0.20)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Cider

(define-eval-sexp-fu-flash-command util--clojure/eval-form-in-repl
  (eval-sexp-fu-flash (cons (util--clojure/beginning-of-form) (util--clojure/end-of-form))))

(define-eval-sexp-fu-flash-command util--clojure/eval-region-or-last-sexp-in-repl
  (eval-sexp-fu-flash (cons (save-excursion (paredit-backward) (point)) (point))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'setup--eval-sexp-fu)
