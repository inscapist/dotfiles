;;; $DOOMDIR/+bindings.el -*- lexical-binding: t; -*-

;; Unbind prefixes
(map! :n "r" nil)

;; Simple sugar
(map! :nv "S" #'save-buffer
      :nv "F" #'avy-goto-char-timer
      :nv "J" #'evil-scroll-down
      :nv "K" #'evil-scroll-up
      :nv "gx" #'browse-url
      :nv "rr" #'evil-ex-nohighlight
      :nv "rb" #'revert-bufferm
      :nv "rc" #'lsp-workspace-restart)

 ;; Easier navigation
(map! :ne "C-h"   #'evil-window-left
      :ne "C-l"   #'evil-window-right
      :ne "C-j"   #'evil-window-down
      :ne "C-k"   #'evil-window-up
      :ne "s-h"   #'+workspace/switch-left
      :ne "s-l"   #'+workspace/switch-right
      :ne "s-n"   #'+workspace/new
      :ne "s-w"   #'+workspace/close-window-or-workspace
      :ne "s-r"   #'+workspace/rename)

;; Add/override treemacs keybindings
(map! :map treemacs-mode-map
      "p"     #'treemacs-peek
      "x"     #'treemacs-collapse-parent-node
      "X"     #'treemacs-collapse-all-projects
      "C-h"   #'evil-window-left
      "C-l"   #'evil-window-right
      "s-h"   #'+workspace/switch-left
      "s-l"   #'+workspace/switch-right
      "s-n"   #'+workspace/new
      "s-w"   #'+workspace/close-window-or-workspace
      "s-r"   #'+workspace/rename)

;; Add org-agenda keybindings
(map! :after evil-org-agenda
      (:map evil-org-agenda-mode-map :m "S" nil)
      (:map org-agenda-mode-map
        "S"     #'org-save-all-org-buffers
        "r"     #'org-agenda-filter-remove-all
        "C-h"   #'evil-window-left
        "C-l"   #'evil-window-right
        "s-h"   #'+workspace/switch-left
        "s-l"   #'+workspace/switch-right
        "s-n"   #'+workspace/new
        "s-w"   #'+workspace/close-window-or-workspace
        "s-r"   #'+workspace/rename))

;; Folding
(map! :leader
      "tt" #'origami-mode)
(map! :after origami
      (:map origami-mode-map
            [tab] #'origami-toggle-node))

;; Easier window split
(map! :leader
      "\\" #'evil-window-vsplit
      "-" #'evil-window-split)

;; Ace window
(map! :leader "w w" #'ace-window)

;; Elfeed;
(map! :leader "o o" #'elfeed)

;; Open terminal in vertical window
;; (map! :leader
;;       "\\"
;;       (lambda () (interactive)
;;         (progn
;;           (call-interactively #'evil-window-vsplit)
;;           (call-interactively #'+vterm/here))))
