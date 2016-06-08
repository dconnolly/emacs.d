;;; sass.el --- configs for sass-mode/scss-mode

;;; Commentary:

;;; Code:
(message "SASS")
(ensure-module-deps '(sass-mode flycheck))

(require 'sass-mode)

;;(setq sass-indent-offset 4)

;;(setq scss-compile-at-save nil)

(provide 'sass)

;;; sass.el ends here
