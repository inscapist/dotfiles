(map! :n "q" nil)

(map! :n "S" #'save-buffer
      :n "vv" #'evil-window-vsplit
      :n "qq" #'evil-quit
      :n "J" #'evil-scroll-down
      :n "K" #'evil-scroll-up)
