;;; $DOOMDIR/+gtd.el -*- lexical-binding: t; -*-

;; Sets up a Getting-Things-Done (GTD) workflow using Org-mode
;; For doom defaults, refer https://github.com/hlissner/doom-emacs/blob/master/modules/lang/org/config.el
;; Some configs can be set in the header of org files.
;; For example
;;   #+STARTUP: http://doc.endlessparentheses.com/Var/org-startup-options.html
;;   #+TAGS: https://orgmode.org/manual/Setting-Tags.html#Setting-Tags
;;   #+FILETAGS: http://doc.norang.ca/org-mode.html


(after! org
  (setq felix/org-agenda-directory (concat org-directory "/gtd/")
        org-archive-location (expand-file-name ".archive/%s::" org-directory)
        ;; state transition behaviors
        org-enforce-todo-dependencies t
        org-log-done 'time
        org-log-redeadline 'note
        org-log-reschedule 'time
        org-log-into-drawer t
        ;; customize tags
        org-tags-column 0
        org-tag-alist '((:startgroup . nil)
                        ;; contexts
                        ("@thinking" . ?t)
                        ("@researching" . ?r)
                        ("@coding" . ?c)
                        ("@fun" . ?f)
                        ("@learning" . ?l)
                        (:endgroup . nil)
                        ;; projects
                        ("clarific" . nil)
                        ("ubermensch" . nil)
                        ("freelance" . nil))))


;; Refer https://www.gnu.org/software/emacs/manual/html_node/org/Template-elements.html#Template-elements
(after! org-capture
  (setq org-capture-templates
        `(("i" "inbox" entry
           (file ,(expand-file-name "inbox.org" felix/org-agenda-directory))
           "* TODO %?")
          ("r" "readings" entry
           (file+headline ,(expand-file-name "readings.org" felix/org-agenda-directory) "Uncategorized")
           "* TODO %?"))))


(after! org-refile
  (setq org-refile-allow-creating-parent-nodes 'confirm
        org-refile-use-outline-path 'file
        org-outline-path-complete-in-steps nil)
  (setq org-refile-targets `((,(concat felix/org-agenda-directory "next.org") :level . 0)
                             (,(concat felix/org-agenda-directory "backlog.org") :maxlevel . 1)
                             (,(concat felix/org-agenda-directory "maybe.org") :maxlevel . 1)
                             (,(concat felix/org-agenda-directory "mylife.org") :maxlevel . 1)
                             (,(concat felix/org-agenda-directory "readings.org") :maxlevel . 1))))


;; Customize agenda
;; Refer https://orgmode.org/worg/org-tutorials/org-custom-agenda-commands.html
(defun felix/switch-to-agenda ()
    (interactive)
    (org-agenda nil " "))

(map! (:leader
       (:prefix-map ("n" . "notes")
        :desc "Org agenda" "a" #'felix/switch-to-agenda)))

(after! org-agenda
  (setq org-agenda-block-separator ?_
        org-agenda-files (list felix/org-agenda-directory)
        org-agenda-start-with-log-mode t
        ;; trigger column mode with C-c C-x C-c
        org-columns-default-format "%40ITEM(Task) %Effort(EE){:} %CLOCKSUM(Time Spent) %SCHEDULED(Scheduled) %DEADLINE(Deadline)"
        org-agenda-custom-commands `((" " "Agenda"
                                      ((agenda ""
                                               ((org-agenda-span 'week)
                                                (org-deadline-warning-days 365)))
                                       (todo "STRT"
                                             ((org-agenda-overriding-header "In Progress")
                                              (org-agenda-files '(,(concat felix/org-agenda-directory "next.org")
                                                                  ,(concat felix/org-agenda-directory "backlog.org")
                                                                  ,(concat felix/org-agenda-directory "maybe.org")
                                                                  ,(concat felix/org-agenda-directory "mylife.org")
                                                                  ,(concat felix/org-agenda-directory "readings.org")))))
                                       (todo "TODO|PROJ"
                                             ;; what I should absolutely focus on right now
                                             ((org-agenda-overriding-header "NEXT")
                                              (org-agenda-max-entries 3)
                                              (org-agenda-files '(,(concat felix/org-agenda-directory "next.org")))))
                                       (todo "TODO|PROJ"
                                             ;; short term tasks to think about, don't show if it is already scheduled
                                             ((org-agenda-overriding-header "Backlog")
                                              (org-agenda-max-entries 5)
                                              (org-agenda-files '(,(concat felix/org-agenda-directory "backlog.org")))
                                              (org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline 'scheduled))))
                                       (todo "TODO"
                                             ;; clear my inbox
                                             ((org-agenda-overriding-header "To Refile")
                                              (org-agenda-max-entries 5)
                                              (org-agenda-files '(,(concat felix/org-agenda-directory "inbox.org")))))
                                       (tags-todo "+clarific/TODO|PROJ"
                                             ;; My ideas, my product
                                             ((org-agenda-overriding-header "Clarific")
                                              (org-agenda-files '(,(concat felix/org-agenda-directory "next.org")
                                                                  ,(concat felix/org-agenda-directory "backlog.org")
                                                                  ,(concat felix/org-agenda-directory "maybe.org")
                                                                  ,(concat felix/org-agenda-directory "mylife.org")
                                                                  ,(concat felix/org-agenda-directory "readings.org")))))
                                       (todo "TODO|PROJ"
                                             ;; how I lead my life
                                             ((org-agenda-overriding-header "My Life")
                                              (org-agenda-files '(,(concat felix/org-agenda-directory "mylife.org")))))
                                       (todo "TODO|PROJ"
                                             ;; articles, books that I want to commit to reading
                                             ((org-agenda-overriding-header "Readings")
                                              (org-agenda-max-entries 3)
                                              (org-agenda-files '(,(concat felix/org-agenda-directory "readings.org"))))))))))
