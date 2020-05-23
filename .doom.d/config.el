;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys


;; =============================================================================================
;; Basic global configuration
;; =============================================================================================
(setq user-full-name "Felix"
      user-mail-address "zen9.felix@gmail.com")
(setq doom-theme 'doom-rouge)
(setq doom-themes-enable-bold t)
(setq doom-font (font-spec :family "OperatorMono Nerd Font" :size 16 :weight 'light))
(setq doom-variable-pitch-font (font-spec :family "Overpass" :size 13 :weight 'Thin))
(setq all-the-icons-scale-factor 0.7)
(setq org-directory "~/org/")
(setq display-line-numbers-type nil)

;; treemacs customization
(setq treemacs--width-is-locked nil)
(setq treemacs-width 25)

;; Switch to the new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;; Silence all that useless output
(setq direnv-always-show-summary nil)

;; Make doom-modeline slightly smaller than editor font
(custom-set-faces
  '(mode-line ((t (:family "OperatorMono Nerd Font" :height 0.98))))
  '(mode-line-inactive ((t (:family "OperatorMono Nerd Font" :height 0.98)))))

;; =============================================================================================
;; Editor Enhancements
;; =============================================================================================

;; History & backup settings (save nothing, that's what git is for)
(setq auto-save-default nil
      create-lockfiles nil
      history-length 500
      make-backup-files nil)

;; make evil usable in terminal
(when (not (display-graphic-p))
  (add-hook 'evil-insert-state-entry-hook (lambda () (send-string-to-terminal "\033[5 q")))
  (add-hook 'evil-normal-state-entry-hook (lambda () (send-string-to-terminal "\033[0 q"))))

;; persist frame dimension
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


;; =============================================================================================
;; Editor Enhancements
;; =============================================================================================
(load! "orgmode")
(load! "bindings")
