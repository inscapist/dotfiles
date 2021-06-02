;;; $DOOMDIR/+filetree.el -*- lexical-binding: t; -*-

(setq felix/treemacs-font "Unica One"
      felix/treemacs-font-size 11
      felix/treemacs-font-weight 'light
      doom-variable-pitch-font (font-spec :family felix/treemacs-font :size felix/treemacs-font-size :weight felix/treemacs-font-weight))

(custom-set-faces!
`(treemacs-root-face :family ,felix/default-font :slant italic :weight normal))

;; customize treemacs
(after! treemacs
  (setq treemacs--width-is-locked nil
        treemacs-width 21
        treemacs-position 'left
        treemacs-show-cursor t
        treemacs-read-string-input 'from-minibuffer)
  (treemacs-git-mode 'simple)
  (with-eval-after-load 'treemacs
    (defun treemacs-ignore-python-cache-dirs (_filename absolute-path)
      (or
       (cl-search "__pycache__" absolute-path)
       (cl-search ".pytest_cache" absolute-path)))
    (add-to-list 'treemacs-ignored-file-predicates #'treemacs-ignore-python-cache-dirs)
    (add-to-list 'treemacs-pre-file-insert-predicates #'treemacs-is-file-git-ignored?)))
