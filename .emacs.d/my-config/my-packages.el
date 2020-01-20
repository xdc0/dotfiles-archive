;;; my-packages.el --- Package installation and repository setup
;;; Commentary:
;;; Code:

(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(defvar my-packages '(ac-js2
                      afternoon-theme
                      alchemist
                      auto-complete
                      color-theme-sanityinc-tomorrow
                      company
                      company-tern
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
                      magit
                      magithub
                      mustard-theme
                      org-jira
                      powerline
                      powerline-evil
                      projectile
                      rjsx-mode
                      tide
                      use-package
                      web-mode
                      yaml-mode
                      yasnippet)
  "Packages I use.")

(defun install-my-packages ()
  "Install packages defined in my-packages."
  (unless package-archive-contents
    (package-refresh-contents))

  (dolist (package my-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-my-packages)

(provide 'my-packages)
;;; my-packages.el ends here
