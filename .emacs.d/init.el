;;; init.el -- Emacs configuration
;;; Commentary:
;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq load-prefer-newer t)

(add-to-list 'load-path (concat user-emacs-directory "my-config"))

(setq frame-background-mode 'dark)

(require 'my-packages)
(require 'my-environment)
(require 'my-editor)
(require 'my-keybindings)
(require 'my-org)
(require 'my-programming)
(require 'my-aspell)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;;; init.el ends here
