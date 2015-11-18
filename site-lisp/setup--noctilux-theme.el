(require 'ace-jump-mode)
(require 'ace-window)
(require 'highlight-symbol)
(require 'swiper)
(require 'neotree)
(require 'rainbow-delimiters)
(require 'cider)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Colors

(defvar color-highlight "#555555")
(defvar color-background "#333333")
(defvar color-foreground "#cccccc")
(defvar color-comment "#9ac")
(defvar color-ace "#9B30FF")
(defvar color-cursor "salmon")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setup

(defun setup--noctilux-theme/customize ()
  ;; Cursor
  (set-face-attribute 'cursor  nil :background color-cursor)
  (set-face-attribute 'default nil :background color-background :foreground color-foreground)

  ;; Highlight
  (set-face-attribute 'highlight nil :background color-highlight)

  ;; Comments
  (set-face-attribute 'font-lock-comment-delimiter-face nil :foreground color-comment)
  (set-face-attribute 'font-lock-comment-face           nil :foreground color-comment)

  ;; Delimiters
  (set-face-attribute 'show-paren-match-face nil :inverse-video t)

  ;; ISearch
  (set-face-attribute 'isearch nil :background color-cursor :foreground color-highlight :underline t)

  ;; Swiper
  (set-face-attribute 'swiper-match-face-3 nil :foreground color-cursor :background color-highlight :inverse-video nil)

  ;; Highlight symbol
  (set-face-attribute 'highlight-symbol-face nil :foreground nil :background nil :inverse-video nil :underline nil)

  ;; Rainbow delimiters
  (set-face-attribute 'rainbow-delimiters-depth-1-face nil :foreground "#aaa")
  (set-face-attribute 'rainbow-delimiters-depth-2-face nil :foreground "#9B30FF")
  (set-face-attribute 'rainbow-delimiters-depth-3-face nil :foreground "#00ff7f")
  (set-face-attribute 'rainbow-delimiters-depth-4-face nil :foreground color-cursor)
  (set-face-attribute 'rainbow-delimiters-depth-5-face nil :foreground "#836FFF")
  (set-face-attribute 'rainbow-delimiters-depth-6-face nil :foreground "#FF00FF")
  (set-face-attribute 'rainbow-delimiters-depth-7-face nil :foreground "#00ff7f")
  (set-face-attribute 'rainbow-delimiters-depth-8-face nil :foreground "#0f0")
  (set-face-attribute 'rainbow-delimiters-depth-9-face nil :foreground "#00ffff")

  ;; Neotree
  (set-face-attribute 'neo-banner-face    nil :foreground color-foreground :background nil)
  (set-face-attribute 'neo-header-face    nil :foreground color-foreground :background nil)
  (set-face-attribute 'neo-root-dir-face  nil :foreground color-foreground :background nil)
  (set-face-attribute 'neo-file-link-face nil :foreground "#aaccff"        :background nil)
  (set-face-attribute 'neo-button-face    nil :foreground "#836FFF"        :background nil)

  ;; Cider
  (set-face-attribute 'cider-result-overlay-face nil :foreground nil :background color-highlight)
  )


(defun setup--noctilux-theme/load ()
  (interactive)

  (load-theme 'noctilux t)
  (setup--noctilux-theme/customize)

  (custom-set-faces
   `(region ((t (:inherit highlight :foreground nil :background ,color-highlight :inverse-video nil))))
   `(lazy-highlight ((t (:inherit highlight :foreground nil :background ,color-highlight :inverse-video nil))))
   `(lazy-highlight-face ((t (:inherit highlight :foreground nil :background ,color-highlight :inverse-video nil))))
   `(secondary-selection ((t (:background ,color-highlight))))
   `(ivy-current-match ((t (:inherit highlight))))
   `(eval-sexp-fu-flash ((t (:inherit highlight))))
   `(ace-jump-face-foreground ((t (:inherit highlight :foreground ,color-cursor :background ,color-highlight :inverse-video nil))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load theme

(setup--noctilux-theme/load)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'setup--noctilux-theme)
