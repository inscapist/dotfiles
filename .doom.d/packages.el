;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; ==============================================
;; After changing this file, runs `doom sync -u'
;; ==============================================

;; Disable
(package! undo-fu-session :disable t)
(package! alchemist :disable t)
(package! alchemist-company :disable t)
(package! lsp-ui :disable t)


;; Extra packages
(package! zoom)
(package! evil-cleverparens)
(package! origami)
(package! lsp-origami)
(package! graphviz-dot-mode)


;; Themes
(package! kaolin-themes)


;; Unpin
(unpin! (:lang clojure python elixir javascript))
(unpin! (:tools lsp))
