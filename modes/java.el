;;; java.el --- java-mode configs

;;; Commentary:

;;; Code:

(setq indent-tabs-mode t)

(require 'java-mode)

(add-to-list 'ac-modes 'java-mode) ;; Java-mode is not one of the default auto-complete modes.

(provide 'java)
;;; java.el ends here
