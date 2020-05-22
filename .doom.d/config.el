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
(display-time-mode 1)
(setq display-time-day-and-date t)
(setq doom-theme 'doom-rouge)
(setq doom-themes-enable-bold nil)
(setq doom-font (font-spec :family "OperatorMono Nerd Font" :size 17 :weight 'light))
(setq doom-variable-pitch-font (font-spec :family "OperatorMono Nerd Font" :size 15 :weight 'light))
(setq all-the-icons-scale-factor 0.7)
(setq org-directory "~/org/")
(setq display-line-numbers-type nil)

;; Switch to the new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;; Silence all that useless output
(setq direnv-always-show-summary nil)



;; =============================================================================================
;; Editor Enhancements
;; =============================================================================================

;; History & backup settings (save nothing, that's what git is for)
(setq auto-save-default nil
      create-lockfiles nil
      history-length 500
      make-backup-files nil)

;; clever cursor
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
(load! "+org")
(load! "+keybindings")
