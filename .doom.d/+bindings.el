;;; $DOOMDIR/+bindings.el -*- lexical-binding: t; -*-

;; Unbind prefixes
(map! :n "r" nil)
(map! :map evil-snipe-mode-map :nmo "S" nil)
(map! :map evil-cleverparens-mode-map
      :nmo "s" nil
      :nmo "S" nil
      :nmo "C-\\" nil)
(map! :nmo "\\" nil)

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
 "s-w"   #'+workspace/close-window-or-workspace
 "s-r"   #'+workspace/rename)

;; Add some sugar in smartparens mode
(map!
 :map evil-cleverparens-mode-map
 :nmo "C-\\"   #'evil-jump-item
 :nmo "\\"     #'evil-cp-next-closing
 :nmo "o"      #'evil-cp-open-below-form)

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

;; where smartparens lives, summon some cleverness
;; Ma, I can now slurp and barf as i pleased T_T
(add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
(add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode)

;; force ALT key to be used as meta
(cond (IS-MAC
       (setq mac-option-modifier       'meta
             mac-right-option-modifier 'meta)))
