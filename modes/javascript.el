;;; js.el --- configs for js-mode/js2-mode/js3-mode

;;; Commentary:

;;; Code:

(message "JAVASCRIPT")

;; Requirements:
;; npm install -g jshint eslint jscs tern
(ensure-module-deps '(js2-mode flycheck tern tern-auto-complete jsx-mode))

'(js2-auto-indent-p t)         ; it's nice for commas to right themselves.
'(js2-enter-indents-newline t) ; don't need to push tab before typing
'(js2-indent-on-enter-key t)   ; fix indenting before moving on

(when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize))

(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

(tern-mode t)
(setq tern-command (cons (executable-find "tern") '()))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))


(provide 'javascript)
;;; javascript.el ends here
