(require 'neotree)
(require 'projectile)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Peek

(defun util--neotree/peek ()
  (interactive)
  (let ((neo-window (neo-global--get-window)))
    (neotree-enter)
    (select-window neo-window)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Toggle / Focus

;; Adapted from http://www.emacswiki.org/emacs/NeoTree#toc9
(defun util--neotree/project-tree ()
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (if project-dir
        (progn
          (neotree-dir project-dir)
          (neotree-find file-name))
      (message "Could not find git project root."))))

(defun util--neotree/change-to-project-root ()
  (interactive)
  (let ((root (projectile-project-root)))
    (if root
        (neo-global--with-window
          (neo-global--open-dir root))
      (message "Cannot find project root"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'util--neotree)
