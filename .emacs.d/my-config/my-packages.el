;;; my-packages.el --- Package installation and repository setup
;;; Commentary:
;;; Code:

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(defvar my-packages '(ac-js2
                      alchemist
                      auto-complete
                      company
                      company-tern
                      clojure-mode
                      evil
                      flycheck
                      haskell-mode
                      helm
                      helm-projectile
                      js2-mode
                      magit
                      mustard-theme
                      powerline
                      powerline-evil
                      projectile
                      tern
                      web-mode
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
