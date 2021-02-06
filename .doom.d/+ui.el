;;; $DOOMDIR/+ui.el -*- lexical-binding: t; -*-

;; =======================================================================
;; UI variables
;; =======================================================================

(setq felix/default-font "Ellograph CF"
      felix/default-font-size 16
      felix/default-font-weight 'light
      felix/ui-font "Unica One"
      felix/ui-font-size 11
      felix/ui-font-weight 'light)

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
  `(font-lock-comment-face :slant italic)
  `(font-lock-keyword-face :slant italic)
  ;; `(lsp-ui-doc-background :background "#16211C") ;; to match dark themes
  ;; `(lsp-ui-doc-background :background "#f3e7d3") ;; to match light themes
  `(treemacs-root-face :family ,felix/default-font :slant italic :weight normal))


;; ==========================
;; Optional
;; ==========================

;; disable shortmenu
;; (remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

;; Customize or disable extra ligatures
;; https://www.fileformat.info/info/unicode/category/Sm/list.htm
(plist-put! +ligatures-extra-symbols
            :and           "⋀"
            :or            "⋁"
            :return        nil
            :yield         nil
            :tuple         nil)


;; successor of golden-ratio.el
(use-package zoom
  :hook (doom-first-input . zoom-mode)
  :config
  (setq zoom-size '(0.618 . 0.618)
        zoom-ignored-major-modes '(dired-mode vterm-mode help-mode helpful-mode rxt-help-mode help-mode-menu org-mode)
        zoom-ignored-buffer-names '("*doom:scratch*" "*info*" "*helpful variable: argv*")
        zoom-ignored-buffer-name-regexps '("^\\*calc" "\\*helpful variable: .*\\*")
        zoom-ignore-predicates (list (lambda () (< (count-lines (point-min) (point-max)) 20)))))


;; transparent adjustment, may not work on certain Emacs distro (eg. emacs-plus)
(doom/set-frame-opacity 91)

;; Useful for showing types in haskell but obtrusive
;; (after! lsp-ui
;;   (setq lsp-ui-doc-enable t
;;         lsp-ui-doc-use-childframe t
;;         lsp-ui-doc-max-width 80
;;         lsp-ui-doc-max-height 20))


;; modeline
(setq telephone-line-primary-left-separator 'telephone-line-cubed-left
      telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
      telephone-line-primary-right-separator 'telephone-line-cubed-right
      telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right
      telephone-line-height 21
      telephone-line-evil-use-short-tag nil)
(telephone-line-mode t)

