;; Sets up a Getting-Things-Done (GTD) workflow using Org-mode
;;
;; Mostly taken from Brent Hansen's setup
;; http://doc.norang.ca/org-mode.html

(after! org
  (setq org-files-directory "~/org/")
  (setq org-agenda-files (list org-files-directory)))
