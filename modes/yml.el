;;; yml.el --- configs for yaml-mode

;;; Commentary:

;;; Code:

(message "YAML")

(require 'yaml-mode)
   (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(provide 'yaml-mode)
;;; yml.el ends here
