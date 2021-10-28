;;; $DOOMDIR/+langs.el -*- lexical-binding: t; -*-

(setq web-mode-code-indent-offset 2)

;; Elixir
(after! lsp-mode
  (setq lsp-enable-file-watchers nil)
  (setq lsp-clients-typescript-init-opts '(:importModuleSpecifierPreference "non-relative"))
  (add-to-list 'exec-path "~/elixir-ls"))

;; SQL
(setq sqlformat-command 'pgformatter)
(setq sqlformat-args '("-s2" "-g" "-u" "2" "-U" "1"))

;; electric rjsx
;; https://github.com/felipeochoa/rjsx-mode/issues/112
(defun +javascript-rjsx-electric-gt-a (_)
  (when (and (looking-back "<>")
             (looking-at-p "/>"))
    (save-excursion (insert "<"))))
(advice-add #'rjsx-electric-gt :after #'+javascript-rjsx-electric-gt-a)

;; typescript tsx use prettier
(setq-hook! 'typescript-tsx-mode-hook +format-with-lsp nil)
(setq-hook! 'typescript-mode-hook +format-with-lsp nil)

;; do not format markdown slidev
(setq-hook! 'markdown-mode-hook +format-with :none)

;; where smartparens lives, summon some cleverness
;; Ma, I can now slurp and barf as i pleased T_T
(add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
(add-hook 'latex-mode-hook #'evil-cleverparens-mode)
(add-hook 'elixir-mode-hook #'evil-cleverparens-mode)
(add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode)
(add-hook 'sql-mode-hook 'sqlformat-on-save-mode)
