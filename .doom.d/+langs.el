;;; $DOOMDIR/+langs.el -*- lexical-binding: t; -*-

;; (after! lsp-python-ms
;;   (set-lsp-priority! 'mspyls 1))

(after! lsp-mode
  (setq lsp-pylance-ms-executable "~/dotfiles/bin/pylance")

  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection (lambda () lsp-pylance-ms-executable)
                                          (lambda () (f-exists? lsp-pylance-ms-executable)))
    :major-modes '(python-mode)
    :server-id 'mspylance
    :priority 3
    :initialized-fn (lambda (workspace)
                      (with-lsp-workspace workspace
                        (lsp--set-configuration (lsp-configuration-section "python")))))))

(setq web-mode-code-indent-offset 2)
