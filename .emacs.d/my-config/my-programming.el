;;; my-programming.el -- Misc settings related to programming
;;; Commentary:
;;; Code:

;;; projectile with helm
(projectile-mode)
(defvar projectile-completion-system)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; Enable flycheck globally
(require 'flycheck)
(global-flycheck-mode)

;; LSP
(require 'lsp-mode)
(setq lsp-enable-indentation nil)

;; Company mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 1)
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-lsp))

;; Display flycheck errors at the bottom on a small-ish window
(add-to-list 'display-buffer-alist
             `(,(rx bos "*Flycheck errors*" eos)
               (display-buffer-reuse-window
                display-buffer-in-side-window)
               (reusable-frames . visible)
               (side            . bottom)
               (window-height   . 0.12)))

;; Javascript stuff

(add-hook 'js-mode-hook #'lsp)

;; Typescript stuff

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'"    . js2-mode))
(add-to-list 'auto-mode-alist '("\\.pac\\'"   . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(require 'rjsx-mode)

(with-eval-after-load 'rjsx-mode
  (define-key rjsx-mode-map "<" nil)
  (define-key rjsx-mode-map (kbd "C-d") nil)
  (define-key rjsx-mode-map ">" nil))

(add-hook 'ruby-mode-hook #'rubocop-mode)
(add-hook 'ruby-mode-hook #'lsp)

(provide 'my-programming)

;;; my-programming.el ends here
