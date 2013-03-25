(ensure-module-deps '(coffee-mode flymake-coffee))

(require 'coffee-mode)
(require 'flymake-coffee)

(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(add-hook 'coffee-mode-hook 'flymake-coffee-load)

(provide 'coffee)
