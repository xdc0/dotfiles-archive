;;; my-aspell -- ispell setup with aspell.
;;; Commentary:
;;; Code:

(require 'ispell)

(setq ispell-program-name "aspell")
(setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))

(provide 'my-aspell)
;;; my-aspell ends here