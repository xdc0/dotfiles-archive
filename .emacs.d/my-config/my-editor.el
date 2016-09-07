;;; my-editor.el -- Settings for the text editor
;;; Commentary:
;;; Code:

;; font
(defvar my-font "Liberation Mono:weight=normal:slant=normal:width=normal:spacing=100:scalable=true:pixelsize=")
(defvar my-font-size (if (equal system-type 'darwin) "12" "14"))

(set-face-attribute 'default t :font (concat my-font my-font-size))
(set-frame-font (concat my-font my-font-size))

;; Indentation configuration and behavior
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(define-key global-map (kbd "RET") 'newline-and-indent)
(setq ring-bell-function #'ignore)
(setq require-final-newline t)

;; preferred theme
(load-theme 'mustard t)

;; Show cursor position at the bottom and line numbers.
(column-number-mode t)
(global-linum-mode 1)

;; Remove menus
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Initialize evil
(require 'evil)
(evil-mode 1)

(evil-set-initial-state 'git-commit-mode 'insert)
(evil-set-initial-state 'magit-popup-mode 'insert)

;; Powerline
(require 'powerline-evil)
(powerline-evil-center-color-theme)

(provide 'my-editor)
;;; my-editor.el ends here
