;;; $DOOMDIR/+ui.el -*- lexical-binding: t; -*-

;; =======================================================================
;; UI variables
;; =======================================================================

;; custom variables
(setq felix/default-font "Ellograph CF"
      felix/default-font-size 13
      felix/default-font-weight 'light ;; refer font-weight-table variable
      felix/muted-font-height 0.95
      felix/modeline-font "Ellograph CF"
      felix/modeline-height 0.93)

;; font settings
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t
      doom-font (font-spec :family felix/default-font :size felix/default-font-size :weight felix/default-font-weight)
      all-the-icons-scale-factor 0.7)


;; use kaolin theme
(use-package kaolin-themes
  :config
  (load-theme 'kaolin-mono-dark t)
  (setq kaolin-themes-italic-comments t))


;; customize faces. list with SPC-h-F
(custom-set-faces!
  `(font-lock-comment-face :slant italic :weight thin :height ,felix/muted-font-height)
  `(font-lock-keyword-face :slant italic :weight thin :height ,felix/muted-font-height)
  `(font-lock-function-name-face :slant normal :weight normal)
  `(mode-line :height ,felix/modeline-height :family ,felix/modeline-font)
  `(mode-line-inactive :height ,felix/modeline-height ,felix/modeline-font))

;; performance hack
(setq inhibit-compacting-font-caches t)

;; thinner modeline for (modeline +light)
(setq +modeline-height 18)

