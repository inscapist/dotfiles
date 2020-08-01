;;; $DOOMDIR/+ui.el -*- lexical-binding: t; -*-

;; =======================================================================
;; UI variables
;; =======================================================================

(setq felix/default-font "Dank Mono"
      felix/default-font-size 17
      felix/default-font-weight 'light
      felix/cursive-font "Dank Mono"
      felix/book-font "Ubuntu Mono"
      felix/bold-font "Ubuntu Mono" ;; alterantively, Monoid
      felix/bold-height 1.0
      felix/ui-font "Advent Pro" ;; alternatively, Overpass
      felix/ui-font-size 17
      felix/ui-font-weight 'light
      felix/mode-line-height 0.9)

(setq doom-theme 'doom-miramare
      doom-themes-enable-bold t
      doom-themes-enable-italic t
      doom-font (font-spec :family felix/default-font :size felix/default-font-size :weight felix/default-font-weight)
      doom-variable-pitch-font (font-spec :family felix/ui-font :size felix/ui-font-size :weight felix/ui-font-weight)
      all-the-icons-scale-factor 0.8)

(setq org-superstar-headline-bullets-list '("#"))


;; =======================================================================
;; FACES CUSTOMIZATION
;; =======================================================================

;; M-x: list-faces-display
;; M-x: describe-face
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Face-Attributes.html
(custom-set-faces!
  `(bold :family ,felix/bold-font :weight semi-bold :height ,felix/bold-height)
  `(link :family ,felix/cursive-font :slant italic :weight light)
  `(font-lock-comment-face :family ,felix/cursive-font :slant italic)
  `(font-lock-keyword-face :family ,felix/cursive-font :slant italic)
  `(org-todo :inherit bold)
  `(org-agenda-structure :family ,felix/cursive-font :slant italic)
  `(org-document-title :family ,felix/cursive-font :slant italic)
  `(outline-1 :family ,felix/book-font :weight semi-bold :height 1.1)
  `(outline-2 :family ,felix/book-font :weight normal :foreground "#e39b7b")
  `(outline-3 :family ,felix/book-font :weight normal)
  `(outline-4 :family ,felix/book-font :weight semi-light)
  `(outline-5 :family ,felix/book-font :weight semi-light)
  `(outline-6 :family ,felix/book-font :weight semi-light)
  `(outline-7 :family ,felix/book-font :weight semi-light)
  `(outline-8 :family ,felix/book-font :weight semi-light))

;; Make doom-modeline slightly smaller than editor font
(after! doom-modeline
  (custom-set-faces
   `(mode-line ((t (:family ,felix/ui-font :height ,felix/mode-line-height))))
   `(mode-line-inactive ((t (:family ,felix/ui-font :height ,felix/mode-line-height))))))

;; disable shortmenu
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)


;; =======================================================================
;; THEMES CUSTOMIZATION
;; =======================================================================

;; gruvbox override
(setq doom-gruvbox-dark-variant "medium")

;; nord override
(setq doom-nord-comment-bg nil
      doom-nord-brighter-comments nil)

;; tao override
(setq tao-theme-use-boxes nil
      tao-theme-use-height nil
      tao-theme-sepia-depth 10
      tao-theme-sepia-saturation 1.03)
