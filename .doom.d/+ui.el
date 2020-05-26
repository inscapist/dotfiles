;;; $DOOMDIR/+ui.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-rouge)
(setq doom-themes-enable-bold t)
(setq doom-font (font-spec :family "OperatorMono Nerd Font" :size 17 :weight 'light))
(setq doom-variable-pitch-font (font-spec :family "Overpass" :size 15 :weight 'Thin))
(setq all-the-icons-scale-factor 0.8)

(after! treemacs
  (setq treemacs--width-is-locked nil)
  (setq treemacs-width 28))


;; Make doom-modeline slightly smaller than editor font
(custom-set-faces
  '(mode-line ((t (:family "Overpass" :height 0.95))))
  '(mode-line-inactive ((t (:family "Overpass" :height 0.95)))))


;; Make evil usable in terminal
(when (not (display-graphic-p))
  (add-hook 'evil-insert-state-entry-hook (lambda () (send-string-to-terminal "\033[5 q")))
  (add-hook 'evil-normal-state-entry-hook (lambda () (send-string-to-terminal "\033[0 q"))))


;; Persist frame dimension
(when-let (dims (doom-store-get 'last-frame-size))
  (cl-destructuring-bind ((left . top) width height fullscreen) dims
    (setq initial-frame-alist
          (append initial-frame-alist
                  `((left . ,left)
                    (top . ,top)
                    (width . ,width)
                    (height . ,height)
                    (fullscreen . ,fullscreen))))))
(defun save-frame-dimensions ()
  (doom-store-put 'last-frame-size
                  (list (frame-position)
                        (frame-width)
                        (frame-height)
                        (frame-parameter nil 'fullscreen))))
(add-hook 'kill-emacs-hook #'save-frame-dimensions)

