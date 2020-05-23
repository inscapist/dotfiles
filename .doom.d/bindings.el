(map! :n "q" nil
      :n "s" nil)

(map! :n "S" #'save-buffer
      :n "vv" #'evil-window-vsplit
      :n "ss" #'evil-window-split
      :n "qq" #'evil-quit
      :n "J" #'evil-scroll-down
      :n "K" #'evil-scroll-up)

(map!
 ;; Easier navigation
 :ne "C-h"   #'evil-window-left
 :ne "C-j"   #'evil-window-down
 :ne "C-k"   #'evil-window-up
 :ne "C-l"   #'evil-window-right
 :ne "gh" #'+workspace/switch-left
 :ne "gj" #'+workspace/new
 :ne "gk" #'+workspace/delete
 :ne "gl" #'+workspace/switch-right
 (:map evil-treemacs-state-map
  "C-h" #'evil-window-left
  "C-l" #'evil-window-right
  "gh" #'+workspace/switch-left
  "gl" #'+workspace/switch-right))

(map! :leader
      "\\" #'vterm)
