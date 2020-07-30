;;; $DOOMDIR/+ui.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-miramare)
(setq doom-themes-enable-bold t)
(setq doom-themes-enable-italic t)
(setq doom-font (font-spec :family "Dank Mono" :size 17 :weight 'semi-light))
(setq doom-variable-pitch-font (font-spec :family "Advent Pro" :size 16 :weight 'light))
(setq all-the-icons-scale-factor 0.8)
;; (setq org-superstar-headline-bullets-list '("☯" "☰" "☱" "☲" "☳" "☴" "☵" "☶" "☷"))
(setq org-superstar-headline-bullets-list '("#"))


;; disable shortmenu
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

;; customize treemacs
(after! treemacs
  (setq treemacs--width-is-locked nil)
  (setq treemacs-width 30)
  (with-eval-after-load 'treemacs
    (defun treemacs-ignore-python-cache-dirs (_filename absolute-path)
      (or
       (cl-search "__pycache__" absolute-path)
       (cl-search ".pytest_cache" absolute-path)))
    (add-to-list 'treemacs-ignored-file-predicates #'treemacs-ignore-python-cache-dirs)))


;; Make doom-modeline slightly smaller than editor font
(after! doom-modeline
  (custom-set-faces
   '(mode-line ((t (:family "Advent Pro" :height 0.85))))
   '(mode-line-inactive ((t (:family "Advent Pro" :height 0.85))))))


;; Make evil usable in terminal
(when (not (display-graphic-p))
  (add-hook 'evil-insert-state-entry-hook (lambda () (send-string-to-terminal "\033[5 q")))
  (add-hook 'evil-normal-state-entry-hook (lambda () (send-string-to-terminal "\033[0 q"))))


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
