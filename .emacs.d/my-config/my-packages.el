;;; my-packages.el --- Package installation and repository setup
;;; Commentary:
;;; Code:

(require 'package)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(defvar my-packages '(ac-js2
		      afternoon-theme
                      alchemist
                      auto-complete
                      color-theme-sanityinc-tomorrow
                      company
                      company-lsp
                      clojure-mode
                      evil
                      evil-magit
                      exec-path-from-shell
                      flycheck
                      haskell-mode
                      helm
                      helm-ag
                      helm-projectile
                      js2-mode
                      lsp-mode
                      magit
                      magithub
                      mustard-theme
                      org-jira
                      powerline
                      powerline-evil
                      projectile
                      rubocop
                      rjsx-mode
                      tide
                      use-package
                      web-mode
                      yaml-mode
                      yasnippet)
  "Packages I use.")

(defun install-my-packages ()
 "Install packages defined in my-packages."
  (package-refresh-contents)

  (dolist (package my-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-my-packages)

(provide 'my-packages)
;;; my-packages.el ends here
