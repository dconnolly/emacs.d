;;; js.el --- configs for js-mode/js2-mode

;;; Commentary:

;;; Code:

(message "JAVASCRIPT")

;; Also requires gjshint which is installed via pip.
(ensure-module-deps '(js2-mode flymake-gjshint))

(add-hook 'js2-mode-hook 'flymake-gjshint:load)

;;(smart-tabs-advice js2-indent-line js2-basic-offset)

(provide 'javascript)
;;; javascript.el ends here
