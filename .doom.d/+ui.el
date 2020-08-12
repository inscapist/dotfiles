;;; $DOOMDIR/+ui.el -*- lexical-binding: t; -*-

;; =======================================================================
;; UI variables
;; =======================================================================

(setq felix/default-font "Dank Mono" ;; alternatively, Victor/Recursive Mono
      felix/default-font-size 13
      felix/default-font-weight 'light
      felix/cursive-font "Dank Mono" ;; alternatively, Victor Mono
      felix/cursive-height 0.95
      felix/book-font "Ubuntu Mono"
      felix/book-height 1.0
      felix/punk-font "Monoid HalfTight" ;; alternatively, Iosevka
      felix/punk-height 0.75
      felix/punk-height-smaller 0.7
      felix/ui-font "Advent Pro" ;; alternatively, Overpass/Ubuntu
      felix/ui-font-size 12
      felix/ui-font-weight 'light
      felix/mode-line-height 0.9)

(setq doom-theme 'doom-miramare
      doom-themes-enable-bold t
      doom-themes-enable-italic t
      doom-font (font-spec :family felix/default-font :size felix/default-font-size :weight felix/default-font-weight)
      doom-variable-pitch-font (font-spec :family felix/ui-font :size felix/ui-font-size :weight felix/ui-font-weight)
      all-the-icons-scale-factor 0.8)

(setq org-superstar-headline-bullets-list '("#"))

;; disable shortmenu
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

;; =======================================================================
;; FACES CUSTOMIZATION
;; =======================================================================

;; M-x: list-faces-display
;; M-x: describe-face
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Face-Attributes.html
(custom-set-faces!
  `(bold :family ,felix/punk-font :weight semi-bold :height ,felix/punk-height)
  `(link :family ,felix/punk-font :slant normal :weight semi-bold :height ,felix/punk-height-smaller)
  `(font-lock-comment-face :slant italic)
  `(font-lock-keyword-face :family ,felix/cursive-font :slant italic :height ,felix/cursive-height)
  `(font-lock-constant-face :family ,felix/punk-font :weight semi-bold :height ,felix/punk-height)
  `(org-agenda-structure :family ,felix/ui-font :slant normal)
  `(org-agenda-date :family ,felix/punk-font :weight semi-bold :height ,felix/punk-height)
  `(org-agenda-date-today :family ,felix/punk-font :weight semi-bold :height ,felix/punk-height)
  `(org-agenda-date-weekend :family ,felix/punk-font :weight semi-bold :height ,felix/punk-height)
  `(org-document-title :family ,felix/cursive-font :slant italic)
  `(+org-todo-onhold :inherit org-todo)
  `(+org-todo-project :inherit org-todo)
  `(+org-todo-active :inherit org-todo)
  `(outline-1 :family ,felix/punk-font :weight semi-bold :height ,felix/punk-height)
  `(outline-2 :family ,felix/book-font :weight normal :height ,felix/book-height :foreground "#89beba")
  `(outline-3 :family ,felix/book-font :weight normal :height ,felix/book-height)
  `(outline-4 :family ,felix/book-font :weight semi-light :height ,felix/book-height)
  `(outline-5 :family ,felix/book-font :weight semi-light :height ,felix/book-height)
  `(outline-6 :family ,felix/book-font :weight semi-light :height ,felix/book-height)
  `(outline-7 :family ,felix/book-font :weight semi-light :height ,felix/book-height)
  `(outline-8 :family ,felix/book-font :weight semi-light :height ,felix/book-height)
  `(web-mode-html-tag-face :family ,felix/punk-font :slant normal :weight semi-bold :height ,felix/punk-height))

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
