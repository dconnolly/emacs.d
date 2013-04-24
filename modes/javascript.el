;;; js.el --- configs for js-mode/js2-mode

;;; Commentary:

;;; Code:

(message "JAVASCRIPT")

(custom-set-variables '(js-indent-level 8))
     
;; Also requires gjshint which is installed via pip.
(ensure-module-deps '(js2-mode flymake-gjshint))

(setq-default indent-tabs-mode t)
(setq-default tab-width 8)
(setq-default js-indent-level 8)
(setq tab-width 8)
(setq indent-tabs-mode t)
(setq js-indent-level 8)

;;(smart-tabs-advice js2-indent-line js2-basic-offset)

(add-hook 'js-mode-hook 'flymake-gjshint:load)
(add-hook 'js2-mode-hook 'flymake-gjshint:load)

(provide 'javascript)
;;; javascript.el ends here
