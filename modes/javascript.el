;;; js.el --- configs for js-mode/js2-mode

;;; Commentary:

;;; Code:

(message "JAVASCRIPT")

;; Also requires gjshint which is installed via pip.
(ensure-module-deps '(js2-mode flymake-gjshint ac-js2))

(add-hook 'js2-mode-hook 'flymake-gjshint:load)
(add-hook 'js2-mode-hook 'ac-js2-mode)

;; Scan the file for nested code blocks
(imenu-add-menubar-index)
;; Activate the folding mode
(hs-minor-mode t)

;;(smart-tabs-advice js2-indent-line js2-basic-offset)

(provide 'javascript)
;;; javascript.el ends here
