(ido-mode 1)
(ido-everywhere 1)
(ido-vertical-mode 1)
(set-default 'imenu-auto-rescan t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ido Ubiquitous + crm-custom-mode
;; https://github.com/DarwinAwardWinner/crm-custom

(require 'ido-ubiquitous)
(require 'crm-custom)
(ido-ubiquitous-mode 1)
(crm-custom-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'setup--ido)
