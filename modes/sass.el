(ensure-module-deps '(sass-mode scss-mode flymake-sass))

(require 'sass-mode)
(require 'scss-mode)
(require 'flymake-sass)

;;(setq sass-indent-offset 4)

(add-hook 'sass-mode-hook 'flymake-sass-load)
(add-hook 'scss-mode-hook 'flymake-sass-load)

(setq scss-compile-at-save nil)
