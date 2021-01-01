;;; $DOOMDIR/+langs.el -*- lexical-binding: t; -*-

(setq web-mode-code-indent-offset 2)

(setq-hook! 'typescript-mode-hook +format-with-lsp nil)
(setq-hook! 'typescript-tsx-mode-hook +format-with-lsp nil)

(setq-hook! 'web-mode-hook +format-with 'prettier)
(setq-hook! 'html-mode-hook +format-with 'prettier)

(after! lsp-mode
  (setq lsp-enable-file-watchers nil))

;; (after! rustic
;;   (setq rustic-lsp-server 'rls))
