;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el


;; Disable
(package! undo-fu-session :disable t)
(package! alchemist :disable t)
(package! alchemist-company :disable t)

;; writegood can be annoying
;; (package! writegood-mode :disable t)

;; hl-line has huge performance penalty on 4k monitor + retina mac
;; (package! hl-line :disable t)

;; Extra packages
;;(package! telephone-line)
(package! zoom)
(package! origami)
(package! lsp-origami)
;;(package! graphviz-dot-mode)

;; Themes
(package! kaolin-themes)
;; (package! darktooth-theme)
;; (package! ample-theme)
;; (package! acme-theme)
;; (package! tao-theme)

;; Use latest packages
(package! format-all :pin "eb5906c7070b667432194da3991daf21f24b516a")
(package! language-id :pin "30a5bc267af7de167d0a835ead828016e6e7e14c")
