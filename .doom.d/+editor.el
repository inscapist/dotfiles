;;; $DOOMDIR/+editor.el -*- lexical-binding: t; -*-

;; Do not ask for "Confirm exit Emacs"
(setq confirm-kill-emacs nil)

;; Switch to the new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;; Silence all that useless output
(setq direnv-always-show-summary nil)

;; Display line number, use `SPC t l' to toggle
(setq display-line-numbers-type nil)

;; History & backup settings (save nothing, that's what git is for)
(setq auto-save-default nil
      create-lockfiles nil
      history-length 500
      make-backup-files nil)

;; Avy is the best
(setq avy-all-windows t)

; Lsp optimization
(setq read-process-output-max (* 1024 1024)) ;; 1mb

; disable symbol highlighting
(setq lsp-enable-symbol-highlighting nil)

;; start with lisp interaction mode in scratch buffer
(setq doom-scratch-initial-major-mode 'lisp-interaction-mode)

; ;; customize treemacs
; (after! treemacs
;   (setq treemacs--width-is-locked nil)
;   (setq treemacs-width 21)
;   (treemacs-git-mode 'extended)
;   (with-eval-after-load 'treemacs
;     (defun treemacs-ignore-python-cache-dirs (_filename absolute-path)
;       (or
;        (cl-search "__pycache__" absolute-path)
;        (cl-search ".pytest_cache" absolute-path)))
;     (add-to-list 'treemacs-ignored-file-predicates #'treemacs-ignore-python-cache-dirs)
;     (add-to-list 'treemacs-pre-file-insert-predicates #'treemacs-is-file-git-ignored?)))

; ;; ace window fix (required by treemacs)
; (require 'ace-window)

;; Make evil usable in terminal
(when (not (display-graphic-p))
  (add-hook 'evil-insert-state-entry-hook (lambda () (send-string-to-terminal "\033[5 q")))
  (add-hook 'evil-normal-state-entry-hook (lambda () (send-string-to-terminal "\033[0 q"))))


;; origami
(global-origami-mode)
(add-hook 'lsp-after-open-hook #'lsp-origami-try-enable)


