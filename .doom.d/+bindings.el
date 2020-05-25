(map! :n "q" nil
      :n "s" nil)

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
 :ne "` h"   #'+workspace/switch-left
 :ne "` l"   #'+workspace/switch-right
 :ne "` j"   #'+workspace/new
 :ne "` k"   #'+workspace/delete
 (:map evil-treemacs-state-map
  "C-h" #'evil-window-left
  "C-l" #'evil-window-right
  "` h"   #'+workspace/switch-left
  "` l"   #'+workspace/switch-right
  "` j"   #'+workspace/new
  "` k"   #'+workspace/delete))

;; open terminal in vertical window
(map! :leader
      "\\"
      (lambda () (interactive)
        (progn
          (call-interactively #'evil-window-vsplit)
          (call-interactively #'+vterm/here))))
