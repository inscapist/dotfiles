(setq user-full-name "Felix"
      user-mail-address "zen9.felix@gmail.com")
(setq doom-theme 'doom-one)
(setq doom-font (font-spec :family "Victor Mono" :size 17))
(setq display-line-numbers-type t)
(setq org-directory "~/org"
      org-archive-location (concat org-directory "archive/%s::"))

(when (not (display-graphic-p))
  (add-hook 'evil-insert-state-entry-hook (lambda () (send-string-to-terminal "\033[5 q")))
  (add-hook 'evil-normal-state-entry-hook (lambda () (send-string-to-terminal "\033[0 q"))))

(when-let (dims (doom-cache-get 'last-frame-size))
  (cl-destructuring-bind ((left . top) width height fullscreen) dims
    (setq initial-frame-alist
          (append initial-frame-alist
                  `((left . ,left)
                    (top . ,top)
                    (width . ,width)
                    (height . ,height)
                    (fullscreen . ,fullscreen))))))

(defun save-frame-dimensions ()
  (doom-cache-set 'last-frame-size
                  (list (frame-position)
                        (frame-width)
                        (frame-height)
                        (frame-parameter nil 'fullscreen))))

(add-hook 'kill-emacs-hook #'save-frame-dimensions)

(map! :n "S" #'save-buffer
      :n "q" nil
      :n "qq" #'evil-quit)


(def-package! graphviz-dot-mode
  :config
  (setq graphviz-dot-indent-width 4
        graphviz-dot-preview-extension "png"))
