;;; $DOOMDIR/+bindings.el -*- lexical-binding: t; -*-

;; Unbind prefixes
(map! :nmo "r" nil
      :nmo "\\" nil
      :nmo "," nil)
(map! :map evil-snipe-mode-map
      :nmo "S" nil
      :nmo "," nil)
(map! :map evil-snipe-override-mode-map
      :nmo "S" nil
      :nmo "," nil)
(map! :map evil-cleverparens-mode-map
      :nmo "s" nil
      :nmo "S" nil
      :nmo "C-\\" nil)

;; Simple sugar
(map!
 :nv "S" #'save-buffer
 :nv "F" #'avy-goto-char-timer
 :nv "J" #'evil-scroll-down
 :nv "K" #'evil-scroll-up
 :nv "gx" #'browse-url
 :nv "rr" #'evil-ex-nohighlight
 :nv "rb" #'revert-bufferm
 :nv "rc" #'lsp-workspace-restart)

;; Easier navigation
(map!
 :ne "C-h"   #'evil-window-left
 :ne "C-l"   #'evil-window-right
 :ne "C-j"   #'evil-window-down
 :ne "C-k"   #'evil-window-up
 :ne "s-h"   #'+workspace/switch-left
 :ne "s-l"   #'+workspace/switch-right
 :ne "s-n"   #'+workspace/new
 :ne "s-w"   #'+workspace/close-window-or-workspace
 :ne "s-r"   #'+workspace/rename)
(map! :leader
      "o o" #'dired-jump
      "o O" #'projectile-dired)

;; Add/override treemacs keybindings
(map!
 :map treemacs-mode-map
 "p"     #'treemacs-peek
 "x"     #'treemacs-collapse-parent-node
 "X"     #'treemacs-collapse-all-projects
 "C-h"   #'evil-window-left
 "C-l"   #'evil-window-right
 "s-h"   #'+workspace/switch-left
 "s-l"   #'+workspace/switch-right
 "s-n"   #'+workspace/new
 "s-w"   #'+workspace/close-window-or-workspace)

;; Add some sugar in smartparens mode
(map!
 :map evil-cleverparens-mode-map
 :nmo "s-y"    #'evil-cp-yank-sexp
 :nmo "s-r"    #'sp-raise-sexp
 :nmo "s-k"    #'delete-indentation
 :nmo "s-\\"   #'evil-cp-copy-paste-form
 :nmo "s-9"    #'evil-cp-wrap-next-round
 :nmo "s-["    #'evil-cp-wrap-next-square
 :nmo "s-{"    #'evil-cp-wrap-next-curly
 :nmo "C-\\"   #'evil-cp-previous-opening
 :nmo "\\"     #'evil-cp-next-closing)

(map! :after ranger
      (:map ranger-mode-map
       [escape] #'ranger-close ))

;; Add org-agenda keybindings
(map! :after evil-org-agenda
      (:map evil-org-agenda-mode-map :m "S" nil)
      (:map org-agenda-mode-map
       "S"     #'org-save-all-org-buffers
       "C-h"   #'evil-window-left
       "C-l"   #'evil-window-right
       "s-h"   #'+workspace/switch-left
       "s-l"   #'+workspace/switch-right
       "s-n"   #'+workspace/new
       "s-w"   #'+workspace/close-window-or-workspace
       "s-r"   #'+workspace/rename))

;; Easier window split
(map! :leader
      "\\" #'evil-window-vsplit
      "-" #'evil-window-split)

;; Ace window
(map! :leader "w w" #'ace-window)

;; Elfeed;
(map! :leader "e l" #'elfeed)

;; toggle LSP Doc
(map! :leader "h h" #'lsp-describe-thing-at-point)

(map! :map clojure-mode-map
      :nmo "C-c C-n" #'cider-ns-refresh)

;; force ALT key to be used as meta
(cond (IS-MAC
       (setq mac-option-modifier       'meta
             mac-right-option-modifier 'meta)))
