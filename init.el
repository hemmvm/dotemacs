;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Site lisp

(add-to-list 'load-path "~/.emacs.d/site-lisp")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packages

(require 'setup--package)
(require 'util--package)

(util--package/install-packages! '(
                                   ;; Elisp utils
                                   dash
                                   smartrep

                                   ;; Appearance
                                   diminish
                                   highlight-symbol
                                   rainbow-mode
                                   rainbow-delimiters

                                   ;; Themes
                                   noctilux-theme
                                   solarized-theme

                                   ;; Fuzzy menus, templating, completion, ...
                                   idomenu
                                   ido-vertical-mode
                                   ido-ubiquitous
                                   crm-custom
                                   yasnippet
                                   smex
                                   swiper
                                   counsel
                                   company
                                   company-quickhelp
                                   helm-company

                                   ;; Evil
                                   evil
                                   evil-surround

                                   ;; Project / Filesystem
                                   projectile
                                   neotree
                                   dired-details

                                   ;; Ace
                                   ace-jump-mode
                                   ace-window

                                   ;; Sexp
                                   paxedit
                                   paredit
                                   evil-paredit
                                   eval-sexp-fu

                                   ;; Misc
                                   magit
                                   elscreen
                                   browse-kill-ring
                                   fullframe
                                   rotate
                                   buffer-move
                                   popup

                                   ;; Editing
                                   undo-tree
                                   expand-region
                                   multiple-cursors
                                   aggressive-indent

                                   ;; Tools
                                   restclient

                                   ;; Flycheck
                                   flycheck
                                   flycheck-pos-tip
                                   flycheck-haskell

                                   ;; Lang: Scheme
                                   geiser

                                   ;; Lang: Clojure
                                   clojure-mode
                                   cider
                                   clj-refactor
                                   cider-eval-sexp-fu
                                   nrepl-eval-sexp-fu
                                   align-cljlet

                                   ;; Lang: Haskell
                                   haskell-mode
                                   hi2

                                   ;; Lang: Elm
                                   elm-mode

                                   ;; Lang: Misc
                                   markdown-mode
                                   sass-mode
                                   json-mode
                                   brainfuck-mode
                                   lua-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basics

(require 'util)
(require 'setup--osx)
(require 'setup--sane-defaults)
(require 'setup--appearance)
(require 'setup--noctilux-theme)
;; (require 'setup--solarized-light-theme)
(require 'setup--scrolling)
(require 'setup--diminish)
(require 'setup--rainbow-mode)
(require 'setup--rainbow-delimiters)
(require 'setup--emacs-lisp)
(require 'setup--smartrep)
(require 'setup--undo-tree)
(require 'setup--yas)
(require 'setup--eval-sexp-fu)
(require 'setup--compilation)
(require 'setup--aggressive-indent)
(require 'setup--json)
(require 'setup--markdown-mode)
(require 'setup--xml)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Quickly open files

(util/global-set-keys
  "M-RET e" (util/open-file "~/.emacs.d/init.el")
  "M-RET a" (util/open-file "~/.config/awesome/rc.lua")
  "M-RET z" (util/open-file "~/.zshrc"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Misc Keys

(util/global-unset-keys
  "C-x 2"
  "C-x 3"
  "M-SPC"
  "C-3"
  "C-o"
  "C-x C-x"
  "C-M-l"
  "M-y"
  "C-s"
  "C-r"
  "M-!"
  "M-c")

(util/global-set-keys
  "C-w"     'backward-kill-word
  "C-h"     'backward-delete-char-untabify
  "C-v"     'set-mark-command
  "M-\\"    'help
  "M-0"     'back-to-indentation
  "C-x C-s" 'util/save-all-buffers!
  "M-j"     'util/join-line
  "M-o"     'util/window-toggle
  "M-;"     'util/comment
  "M-l"     'util/switch-to-previous-buffer)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ISearch

(util/global-set-keys
  "C-s" 'isearch-forward-regexp
  "C-r" 'isearch-backward-regexp)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Font Zoom

(require 'util--zoom)

(util/global-set-keys
  "C-0" 'util--zoom/default
  "C-=" 'util--zoom/inc
  "C--" 'util--zoom/dec)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Filesystem (copy, rename, delete)

(require 'util--fs)

(smartrep-define-key global-map
  "C-c f" '(("d" . 'util--fs/delete-current-buffer-file)
            ("c" . 'util--fs/copy-current-buffer-file)
            ("r" . 'util--fs/rename-current-buffer-file)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Increment / decrement numbers

(util/global-set-keys
 "M-=" 'util/increment-number
 "M--" 'util/decrement-number)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil

(require 'setup--evil)
(require 'util--evil)

(util/global-set-keys
  "C-3" 'evil-normal-state
  "M-E" 'evil-emacs-state)

(util/define-keys (list evil-insert-state-map evil-motion-state-map)
  "C-a" 'beginning-of-line
  "C-e" 'end-of-line)

(util/define-keys evil-insert-state-map
  "C-k"     'kill-line
  "C-y"     'yank
  "C-y"     'yank
  "C-x C-s" 'util--evil/save-all-buffers!)

(util/define-keys evil-motion-state-map
  "0"   'evil-first-non-blank
  "^"   'evil-beginning-of-line
  "L"   'evil-end-of-line
  "H"   'evil-first-non-blank
  "C-j" 'util--evil/motion-5-lines-down
  "C-k" 'util--evil/motion-5-lines-up)

(util/define-keys evil-normal-state-map
  "[ SPC" 'util--evil/insert-line-above
  "] SPC" 'util--evil/insert-line-below)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Elscreen

(require 'setup--elscreen)
(require 'util--elscreen)

(util/global-set-keys
  "M-P" 'elscreen-previous
  "M-N" 'elscreen-next
  "M-X" 'elscreen-kill
  "M-C" 'util--elscreen/create)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Windows

(require 'setup--ace-window)

(util/global-set-keys
  "M-O" 'ace-window)

(smartrep-define-key global-map
    "C-o" '(
            ;; Split
            ("s" . util/split-and-switch-to-window-below)
            ("v" . util/split-and-switch-to-window-right)
            ("x" . util/kill-buffer-and-delete-window)
            ("c" . delete-window)
            ("=" . balance-windows)
            ("o" . delete-other-windows)

            ;; Undo / Redo
            ("p" . winner-undo)
            ("n" . winner-redo)

            ;; Nav
            ("h" . evil-window-left)
            ("j" . evil-window-down)
            ("k" . evil-window-up)
            ("l" . evil-window-right)

            ;; Resize
            ("H" . shrink-window-horizontally )
            ("L" . enlarge-window-horizontally)
            ("J" . enlarge-window)
            ("K" . shrink-window)

            ;; Swap
            ("C-h" . buf-move-left)
            ("C-j" . buf-move-down)
            ("C-k" . buf-move-up)
            ("C-l" . buf-move-right)

            ;; Rotate
            ("r" . 'rotate-layout)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Linum

(require 'setup--linum)

(util/global-set-keys
  "M-L" 'linum-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ace jump

(require 'setup--ace-jump)

(util/define-keys evil-motion-state-map
  "C-f" 'ace-jump-mode
  "C-M-l" 'ace-jump-line-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Smex

(require 'setup--smex)

(util/global-set-keys
  "M-x" 'setup--smex/run-smex)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ido

(require 'setup--ido)
(require 'util--ido)

(util/global-set-keys
  "M-a" 'idomenu
  "M-s" 'ido-switch-buffer)

(add-hook 'ido-setup-hook
          (lambda ()
            (util/define-keys ido-file-completion-map
              "~"   'ido--util/home
              "C-w" 'ido-delete-backward-updir)

            (util/define-keys ido-common-completion-map
              "SPC" 'ido-restrict-to-matches
              "C-j" 'ido-next-match
              "C-k" 'ido-prev-match)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dired

(require 'setup--dired)

(util/global-set-keys
  "M-RET d" 'dired)

(util/define-keys dired-mode-map
  "SPC" 'dired-find-file
  "k"   'dired-previous-line
  "j"   'dired-next-line
  "u"   'dired-up-directory)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Company

(require 'setup--company)

(util/global-set-keys
  "\t" 'company-complete-common)

(util/define-keys company-active-map
  "\C-n"  'company-select-next
  "\C-p"  'company-select-previous
  "\C-d"  'company-show-doc-buffer
  "\C-v"  'company-show-location
  "<tab>" 'company-complete
  "\C-g"  'company-abort
  "M-f"   'helm-company
  "M-h"   'company-quickhelp-manual-begin)

(util/define-keys company-mode-map
  "M-f" 'helm-company)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Paredit

(require 'setup--paredit)

(util/define-keys paredit-mode-map
  "M-?"   'paredit-convolute-sexp
  "M-i"   'paredit-reindent-defun
  "C-M-c" 'paredit-close-round
  "C-M-i" 'paredit-forward-down
  "C-c b" 'backward-kill-sexp
  "C-c B" 'paredit-splice-sexp-killing-backward
  "M-{"   'paredit-wrap-curly
  "M-["   'paredit-wrap-square)

(evil-define-key 'normal evil-paredit-mode-map
  (kbd "d") 'evil-delete
  (kbd "y") 'evil-yank
  (kbd "D") 'paredit-kill
  (kbd "C") (lambda ()
              (interactive)
              (paredit-kill)
              (evil-insert-state)))

(evil-define-key 'insert evil-paredit-mode-map
  (kbd "C-k") 'paredit-kill
  (kbd "C-d") 'delete-forward-char)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Expand region

(util/global-set-keys
  "M-." 'er/expand-region
  "M-," 'er/contract-region)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Multiple Cursors

(util/global-set-keys
  "M-1" 'mc/mark-previous-like-this
  "M-2" 'mc/mark-next-like-this
  "M-3" 'mc/mark-all-like-this
  "M-4" 'mc/edit-lines
  "M-@" 'mc/skip-to-next-like-this
  "M-!" 'mc/skip-to-previous-like-this)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Highlight symbol

(require 'setup--highlight-symbol)

(util/global-set-keys
  "M-n" 'highlight-symbol-next
  "M-p" 'highlight-symbol-prev
  "M-9" 'highlight-symbol-at-point)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Swiper / Counsel

(require 'swiper)

(setq ivy-height 13)

(util/global-set-keys
  "M-h" 'swiper
  "M-H" 'counsel-git-grep)

(util/define-keys ivy-minibuffer-map
  "C-j" 'ivy-next-line
  "C-k" 'ivy-previous-line
  "C-l" 'ivy-done)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Killing

(require 'browse-kill-ring)

(util/global-set-keys
  "M-k" 'kill-region
  "M-y" 'browse-kill-ring)

(util/define-keys browse-kill-ring-mode-map
  "j" 'browse-kill-ring-forward
  "k" 'browse-kill-ring-previous)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Projectile

(require 'setup--projectile)

(util/global-set-keys
  "C-x C-x" 'projectile-find-file)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; NeoTree

(require 'setup--neotree)
(require 'util--neotree)

(util/global-set-keys
  "C-c C-d" 'neotree-toggle
  "C-c d"   'neotree-find
  "C-c C-p" 'util--neotree/project-tree)

(util/define-keys neotree-mode-map
  "C-c C-d" 'neotree-toggle
  "C-c C-r" 'util--neotree/change-to-project-root
  "C-c d"   'neotree-delete-node
  "C-c c"   'neotree-create-node
  "C-c u"   'neotree-select-up-node
  "SPC"     'util--neotree/peek
  "C-c x"   'util/kill-buffer-and-delete-window)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Magit

(require 'setup--magit)

(util/global-set-keys
  "M-RET L" 'magit-log-all
  "M-RET l" 'magit-log-current
  "M-RET s" 'magit-status
  "M-RET B" 'magit-blame)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flycheck

(smartrep-define-key global-map
  "M-RET f" '(("p" . 'flycheck-previous-error)
              ("n" . 'flycheck-next-error)
              ("l" . 'flycheck-list-errors)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs lisp

(util/define-keys emacs-lisp-mode-map
  "C-c C-k" 'eval-buffer
  "M-e"     'eval-defun)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Clojure

(require 'setup--clojure)
(require 'util--clojure)

;; Cljr Prefix
(cljr-add-keybindings-with-prefix "C-c r")

;; Global
(util/global-set-keys
  "C-c >" 'cider-connect
  "C-c <" 'cider-quit)

;; Cider
(util/define-keys cider-mode-map
  "C-c C-c" 'util--clojure/eval-region-or-defun
  "C-c e"   'util--clojure/eval-form-in-repl
  "M-e"     'util--clojure/eval-form
  "C-M-x"   'util--clojure/eval-form
  "C-c TAB" 'util--clojure/insert-region-or-last-sexp-into-repl
  "C-t"     'cider-switch-to-repl-buffer)

;;  Cider Repl
(util/define-keys cider-repl-mode-map
  "C-t"   'cider-switch-to-last-clojure-buffer
  "C-RET" 'cider-repl-newline-and-indent)

;; Cider / Cider Repl
(util/define-keys (list cider-mode-map cider-repl-mode-map)
  "C-c a"   'cider-interrupt
  "C-c g"   'cider-grimoire
  "C-c C-j" 'cider-find-var
  "C-c C-b" 'cider-jump-back
  "C-c d"   'cider-doc
  "C-c s"   'util--clojure/visit-error-buffer
  "C-M-e"   'util--clojure/end-of-defun
  "C-c C-r" 'util--clojure/eval-and-replace-region-or-last-sexp
  "C-c h"   'util--clojure/popup-doc
  "C-c i"   (util/all-buffers-saved (util--clojure/cider-cmd "(user/system-restart!)"))
  "C-c k"   (util/all-buffers-saved (util--clojure/cider-cmd "(user/system-stop!)"))
  "C-c I"   (util--clojure/cider-cmd "(do (require 'clojure.tools.namespace.repl) (clojure.tools.namespace.repl/refresh-all))"))

;; Cider Test
(util/define-keys cider-test-report-mode-map
  "M-j" 'cider-test-jump)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Paxedit

(require 'setup--paxedit)

(defvar paxedit-keys '(("k" . 'paxedit-transpose-backward)
                       ("j" . 'paxedit-transpose-forward)
                       ("d" . 'paxedit-kill)))

(smartrep-define-key emacs-lisp-mode-map
  "C-c j" paxedit-keys)

(smartrep-define-key clojure-mode-map
  "C-c j" paxedit-keys)

(util/define-keys (list emacs-lisp-mode-map
                        cider-mode-map)
  "C-M-j" 'paxedit-transpose-forward
  "C-M-k" 'paxedit-transpose-backward)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Restclient

(require 'setup--restclient)

(util/define-keys restclient-mode-map
  "M-i" 'restclient-http-send-current-stay-in-window)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Haskell

(require 'setup--haskell)

(add-hook 'haskell-mode-hook
          (lambda ()
            (util/define-keys haskell-mode-map
              "C-c c"   'util--c/recompile
              "C-c C-j" 'haskell-mode-jump-to-def-or-tag
              "C-c C-h" 'hoogle
              "C-t"     'haskell-interactive-switch
              "M-i"     'hi2-indent-line
              "M-I"     'hi2-indent-backwards
              "M-e"     'haskell-indent-align-guards-and-rhs)))

;; GHCI
(add-hook 'haskell-interactive-mode-hook
          (lambda ()
            (evil-define-key 'normal haskell-interactive-mode-map
              (kbd "C-a") 'haskell-interactive-mode-beginning)

            (evil-define-key 'insert haskell-interactive-mode-map
              (kbd "C-a") 'haskell-interactive-mode-beginning)

            (util/define-keys haskell-interactive-mode-map
              "C-c C-h" 'hoogle
              "C-t"     'haskell-interactive-switch-back)))

;; Haskell Source Buffer
(add-hook 'interactive-haskell-mode-hook
          (lambda ()
            (util/define-keys interactive-haskell-mode-map
              "M-p" nil
              "M-n" nil
              "M-." nil)

            (util/define-keys haskell-mode-map
              "C-c C-j" 'haskell-mode-jump-to-def-or-tag)))
