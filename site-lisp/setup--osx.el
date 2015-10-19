(when (equal system-type 'darwin)
  (set-default-font "Monaco 24")

  ;; Mac OSX Clipboard (via pbcopy / pbpaste)
  (defun pbpaste ()
    (interactive)
    (insert (shell-command-to-string "~/bin/paste.sh")))

  (defun pbcopy ()
    (interactive)
    (shell-command-on-region (point) (mark) "~/bin/copy.sh"))

  (global-set-key   (kbd "M-v") 'pbpaste)

  ;; Mac OSX keys
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta)

  ;; Transparency
  (set-frame-parameter nil 'alpha 91)

  ;; Keybindings
  (global-set-key (kbd "M-=") 'util/increase-font-size)
  (global-set-key (kbd "M--") 'util/decrease-font-size))

(provide 'setup--osx)
