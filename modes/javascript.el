;;; js.el --- configs for js-mode/js2-mode

;;; Commentary:

;;; Code:

(message "JAVASCRIPT")

;; Requirements:
;; npm install -g jshint tern
(ensure-module-deps '(js2-mode flycheck ac-js2 tern tern-auto-complete))

(setq flycheck-jshintrc ".jshintrc")

(ac-js2-mode t)

(tern-mode t)
(eval-after-load 'tern
    '(progn
         ;;(require 'tern-auto-complete)
         (tern-ac-setup)))

(provide 'javascript)
;;; javascript.el ends here
