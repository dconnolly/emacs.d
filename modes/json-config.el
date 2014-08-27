;;; json-config.el --- configs for json-mode

;;; Commentary:

;;; Code:

(message "JSON")

;; Requires:
;; npm install -g jsonlint js-beautify
(ensure-module-deps '(json-mode flycheck web-beautify))

(add-hook 'before-save-hook 'web-beautify-js-buffer t t)

(provide 'json-config)
;;; json-config.el ends here
