;;; my-org.el -- Org mode settings
;;; Commentary:
;;; Code:

(require 'org)

(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("INPROGRESS" . "yellow")
        ("PR" . "yellow") ("QA" . "orange") ("DONE" . org-done)
        ("DROPPED" . "blue")))

(setq org-agenda-files (list (concat org-directory "/work.org")))
(setq org-capture-use-agenda-date t)

(setq org-capture-templates
      '(("t" "Todo" entry (file+datetree (concat org-directory "/work.org") "Tasks")
         "* TODO %?\n  %i\n  %a")))

(provide 'my-org)
;;; my-org.el ends here