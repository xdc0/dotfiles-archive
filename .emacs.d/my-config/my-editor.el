;;; my-editor.el -- Settings for the text editor
;;; Commentary:
;;; Code:

;; font
(custom-set-faces
 '(default ((t (:family "JetBrains Mono" :foundry "JB" :slant normal :weight semi-bold :height 143 :width normal)))))

;; Powerline
(require 'powerline)
(powerline-default-theme)
;; (setq sml/theme 'dark)
;; (sml/setup t)

;; Compatibility when launching from terminal
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Indentation configuration and behavior
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(define-key global-map (kbd "RET") 'newline-and-indent)
(setq ring-bell-function #'ignore)
(setq require-final-newline t)

;; Scrolling
(setq scroll-step 1)

;; preferred theme
(load-theme 'sanityinc-tomorrow-day t)

;; Show cursor position at the bottom and line numbers.
(column-number-mode t)

;; Editor line number configuration and initialization
(global-display-line-numbers-mode)

;; Remove menus
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Initialize evil and for magit too
(setq evil-want-keybinding nil)
(require 'evil)
(evil-mode 1)

;; magit stuff
(require 'evil-collection)
(evil-collection-init)

(evil-matchit-mode)

;; python
(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :config (setq lsp-python-ms-extra-paths ["$HOME/.local/lib/python3.8/site-packages"])
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))  ; or lsp-deferred

;; Powerline
;; (require 'powerline-evil)
;; (powerline-evil-center-color-theme)

(provide 'my-editor)
;;; my-editor.el ends here
