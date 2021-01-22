;;; $DOOMDIR/+ui.el -*- lexical-binding: t; -*-

;; =======================================================================
;; UI variables
;; =======================================================================

(setq felix/default-font "Ellograph CF"
      felix/default-font-size 13
      felix/default-font-weight 'light
      felix/ui-font "Hermit"
      felix/ui-font-size 12
      felix/ui-font-weight 'normal)

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
(doom/set-frame-opacity 93)

;; Useful for showing types in haskell
(after! lsp-ui
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-max-width 300
        lsp-ui-doc-max-height 200))


;; modeline
(setq telephone-line-primary-left-separator 'telephone-line-cubed-left
      telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
      telephone-line-primary-right-separator 'telephone-line-cubed-right
      telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right
      telephone-line-height 21
      telephone-line-evil-use-short-tag nil)
(telephone-line-mode t)
