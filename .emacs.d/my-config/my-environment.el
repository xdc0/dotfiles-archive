;;; my-environment.el -- Various environment-wide settings
;;; Commentary:
;;; Code:

(setq inhibit-startup-message t)
(blink-cursor-mode -1)

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   mode-require-final-newline nil
   version-control t)       ; use versioned backups

(when (equal system-type 'darwin)
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (setq exec-path (append exec-path '("/usr/local/bin"))))

(provide 'my-environment)
;;; my-environment.el ends here
