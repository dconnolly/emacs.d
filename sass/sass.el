(ensure-module-deps '(sass-mode scss-mode flymake-sass))

(require 'sass-mode)
(require 'scss-mode)
(require 'flymake-sass)

;; (add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))
;; (add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

(setq sass-indent-offset 4)

(add-hook 'sass-mode-hook 'flymake-sass-load)
(add-hook 'scss-mode-hook 'flymake-sass-load)

(setq scss-compile-at-save nil)
