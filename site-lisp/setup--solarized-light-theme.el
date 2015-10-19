(require 'ace-jump-mode)
(require 'ace-window)
(require 'highlight-symbol)
(require 'cider)
(require 'swiper)
(require 'company)
(require 'neotree)
(require 'org)
(require 'rainbow-delimiters)
(require 'ido-vertical-mode)


(defun setup--solarized-light-theme/customize ()
  (let ((color-highlight "#eee8d5")
        (color-foreground "#cccccc")
        (color-background "#FDF6E3")
        (color-comment "#9ac")
        (color-ace "#9B30FF"))

    ;; Cursor
    (set-face-attribute 'cursor  nil :background "salmon")
    ;; (set-face-attribute 'default nil :background color-background :foreground color-foreground)

    ;; Highlight
    ;; (set-face-attribute 'highlight nil :background color-highlight)

    ;; Delimiters
    ;; (set-face-attribute 'show-paren-match-face nil :inverse-video t)

    ;; ISearch
    (set-face-attribute 'lazy-highlight              nil :background color-highlight :foreground nil)
    (set-face-attribute 'isearch-lazy-highlight-face nil :background color-highlight :foreground nil)
    (set-face-attribute 'isearch                     nil :background "salmon"         :foreground color-highlight :underline t)

    ;; Swiper
    (set-face-attribute 'swiper-match-face-3 nil :foreground "salmon" :background color-highlight :inverse-video nil)

    ;; Highlight symbol
    ;; (set-face-attribute 'highlight-symbol-face nil :foreground nil :background nil :inverse-video nil :underline nil)

    ;; Rainbow delimiters
    (set-face-attribute 'rainbow-delimiters-depth-1-face nil :foreground "#aaa")
    (set-face-attribute 'rainbow-delimiters-depth-2-face nil :foreground "#9B30FF")
    (set-face-attribute 'rainbow-delimiters-depth-3-face nil :foreground "#00ff7f")
    (set-face-attribute 'rainbow-delimiters-depth-4-face nil :foreground "salmon")
    (set-face-attribute 'rainbow-delimiters-depth-5-face nil :foreground "#836FFF")
    (set-face-attribute 'rainbow-delimiters-depth-6-face nil :foreground "#FF00FF")
    (set-face-attribute 'rainbow-delimiters-depth-7-face nil :foreground "#00ff7f")
    (set-face-attribute 'rainbow-delimiters-depth-8-face nil :foreground "#0f0")
    (set-face-attribute 'rainbow-delimiters-depth-9-face nil :foreground "#00ffff")

    ;; Ace jump mode
    (set-face-attribute 'aw-leading-char-face nil     :foreground color-ace :background color-background)
    (set-face-attribute 'ace-jump-face-foreground nil :foreground color-ace)

    ;; Ido
    (set-face-attribute 'ido-vertical-only-match-face nil :foreground "#b58900" :background color-background)
    ))


(defun setup--solarized-light-theme/load ()
  (interactive)

  (load-theme 'solarized-light t)
  (setup--solarized-light-theme/customize)

  (custom-set-faces
   '(region ((t (:inherit highlight :foreground nil :background "#eee8d5" :inverse-video nil))))
   '(ivy-current-match ((t (:inherit highlight))))

   ;; '(isearch-lazy-highlight ((t (:inherit region))))

   '(swiper-match-face-1 ((t (:inherit highlight))))
   '(swiper-match-face-2 ((t (:inherit swiper-match-face-3))))

   )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load theme

(setup--solarized-light-theme/load)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'setup--solarized-light-theme)
