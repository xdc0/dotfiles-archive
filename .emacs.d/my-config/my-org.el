;;; my-org.el -- Org mode settings
;;; Commentary:
;;; Code:

(require 'org)
(require 'org-jira)
(setq jiralib-url "https://mixmaxhq.atlassian.net")
(setq org-jira-jira-status-to-org-keyword-alist
      '(("In Progress" . "INPROGRESS")))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("INPROGRESS" . "yellow")
        ("PR" . "yellow") ("STAGING" . "orange") ("DONE" . org-done)
        ("DROPPED" . "blue")))

(setq org-todo-keywords
      '((sequence "TODO(t)" "INPROGRESS(i)" "PR(p)" "STAGING(s)" "|" "DONE(d)")))

(setq org-agenda-files (list
                        (concat org-directory "/work.org")
                        (concat org-jira-working-dir "/MX.org")))

(setq org-capture-templates
      '(("t" "Todo" entry (file+datetree (concat org-directory "/work.org") "Tasks")
         "* TODO %?\n  %i\n  %a")))

(provide 'my-org)
;;; my-org.el ends here