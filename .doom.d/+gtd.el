;;; $DOOMDIR/+gtd.el -*- lexical-binding: t; -*-

;; Sets up a Getting-Things-Done (GTD) workflow using Org-mode
;;
;; http://doc.norang.ca/org-mode.html
;; refer https://github.com/hlissner/doom-emacs/blob/master/modules/lang/org/config.el

(after! org
  (setq org-default-inbox-file (expand-file-name "inbox.org" org-directory)
        org-archive-location (expand-file-name ".archive/%s::" org-directory)))

;; Reference
;; https://www.gnu.org/software/emacs/manual/html_node/org/Template-elements.html#Template-elements
(after! org-capture
  (setq org-capture-templates
        `(("i" "inbox" entry
           (file+headline org-default-inbox-file "Tasks")
           "* TODO %?")
          ("l" "readings" entry
           (file+headline ,(expand-file-name "readings.org" org-directory) "Uncategorized")
           "* %?"))))

(after! org-refile
  (setq org-refile-allow-creating-parent-nodes 'confirm)
  (setq org-refile-targets '(("next.org" :level . 0)
                             ("someday.org" :level . 0)
                             ("readings.org" :level . 2)
                             ("projects.org" :maxlevel . 2))))

;; (setq org-capture-templates
;;       `(("i" "inbox" entry (file ,(concat jethro/org-agenda-directory "inbox.org"))
;;          "* TODO %?")
;;         ("c" "org-protocol-capture" entry (file ,(concat jethro/org-agenda-directory "inbox.org"))
;;          "* TODO [[%:link][%:description]]\n\n %i"
;;          :immediate-finish t)
;;         ("w" "Weekly Review" entry (file+olp+datetree ,(concat jethro/org-agenda-directory "reviews.org"))
;;          (file ,(concat jethro/org-agenda-directory "templates/weekly_review.org")))
;;         ("r" "Reading" todo ""
;;          ((org-agenda-files '(,(concat jethro/org-agenda-directory "reading.org")))))))
