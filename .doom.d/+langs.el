;;; $DOOMDIR/+langs.el -*- lexical-binding: t; -*-


;; ------------------------
;; if pylance is preferred
;; ------------------------
;;
;; (after! lsp-mode
;;   (setq lsp-pylance-ms-executable "~/dotfiles/bin/pylance")

;;   (lsp-register-client
;;    (make-lsp-client
;;     :new-connection (lsp-stdio-connection (lambda () lsp-pylance-ms-executable)
;;                                           (lambda () (f-exists? lsp-pylance-ms-executable)))
;;     :major-modes '(python-mode)
;;     :server-id 'mspylance
;;     :priority 3
;;     :initialized-fn (lambda (workspace)
;;                       (with-lsp-workspace workspace
;;                         (lsp--set-configuration (lsp-configuration-section "python")))))))

(setq web-mode-code-indent-offset 2)

;; typescript lsp has no corresponding formatter, fallback to prettier
(setq-hook! 'typescript-mode-hook +format-with-lsp nil)
(setq-hook! 'typescript-tsx-mode-hook +format-with-lsp nil)
