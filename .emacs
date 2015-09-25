(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(setq inhibit-startup-message t)
(blink-cursor-mode -1)

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;; Indentation

(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(define-key global-map (kbd "RET") 'newline-and-indent)
(setq ring-bell-function #'ignore)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; General modes

(column-number-mode t)
(linum-mode)
(projectile-global-mode)

;; Key bindings

(global-set-key  (kbd "<f1>") 'shell)
(global-set-key  (kbd "<f5>") 'magit-status)
(global-set-key  (kbd "C-c a") 'org-agenda)

;; Color theme

;(color-theme-initialize)
;(color-theme-solarized-light)

(load-theme 'cyberpunk t)

;; Evil mode stuff

(require 'evil)
(evil-mode 1)

(define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)
(define-key evil-insert-state-map (kbd "<tab>") 'hippie-expand)
(evil-set-initial-state 'git-commit-mode 'insert)
(evil-set-initial-state 'magit-popup-mode 'insert)

; Modes hooks

(add-hook 'go-mode-hook
          '(lambda()
             (setq tab-width 4)
             (setq indent-tabs-mode t)))

(add-hook 'js2-mode-hook
          '(lambda()
             (setq tab-width 4)
             (setq indent-tabs-mode nil)))


;; Flycheck

(require 'flycheck)
(flycheck-mode 1)

;; ido

(require 'ido-vertical-mode)
(flx-ido-mode 1)
(ido-vertical-mode 1)

;; projectile

(projectile-global-mode)
(setq projectile-indexing-method 'find)
(setq projectile-enable-caching t)

;; javascript

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq js2-skip-preprocessor-directives t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("726dd9a188747664fbbff1cd9ab3c29a3f690a7b861f6e6a1c64462b64b306de" "83e584d74b0faea99a414a06dae12f11cd3176fdd4eba6674422539951bcfaa8" "28be714e94b2ddbfd1addf8afba2d083c49748a6afbdc11d918893859f9d69c6" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "77bd459212c0176bdf63c1904c4ba20fce015f730f0343776a1a14432de80990" "c1fb68aa00235766461c7e31ecfc759aa2dd905899ae6d95097061faeb72f9ee" "75c9f0b0499ecdd0c856939a5de052742d85af81814e84faa666522c2bba7e85" default)))
 '(js2-basic-offset 4)
 '(magit-commit-arguments nil)
 '(magit-diff-arguments (quote ("--no-ext-diff")))
 '(org-agenda-files (quote ("~/notes/gigwalk.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
