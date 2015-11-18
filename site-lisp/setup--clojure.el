(require 'util)
(require 'compile)

(require 'clojure-mode)
(require 'cider)
(require 'clj-refactor)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Boot

(setq auto-mode-alist (cons '("\\.boot$" . clojure-mode) auto-mode-alist))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Cider Misc

(setq cider-repl-result-prefix ";=> ")
(setq cider-repl-use-clojure-font-lock t)
(setq cider-show-error-buffer nil)
(setq cider-auto-select-error-buffer nil)
(setq cider-prompt-for-symbol nil)
(setq cider-repl-use-pretty-printing t)
(setq cider-prompt-save-file-on-load nil)
(setq cider-test-show-report-on-success nil)
(setq cider-prompt-for-project-on-connect nil)
(setq cider-ovelays-use-font-lock t)
(setq cider-font-lock-dynamically '(macro core function var))
(setq cider-repl-display-help-banner nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Cljr Misc

(setq cljr-suppress-middleware-warnings t)
(setq cljr-magic-requires nil)
(setq cljr-favor-private-functions nil)

(defadvice cljr-extract-function (after cljr-extract-function activate)
  "..."
  (paxedit-indent-buffer))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable eldoc

(add-hook 'cider-mode-hook #'eldoc-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hooks

(add-hook 'cider--debug-mode-hook (lambda () (evil-emacs-state)))
(add-hook 'clojure-mode-hook      (lambda () (clj-refactor-mode 1)))
(add-hook 'cider-repl-mode-hook   (lambda () (clj-refactor-mode 1)))
(add-hook 'clojure-mode-hook
          (lambda ()
            ;; Compilation
            (set (make-local-variable 'compile-command)
                 (format "lein test"))))





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Disable keys

(util/define-keys (list cider-mode-map
                        cider-repl-mode-map
                        cider-test-report-mode-map)

                  "M-." nil
                  "M-," nil)

(util/define-keys (list cider-mode-map
                        cider-repl-mode-map)

  "C-M-i"   nil
  "C-c C-d" nil
  "M-s"     nil)

(util/define-keys cider-mode-map
  "C-c C-p" nil
  "C-M-x"   nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Special Indentation

(define-clojure-indent
  (defroutes 'defun)
  (match 'defun)
  (for-all 'defun)
  (letk 'defun)
  (specify 'defun)
  (specify! 'defun)
  (ANY 2)
  (context 2)
  (fnk 'defun)
  (defnk 'defun)
  (set-env! 'defun)
  (get-env 'defun)
  (println 'defun)
  (lazy-seq'defun)
  (routes 'defun)
  (system-map 'defun)
  (describe 'defun)
  (context 'defun)
  (it 'defun)
  (facts 'defun)
  (fact 'defun)
  (future-facts 'defun)
  (future-fact 'defun)
  (pprint 'defun)
  (render 'defun)
  (ident 'defun)
  (q/render 'defun)
  (will-update 'defun)
  (did-update 'defun)
  (did-mount 'defun)
  (will-unmount 'defun)
  (render-state 'defun)
  (init-state 'defun)
  (will-mount 'defun)
  (input 'defun)
  (go 'defun)
  (form 'defun)
  (update! 'defun)
  (let-routes 'defun)
  (html 'defun)
  (doall 'defun)
  (dosync 'defun)

  ;; Compojure
  (GET 'defun)
  (PUT 'defun)
  (POST 'defun)
  (where 'defun)
  (add-watch 'defun)
  (listen! 'defun)

  ;; Om Next
  (query 'defun)
  (params 'defun)
  (add-root! 'defun)
  (should-update 'defun)
  (componentWillMount 'defun)
  (componentDidMount 'defun)
  (componentDidUpdate 'defun)
  (componentWillUnmount 'defun)
  (componentWillUpdate 'defun)
  (shouldComponentUpdate 'defun)

  ;; Reframe
  (register-handler 'defun)
  (register-sub 'defun)

  ;; Wrapper
  (fragment 'defun)
  (render! 'defun)
  (render-value! 'defun)

  (this-as 'defun)
  (go-loop 'defun)

  (form-to 'defun)

  (letfun 'defun)
  (on-click 'defun))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'setup--clojure)
