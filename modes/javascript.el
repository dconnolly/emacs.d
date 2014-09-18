;;; js.el --- configs for js-mode/js2-mode/js3-mode

;;; Commentary:

;;; Code:

(message "JAVASCRIPT")

;; Requirements:
;; npm install -g jshint tern
(ensure-module-deps '(js3-mode tern tern-auto-complete flycheck))

'(js3-auto-indent-p t)         ; it's nice for commas to right themselves.
'(js3-enter-indents-newline t) ; don't need to push tab before typing
'(js3-indent-on-enter-key t)   ; fix indenting before moving on

(setq flycheck-jshintrc ".jshintrc")

(tern-mode t)
(setq tern-command (cons (executable-find "tern") '()))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

;; npm install -g jscs

;; (flycheck-def-config-file-var flycheck-jscs javascript-jscs ".jscs.json"
;;   :safe #'stringp)

;; (flycheck-define-checker javascript-jscs
;;   "A JavaScript code style checker.

;; See URL `https://github.com/mdevils/node-jscs'."
;;   :command ("jscs" "--reporter" "checkstyle"
;;             (config-file "--config" flycheck-jscs)
;;             source)
;;   :error-parser flycheck-parse-checkstyle
;;   :modes (js-mode js2-mode js3-mode)
;;   :next-checkers (javascript-jshint))

;; (add-to-list 'flycheck-checkers 'javascript-jscs)

(provide 'javascript)
;;; javascript.el ends here
