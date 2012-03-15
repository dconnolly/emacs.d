;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; DC Emacs Config 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Make emacs shell stuff slightly nicer.
(setenv "PAGER" "/bin/cat")
(setenv "EDITOR" "/usr/bin/emacsclient")
(server-start)

;; View column and line numbers by default
(setq line-number-mode t)
(setq column-number-mode t)

;;; Disable tab characters, set default tab spacing to 4 chars wide.
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Library Paths 
;; I like to keep every emacs library underneath ~/.emacs.d. 
;; This makes it easier to use this config on multiple systems.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d")

;; Add all top-level subdirectories of .emacs.d to the load path
(progn (cd "~/.emacs.d")
  (normal-top-level-add-subdirs-to-load-path))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs for Python, with customizations
;; https://github.com/gabrielelanaro/emacs-for-python
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'epy-setup)
(require 'epy-python)
(require 'epy-completion)
(require 'epy-editing)
;(require 'epy-bindings)
(epy-setup-checker "pyflakes %f")
(setq skeleton-pair nil)

;; Disable line numbering
(global-linum-mode 0)