(require 'evil)
(require 'util)

(evil-mode 1)

(global-evil-surround-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Misc

(setq evil-move-cursor-back nil)
(setq evil-shift-width 2)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Special states

;; Emacs
(setq evil-emacs-state-modes '(
                               magit-status-mode
                               magit-log-mode
                               magit-key-mode
                               magit-stash-mode
                               magit-popup-mode
                               git-rebase-mode
                               git-commit-mode
                               browse-kill-ring-mode
                               org-mode
                               reftex-toc-mode
                               tetris-mode
                               dired-mode
                               doc-view-mode
                               grep-mode
                               cider-inspector-mode))

;; Insert
(add-hook 'with-editor-mode-hook 'evil-insert-state)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Disable keys

(util/define-keys (list evil-normal-state-map
                        evil-insert-state-map
                        evil-motion-state-map)
  "C-o" nil
  "M-i" nil
  "C-t" nil
  "C-n" nil
  "C-p" nil
  "C-z" nil
  "M-." nil)


(util/define-keys evil-normal-state-map
  "q" nil)

(util/define-keys evil-motion-state-map
  "SPC" nil
  "C-b" nil)

(util/define-keys evil-insert-state-map
  "C-d" nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'setup--evil)
