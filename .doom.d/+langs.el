;;; $DOOMDIR/+langs.el -*- lexical-binding: t; -*-

(setq web-mode-code-indent-offset 2)

;; Elixir
(after! lsp-mode
  (setq lsp-enable-file-watchers nil)
  (setq lsp-elixir-project-dir "web")
  (add-to-list 'exec-path "~/elixir-ls/release"))

;; Typescript
(setq-hook! 'typescript-mode-hook +format-with-lsp nil)
(setq-hook! 'typescript-tsx-mode-hook +format-with-lsp nil)

;; Web/HTML/Js
(setq-hook! 'web-mode-hook +format-with 'prettier)
(setq-hook! 'html-mode-hook +format-with 'prettier)

