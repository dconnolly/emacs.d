;;(autoload 'js2-mode "js-module" "" t)
;; (add-hook 'js-mode-hook 'flymake-jslint-load)

;; Also requires gjshint which is installed via pip.
(ensure-module-deps '(js2-mode flymake-gjshint))

(require 'flymake-gjshint)
(add-hook 'js-mode-hook 'flymake-gjshint:load)
