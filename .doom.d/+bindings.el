;;; $DOOMDIR/+bindings.el -*- lexical-binding: t; -*-

(map! :n "q" nil
      :n "s" nil)

;; additive sugar
(map! :n "S" #'save-buffer
      :n "vv" #'evil-window-vsplit
      :n "ss" #'evil-window-split
      :n "qq" #'evil-quit
      :n "J" #'evil-scroll-down
      :n "K" #'evil-scroll-up)

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
 :ne "s-r"   #'+workspace/rename
 (:map evil-treemacs-state-map
  "C-h" #'evil-window-left
  "C-l" #'evil-window-right
  "s-h"   #'+workspace/switch-left
  "s-l"   #'+workspace/switch-right
  "s-n"   #'+workspace/new
  "s-w"   #'+workspace/close-window-or-workspace
  "s-r"   #'+workspace/rename))

;; open terminal in vertical window
(map! :leader
      "\\"
      (lambda () (interactive)
        (progn
          (call-interactively #'evil-window-vsplit)
          (call-interactively #'+vterm/here))))
