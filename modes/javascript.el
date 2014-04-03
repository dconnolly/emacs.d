;;; js.el --- configs for js-mode/js2-mode

;;; Commentary:

;;; Code:

(message "JAVASCRIPT")

(ensure-module-deps '(js2-mode flycheck ac-js2))

(setq flycheck-jshintrc '.jshintrc')
(add-hook 'js2-mode-hook 'ac-js2-mode)

;; Scan the file for nested code blocks
(imenu-add-menubar-index)

(provide 'javascript)
;;; javascript.el ends here
