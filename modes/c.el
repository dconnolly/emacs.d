;;; c.el --- configs for c-mode

;;; Commentary:

;;; Code:
(message "C")

(ensure-module-deps '(c-mode google-c-style))

(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(provide 'c)
;;; c.el ends here
