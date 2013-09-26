;;; coffee.el --- configs for coffee-mode

;;; Commentary:

;;; Code:
(message "COFFEE")
(ensure-module-deps '(coffee-mode flycheck))

;; Flycheck is enabled, it looks for coffeelint.
;; Install with sudo npm install -g coffeelint

;; CoffeeScript uses two spaces.
;; (make-local-variable 'tab-width)
;; (set 'tab-width 2)

;; If you don't want your compiled files to be wrapped
(setq coffee-args-compile '(\"-c\" \"--bare\"))

;; Emacs key binding
(define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)

;; ;; Bleeding edge.
;; (setq coffee-command \"~/dev/coffee\")
;;
;; Compile '.coffee' files on every save
;; (and (file-exists-p (buffer-file-name))
;;      (file-exists-p (coffee-compiled-file-name))
;;      (coffee-cos-mode t)))"

(provide 'coffee)

;;; coffee.el ends here
