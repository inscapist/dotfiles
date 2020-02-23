(setq user-full-name "Felix"
      user-mail-address "zen9.felix@gmail.com")
(setq doom-theme 'doom-one)
(setq doom-font (font-spec :family "Victor Mono" :size 17))
(setq display-line-numbers-type nil)

(setq org-directory "~/org"
      org-archive-location (concat org-directory "archive/%s::")
      org-ellipsis " ▼ "
      org-bullets-bullet-list '("☰ " "☱ " "☲ " "☳ " "☴ " "☵ " "☶ " "☷ " "☷ " "☷ " "☷ "))

(when (not (display-graphic-p))
  (add-hook 'evil-insert-state-entry-hook (lambda () (send-string-to-terminal "\033[5 q")))
  (add-hook 'evil-normal-state-entry-hook (lambda () (send-string-to-terminal "\033[0 q"))))

(map! :n "S" #'save-buffer
      :n "q" nil
      :n "qq" #'evil-quit)
