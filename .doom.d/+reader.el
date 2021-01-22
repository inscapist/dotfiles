;;; $DOOMDIR/+reader.el -*- lexical-binding: t; -*-

(use-package! nov
  :mode ("\\.epub\\'" . nov-mode)
  :config
  (setq nov-save-place-file (concat doom-cache-dir "nov-places")))
