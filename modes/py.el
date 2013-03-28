;;; py.el --- configs for python-mode

;;; Commentary:

;;; Code:

(message "PY")
;; TODO: Replace all emacs-for-python shit with installable packages until 

;; (require 'epy-init)
;; (epy-setup-checker "~/.emacs.d/etc/pycheckers.sh %f")

;;; Disable tab characters, set default tab spacing to 4 chars wide.
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(provide 'py)
;;; py.el ends here
