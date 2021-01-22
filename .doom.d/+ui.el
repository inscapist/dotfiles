;;; $DOOMDIR/+ui.el -*- lexical-binding: t; -*-

;; =======================================================================
;; UI variables
;; =======================================================================

(setq felix/default-font "Ellograph CF"
      felix/default-font-size 13
      felix/default-font-weight 'light
      felix/ui-font "Hermit"
      felix/ui-font-size 12
      felix/ui-font-weight 'normal
      felix/mode-line-height 0.95)

(setq
 ;; ;; choose your pokemon =>
 ;; doom-theme 'doom-miramare
 ;; doom-theme 'darktooth
 ;; doom-theme 'chocolate
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
  `(lsp-ui-doc-background :background "#16211C") ;; to match kaolin-mono-dark
  `(treemacs-root-face :family ,felix/default-font :slant italic :weight normal))


;; https://www.fileformat.info/info/unicode/category/Sm/list.htm
(plist-put! +ligatures-extra-symbols
            :and           "⋀"
            :or            "⋁"
            :return        "↚"
            :tuple nil)

;; ==========================
;; Optional
;; ==========================

;; transparent adjustment, may not work on certain Emacs distro (eg. emacs-plus)
(doom/set-frame-opacity 92)

;; Useful for showing types in haskell
(after! lsp-ui
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-max-width 300
        lsp-ui-doc-max-height 200))

