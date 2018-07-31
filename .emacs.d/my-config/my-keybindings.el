;;; my-keybindings.el -- Custom keybindings
;;; Commentary:
;;; Code:

(global-set-key  (kbd "<f2>") 'helm-ag-project-root)
(global-set-key  (kbd "<f5>") 'magit-status)
(global-set-key  (kbd "C-c a") 'org-agenda)
(global-set-key  (kbd "<f7>") 'org-jira-progress-issue)

(add-to-list 'load-path "~/contrib/chuym/dotfiles/.emacs.d")
;;; evil-only keybindings
(require 'evil)

(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)
(define-key evil-normal-state-map (kbd "M-.") 'tern-find-definition)
(define-key evil-normal-state-map (kbd "M-,") 'tern-pop-find-definition)
(define-key evil-visual-state-map (kbd "TAB") 'indent-region)

(provide 'my-keybindings)

;;; my-keybindings.el ends here
