(defalias 'yes-or-no-p 'y-or-n-p)

;; Misc
(setq inhibit-startup-message t)
(setq-default indent-tabs-mode nil)
(setq-default truncate-lines t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(put 'upcase-region 'disabled nil)

;; Undo / redo window layouts
(winner-mode 1)

;; Parens
(show-paren-mode 1)
(setq show-paren-delay 0)
(electric-pair-mode 1)

;; Transient mark mode
(delete-selection-mode t)

;; Auto revert
(global-auto-revert-mode 1)
(setq auto-revert-interval 0.5)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Indentation
(setq c-basic-offset 2)
(setq js-indent-level 2)

;; Whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'setup--sane-defaults)
