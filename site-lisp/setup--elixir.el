(require 'elixir-mode)
(require 'alchemist)
(require 'ruby-end)


(defconst ruby-end-expand-keywords-before-re
  "\\(?:^\\|\\s-+\\)\\(?:do\\|class\\|module\\|case\\|for\\|begin\\)"
  "Regular expression matching blocks before point.")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hooks

(add-hook 'elixir-mode-hook 'alchemist-mode)
(add-hook 'elixir-mode-hook 'ruby-end-mode)


(setq elix--last-window nil)

(defun elix--switch-back-to-last-window ()
  (interactive)
  ;; (evil-normal-state)
  (select-window elix--last-window))

(defun elix--save-last-window ()
  (setq elix--last-window (get-buffer-window)))

(defun elix--switch-to-iex ()
  (interactive)
  (let* ((iex-buffer (get-buffer "*Alchemist-IEx*"))
         (iex-window (get-buffer-window iex-buffer)))

    (when iex-buffer
      (elix--save-last-window))

    (cond
     (iex-window
      (select-window iex-window)
      (evil-insert-state))

     (iex-buffer
      (util/split-and-switch-to-window-below)
      (switch-to-buffer iex-buffer)
      (evil-insert-state))

     (t
      (message "Can't find Buffer *Alchemist-IEx*")))))


(defun elix--insert-current-line-into-iex ()
  (interactive)
  (let ((str (buffer-substring (line-beginning-position) (line-end-position))))
    (elix--switch-to-iex)
    (insert str)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; POPUP
;; HACK
(require 'popup)
(defun alchemist-interact-insert-as-comment (string)
  (popup-tip string
             ;; :point (line-beginning-position)
             :point (point)
             :around t
             :height 10
             :scroll-bar t
             :margin t))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Exand region

(eval-after-load "elixir-mode" '(require 'ruby-mode-expansions))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Disable keys

(util/define-keys alchemist-mode-map
  "M-." nil
  "M-," nil
  "M-P" nil
  "M-N" nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'setup--elixir)
