;; Credits to Magnar Sveen
;;   - http://whattheemacsd.com/file-defuns.el-01.html
;;   - http://whattheemacsd.com/file-defuns.el-02.html

;; TODO:
;;   - Refactor / DRY !!!

(defun util--fs/rename-current-buffer-file ()
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "[Rename] " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)

          (let ((new-dir (file-name-directory new-name)))
            (when (not (file-exists-p new-dir))
              (make-directory new-dir t)))

          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun util--fs/copy-current-buffer-file ()
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "[Copy] " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)

          (let ((new-dir (file-name-directory new-name)))
            (when (not (file-exists-p new-dir))
              (make-directory new-dir t)))

          (copy-file filename new-name)
          (find-file new-name)
          (message "File '%s' copied to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun util--fs/delete-current-buffer-file ()
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'util--fs)
