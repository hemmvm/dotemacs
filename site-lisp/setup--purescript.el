(require 'purescript-mode)
(require 'flycheck-purescript)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Indentation

(add-hook 'purescript-mode-hook
          'turn-on-purescript-indentation)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flycheck

;; (eval-after-load 'flycheck
;;   '(flycheck-purescript-setup))

;; (add-hook 'purescript-mode-hook
;;           'flycheck-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; psc-ide

(customize-set-variable 'psc-ide-executable "/home/hemmer/bin/psc-ide")

(require 'psc-ide)

(add-hook 'purescript-mode-hook
  (lambda ()
    (psc-ide-mode)
    ;; (company-mode)
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'setup--purescript)
