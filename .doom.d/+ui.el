;;; $DOOMDIR/+ui.el -*- lexical-binding: t; -*-

;; =======================================================================
;; UI variables
;; =======================================================================

;; To disable font smoothing, run
;; defaults write org.gnu.Emacs AppleFontSmoothing -int 0
;;
(setq felix/default-font "Ellograph CF"
      felix/default-font-size 13
      felix/default-font-weight 'light
      felix/ui-font "Hermit"
      felix/ui-font-size 12
      felix/ui-font-weight 'normal
      felix/mode-line-height 0.95)

(setq
 ;; doom-theme 'doom-miramare
 ;; doom-theme 'darktooth
 doom-theme 'kaolin-mono-dark
 doom-themes-enable-bold t
 doom-themes-enable-italic t
 doom-font (font-spec :family felix/default-font :size felix/default-font-size :weight felix/default-font-weight)
 doom-variable-pitch-font (font-spec :family felix/ui-font :size felix/ui-font-size :weight felix/ui-font-weight)
 all-the-icons-scale-factor 0.9)


;; disable shortmenu
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

;; uniformize doom-modeline style
(after! doom-modeline
  (display-battery-mode 1)
  (setq doom-modeline-lsp nil)
  (setq doom-modeline-env-version t))

(custom-set-faces!
  `(font-lock-comment-face :slant italic)
  `(font-lock-keyword-face :slant italic)
   `((mode-line
      mode-line-inactive)
     :height ,felix/mode-line-height))


;; https://www.fileformat.info/info/unicode/category/Sm/list.htm
(plist-put! +ligatures-extra-symbols
            :and           "⋀"
            :or            "⋁"
            :return        "↚"
            :tuple nil)

;transparent adjustment
(set-frame-parameter (selected-frame) 'alpha '(92 . 88))
(add-to-list 'default-frame-alist '(alpha . (92 . 88)))


;; ==========================
;; Optional
;; ==========================
;;
;; (after! lsp-ui
;;   (setq lsp-ui-doc-enable t))
;;
;; (after! darktooth-theme
;;         (darktooth-modeline))
