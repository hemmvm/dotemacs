

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Misc

(setq highlight-symbol-on-navigation-p t)
(setq highlight-symbol-idle-delay 1.5)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Colors

(setq highlight-symbol-colors
  '("yellow"
    "DeepPink"
    "MediumPurple1"
    "SpringGreen1"
    "LightSkyBlue1"
    "IndianRed1"
    "MistyRose1"
    "SlateBlue1"
    "HotPink1"
    "RoyalBlue1"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hook

(add-hook 'prog-mode-hook 'highlight-symbol-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'setup--highlight-symbol)
