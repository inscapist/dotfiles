;;; $DOOMDIR/+langs.el -*- lexical-binding: t; -*-

(setq web-mode-code-indent-offset 2)

;; Elixir
(after! lsp-mode
  (setq lsp-enable-file-watchers nil)
  (add-to-list 'exec-path "~/elixir-ls"))

;; Typescript
(setq-hook! 'typescript-mode-hook +format-with-lsp nil)
(setq-hook! 'typescript-tsx-mode-hook +format-with-lsp nil)

;; Web/HTML/Js
(setq-hook! 'web-mode-hook +format-with 'prettier)
(setq-hook! 'html-mode-hook +format-with 'prettier)


;; electric rjsx
;; https://github.com/felipeochoa/rjsx-mode/issues/112
(defun +javascript-rjsx-electric-gt-a (_)
  (when (and (looking-back "<>")
             (looking-at-p "/>"))
    (save-excursion (insert "<"))))
(advice-add #'rjsx-electric-gt :after #'+javascript-rjsx-electric-gt-a)
