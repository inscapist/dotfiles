;;; $DOOMDIR/+ui.el -*- lexical-binding: t; -*-


(setq doom-theme 'doom-miramare)
(setq doom-themes-enable-bold t)
(setq doom-themes-enable-italic t)

;; M-x: list-faces-display
;; M-x: describe-face
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Face-Attributes.html
(custom-set-faces!
  '(italic :family "Dank Mono" :height 1.0 :slant italic)
  '(bold :family "Monoid" :height 0.8)
  '(link :inherit 'italic :width condensed)
  '(font-lock-comment-face :inherit 'italic)
  '(font-lock-keyword-face :inherit 'italic)
  '(org-todo :inherit 'bold)
  '(org-agenda-structure :inherit 'italic)
  '(org-document-title :inherit 'italic))

;; Make doom-modeline slightly smaller than editor font
(after! doom-modeline
  (custom-set-faces
   '(mode-line ((t (:family "Advent Pro" :height 0.85))))
   '(mode-line-inactive ((t (:family "Advent Pro" :height 0.85))))))

(setq doom-font (font-spec :family "Dank Mono" :size 16 :weight 'light))
(setq doom-variable-pitch-font (font-spec :family "Advent Pro" :size 16 :weight 'light))
(setq all-the-icons-scale-factor 0.8)
(setq org-superstar-headline-bullets-list '("#"))

;; disable shortmenu
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)


;; THEMES CUSTOMIZATION

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
