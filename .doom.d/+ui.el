;;; $DOOMDIR/+ui.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-gruvbox)
(setq doom-themes-enable-bold t)
(setq doom-font (font-spec :family "Iosevka" :size 16 :weight 'light))
(setq doom-variable-pitch-font (font-spec :family "Overpass" :size 14 :weight 'light))
(setq all-the-icons-scale-factor 0.8)
(setq org-superstar-headline-bullets-list '("☯" "☰" "☱" "☲" "☳" "☴" "☵" "☶" "☷"))


;; disable shortmenu
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

;; customize treemacs
(after! treemacs
  (setq treemacs--width-is-locked nil)
  (setq treemacs-width 35)
  (with-eval-after-load 'treemacs
    (defun treemacs-ignore-python-cache-dirs (_filename absolute-path)
      (or
       (cl-search "__pycache__" absolute-path)
       (cl-search ".pytest_cache" absolute-path)))
    (add-to-list 'treemacs-ignored-file-predicates #'treemacs-ignore-python-cache-dirs)))


;; Make doom-modeline slightly smaller than editor font
(after! doom-modeline
  (custom-set-faces
    '(mode-line ((t (:family "Overpass" :height 0.90))))
    '(mode-line-inactive ((t (:family "Overpass" :height 0.90))))))


;; Make evil usable in terminal
(when (not (display-graphic-p))
  (add-hook 'evil-insert-state-entry-hook (lambda () (send-string-to-terminal "\033[5 q")))
  (add-hook 'evil-normal-state-entry-hook (lambda () (send-string-to-terminal "\033[0 q"))))

