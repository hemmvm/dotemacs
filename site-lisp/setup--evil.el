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
;; Modeline
;; http://muublog.blogspot.de/2015/12/evil-mode-hack-for-colorful-mode-line.html

(defface my-evil-state-emacs-face
  '((t (:background "salmon" :foreground "White")))
  "Evil Mode Emacs State Face")

(defface my-evil-state-insert-face
  '((t (:background "#00ff7f" :foreground "#333")))
  "Evil Mode Insert State Face")

(defface my-evil-state-normal-face
  '((t (:background "#836FFF" :foreground "#333")))
  "Evil Mode Normal Stace Face")

(defface my-evil-state-visual-face
  '((t (:background "#666" :foreground "#ccc")))
  "Evil Mode Normal Stace Face")

(defun evil-generate-mode-line-tag (&optional state)
  "Generate the evil mode-line tag for STATE."
  (let ((tag (evil-state-property state :tag t)))
    ;; prepare mode-line: add tooltip
    (if (stringp tag)
        (propertize tag
                    'face (cond
                           ((string= "normal" state)
                            'my-evil-state-normal-face)
                           ((string= "insert" state)
                            'my-evil-state-insert-face)
                           ((string= "emacs" state)
                            'my-evil-state-emacs-face)
                           ((string= "visual" state)
                            'my-evil-state-visual-face))
                    'help-echo (evil-state-property state :name)
                    'mouse-face 'mode-line-highlight)
      tag)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'setup--evil)
