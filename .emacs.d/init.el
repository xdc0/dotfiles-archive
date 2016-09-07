;;; init.el -- Emacs configuration
;;; Commentary:
;;; Code:

(setq load-prefer-newer t)

(add-to-list 'load-path (concat user-emacs-directory "my-config"))

(require 'my-packages)
(require 'my-environment)
(require 'my-editor)
(require 'my-keybindings)
(require 'my-org)
(require 'my-programming)

;;; init.el ends here
