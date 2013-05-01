;;
;; File: init-display.el
;; Look and feel related customisations.

;; Light Table inspired colour-theme.
(load-theme 'lt-dark t)

;; Set custom font.
;; Fonts larger on Windows (or home pixel density), so size differs
;; between `system-type'.
(defvar font-name "Consolas")
(defvar font-size (if (eq system-type 'windows-nt)
                      10
                      13))
(defvar font-string (format "%s-%d" font-name font-size))

;; Ensure font exists first.
;; Font height is pt size times 10.
(unless (null (x-list-fonts font-name))
  (setq graphene-default-font font-string)
  (setq graphene-fixed-pitch-font font-string)
  (defvar graphene-font-height (* font-size 10)))

;; Disable menu-bar on Windows.
(when (eq system-type 'windows-nt)
  (menu-bar-mode -1))

;; If OS X full-screen is available, do it.
(when (fboundp 'toggle-frame-fullscreen)
  (toggle-frame-fullscreen))

(provide 'init-display)
