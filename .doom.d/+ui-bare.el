;;; $DOOMDIR/+ui.el -*- lexical-binding: t; -*-

;; =======================================================================
;; UI variables
;; =======================================================================

(setq felix/default-font "Monoid"
      felix/default-font-size 11
      felix/default-font-weight 'light
      felix/ui-font "Advent Pro"
      felix/ui-font-size 12
      felix/ui-font-weight 'light
      felix/mode-line-height 1.0)

(setq doom-theme 'doom-miramare
      doom-themes-enable-bold t
      doom-themes-enable-italic t
      doom-font (font-spec :family felix/default-font :size felix/default-font-size :weight felix/default-font-weight)
      doom-variable-pitch-font (font-spec :family felix/ui-font :size felix/ui-font-size :weight felix/ui-font-weight)
      all-the-icons-scale-factor 0.8)

(setq org-superstar-headline-bullets-list '("#"))

;; disable shortmenu
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

(after! doom-modeline
  (display-battery-mode 1)
  (setq doom-modeline-lsp nil)
  (setq doom-modeline-env-version t)
  (custom-set-faces
   `(mode-line ((t (:family ,felix/ui-font :height ,felix/mode-line-height))))
   `(mode-line-buffer-id ((t (:family ,felix/ui-font :height ,felix/mode-line-height))))
   `(mode-line-emphasis ((t (:family ,felix/ui-font :height ,felix/mode-line-height))))
   `(mode-line-highlight ((t (:family ,felix/ui-font :height ,felix/mode-line-height))))
   `(mode-line-inactive ((t (:family ,felix/ui-font :height ,felix/mode-line-height))))))

(custom-set-faces!
  `(font-lock-constant-face :weight semi-bold)
  `(font-lock-doc-face :foreground "#678f67"))
