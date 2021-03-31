;;; $DOOMDIR/+ui.el -*- lexical-binding: t; -*-

;; =======================================================================
;; UI variables
;; =======================================================================

(setq felix/default-font "Ellograph CF"
      felix/default-font-size 14
      felix/default-font-weight 'light ;; refer font-weight-table variable
      felix/ui-font "Unica One"
      felix/ui-font-size 11
      felix/ui-font-weight 'light
      felix/modeline-font "Ellograph CF"
      felix/modeline-height 0.94)

(setq
 ;; ;; choose your pokemon =>
 ;; doom-theme 'doom-miramare
 ;; doom-theme 'darktooth
 ;; doom-theme 'chocolate
 doom-themes-enable-bold t
 doom-themes-enable-italic t
 doom-font (font-spec :family felix/default-font :size felix/default-font-size :weight felix/default-font-weight)
 doom-variable-pitch-font (font-spec :family felix/ui-font :size felix/ui-font-size :weight felix/ui-font-weight)
 all-the-icons-scale-factor 0.7)

;; use kaolin theme
(use-package kaolin-themes
  :config
  (load-theme 'kaolin-mono-dark t)
  (setq kaolin-themes-italic-comments t)
  (kaolin-treemacs-theme))


;; customize faces. list with SPC-h-F
(custom-set-faces!
  `(font-lock-comment-face :slant italic :weight thin)
  `(font-lock-keyword-face :slant italic :weight thin :height 1.0)
  `(font-lock-function-name-face :slant normal :weight normal)
  `(mode-line :height ,felix/modeline-height :family ,felix/modeline-font)
  `(mode-line-inactive :height ,felix/modeline-height ,felix/modeline-font)
  ;; ;; lsp UI only
  ;; `(lsp-ui-doc-background :background "#16211C") ;; to match dark themes
  ;; `(lsp-ui-doc-background :background "#f3e7d3") ;; to match light themes
  `(treemacs-root-face :family ,felix/default-font :slant italic :weight normal))


;; Yabai can handle this better, globally
;; (doom/set-frame-opacity 88)

;; thinner modeline for (modeline +light)
(setq +modeline-height 18)
