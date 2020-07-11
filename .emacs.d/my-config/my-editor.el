;;; my-editor.el -- Settings for the text editor
;;; Commentary:
;;; Code:

;; font
(defvar my-font "JetBrains Mono:weight=normal:slant=normal:weight=normal:height=128:width=normal:scalable=true")

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

(set-face-attribute 'default t :font my-font)
(set-frame-font my-font)

;; Indentation configuration and behavior
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(define-key global-map (kbd "RET") 'newline-and-indent)
(setq ring-bell-function #'ignore)
(setq require-final-newline t)

;; Scrolling
(setq scroll-step 1)

;; preferred theme
(load-theme 'sanityinc-tomorrow-eighties t)

;; Show cursor position at the bottom and line numbers.
(column-number-mode t)

;; Editor line number configuration and initialization
(global-display-line-numbers-mode)

;; Remove menus
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Initialize evil and for magit too
(require 'evil)
(evil-mode 1)

;; magit stuff
(require 'evil-magit)

(evil-matchit-mode)

;; Powerline
;; (require 'powerline-evil)
;; (powerline-evil-center-color-theme)

(provide 'my-editor)
;;; my-editor.el ends here
