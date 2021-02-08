;;; $DOOMDIR/+hydra.el -*- lexical-binding: t; -*-

;; Folding
(map! :leader
      "z" #'hydra-folding/body)

;; https://github.com/gregsexton/origami.el
(defhydra hydra-folding (:color red)
  ("Z" origami-mode "Toggle origami mode" :column "Main")
  ("S" origami-show-only-node "Close everything except folds")
  ("u" origami-undo "Undo folds")
  ("r" origami-redo "Redo folds")
  ("R" origami-reset "Reset folds")

  ("C" origami-close-all-nodes "Close all folds" :column "Fold/Unfold")
  ("O" origami-open-all-nodes "Open all folds")
  ("c" origami-close-node "Close a fold node")
  ("o" origami-open-node "Open a fold node")
  ("t" origami-toggle-node "Toggle a fold")
  ("T" origami-toggle-all-nodes "Toggle every folds")

  ("j" origami-next-fold "Next fold" :column "Movement")
  ("k" origami-previous-fold "Prev fold")

  ("q" nil "quit menu" :color blue :column nil))