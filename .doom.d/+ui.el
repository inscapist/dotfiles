;;; $DOOMDIR/+ui.el -*- lexical-binding: t; -*-


(setq doom-theme 'doom-miramare)
(setq doom-themes-enable-bold t)
(setq doom-themes-enable-italic t)

;; M-x: list-faces-display
;; M-x: describe-face
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Face-Attributes.html
(custom-set-faces!
  '(bold :family "Ubuntu Mono" :weight semi-bold :height 1.0)
  '(link :family "Ubuntu Mono" :slant italic :weight light)
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic)
  '(org-todo :inherit bold)
  '(org-agenda-structure :slant italic)
  '(org-document-title :slant italic)
  '(outline-1 :family "Ubuntu Mono" :weight semi-bold :height 1.1)
  '(outline-2 :family "Ubuntu Mono" :weight normal :foreground "#e39b7b")
  '(outline-3 :family "Ubuntu Mono" :weight normal)
  '(outline-4 :family "Ubuntu Mono" :weight semi-light)
  '(outline-5 :family "Ubuntu Mono" :weight semi-light)
  '(outline-6 :family "Ubuntu Mono" :weight semi-light)
  '(outline-7 :family "Ubuntu Mono" :weight semi-light)
  '(outline-8 :family "Ubuntu Mono" :weight semi-light))

;; Make doom-modeline slightly smaller than editor font
(after! doom-modeline
  (custom-set-faces
   '(mode-line ((t (:family "Advent Pro" :height 0.9))))
   '(mode-line-inactive ((t (:family "Advent Pro" :height 0.9))))))

(setq doom-font (font-spec :family "Dank Mono" :size 16 :weight 'semi-light))
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
