;;; $DOOMDIR/+hydra.el -*- lexical-binding: t; -*-

;; Folding
(map! :leader
      "z" #'hydra-folding/body)

(defhydra hydra-folding (:color red)
  "
  fold mode (_z_)
  _o_pen node    _n_ext fold       toggle _f_orward  _s_how current only
  _c_lose node   _p_revious fold   toggle _a_ll      _t_oggle fold
  "
  ("z" origami-mode)
  ("o" origami-open-node)
  ("c" origami-close-node)
  ("n" origami-next-fold)
  ("p" origami-previous-fold)
  ("f" origami-forward-toggle-node)
  ("t" origami-toggle-node)
  ("a" origami-toggle-all-nodes)
  ("s" origami-show-only-node))
