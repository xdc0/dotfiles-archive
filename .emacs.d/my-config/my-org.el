;;; my-org.el -- Org mode settings
;;; Commentary:
;;; Code:

(defvar org-todo-keyword-faces)
(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("INPROGRESS" . "yellow")
        ("PR" . "yellow") ("QA" . "orange") ("DONE" . org-done)
        ("DROPPED" . "blue")))

(provide 'my-org)
;;; my-org.el ends here