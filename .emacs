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
   mode-require-final-newline nil
   version-control t)       ; use versioned backups

(if (display-graphic-p)
  (load-theme 'material t)
  (load-theme 'manoj-dark))

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
(yas-global-mode 1)

;; autocomplete
;;; should be loaded after yasnippet so that they can work together
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

;; Key bindings

(global-set-key  (kbd "<f1>") 'shell)
(global-set-key  (kbd "<f5>") 'magit-status)
(global-set-key  (kbd "C-c a") 'org-agenda)

;; Evil mode stuff

(require 'evil)
(evil-mode 1)

(define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)
(evil-set-initial-state 'git-commit-mode 'insert)
(evil-set-initial-state 'magit-popup-mode 'insert)

; Modes hooks

(add-hook 'js-mode
          '(lambda()
             (js2-minor-mode)
             (tern-mode t)))

(add-hook 'go-mode-hook
          '(lambda()
             (setq tab-width 4)
             (setq indent-tabs-mode t)))

(add-hook 'js2-mode-hook
          '(lambda()
             (setq tab-width 2)
             (setq indent-tabs-mode nil)
             (tern-mode t)
             (ac-js2-mode t)))

(add-hook 'ruby-mode
          '(lambda()
             (setq tab-width 2)
             (setq indent-tabs-mode nil)))


;; Tern
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

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

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

(setq js2-skip-preprocessor-directives t)
(setq js2-highlight-level 3)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#212121" "#B71C1C" "#558b2f" "#FFA000" "#2196f3" "#4527A0" "#00796b" "#FAFAFA"))
 '(custom-safe-themes
   (quote
    ("0aa12caf6127772c1a38f7966de8258e7a0651fb6f7220d0bbb3a0232fba967f" "870a63a25a2756074e53e5ee28f3f890332ddc21f9e87d583c5387285e882099" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "8fed5e4b89cf69107d524c4b91b4a4c35bcf1b3563d5f306608f0c48f580fdf8" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "726dd9a188747664fbbff1cd9ab3c29a3f690a7b861f6e6a1c64462b64b306de" "83e584d74b0faea99a414a06dae12f11cd3176fdd4eba6674422539951bcfaa8" "28be714e94b2ddbfd1addf8afba2d083c49748a6afbdc11d918893859f9d69c6" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "77bd459212c0176bdf63c1904c4ba20fce015f730f0343776a1a14432de80990" "c1fb68aa00235766461c7e31ecfc759aa2dd905899ae6d95097061faeb72f9ee" "75c9f0b0499ecdd0c856939a5de052742d85af81814e84faa666522c2bba7e85" default)))
 '(fci-rule-color "#ECEFF1")
 '(hl-sexp-background-color "#efebe9")
 '(js2-basic-offset 4)
 '(magit-commit-arguments nil)
 '(magit-diff-arguments (quote ("--no-ext-diff")))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#B71C1C")
     (40 . "#FF5722")
     (60 . "#FFA000")
     (80 . "#558b2f")
     (100 . "#00796b")
     (120 . "#2196f3")
     (140 . "#4527A0")
     (160 . "#B71C1C")
     (180 . "#FF5722")
     (200 . "#FFA000")
     (220 . "#558b2f")
     (240 . "#00796b")
     (260 . "#2196f3")
     (280 . "#4527A0")
     (300 . "#B71C1C")
     (320 . "#FF5722")
     (340 . "#FFA000")
     (360 . "#558b2f"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
