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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Malabar Mode
;; https://github.com/espenhw/malabar-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                      global-semanticdb-minor-mode
                                      global-semantic-idle-summary-mode
                                      global-semantic-mru-bookmark-mode))
(semantic-mode 1)
(require 'malabar-mode)
(setq malabar-groovy-lib-dir "~/.emacs.d/malabar-mode/target/malabar-1.4.0/lib")
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

;; (add-hook 'malabar-mode-hook
;;      (lambda () 
;;        (add-hook 'after-save-hook 'malabar-compile-file-silently
;;                   nil t)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Coffee Mode
;; https://github.com/defunkt/coffee-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Sass Mode
;; https://github.com/nex3/sass-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'sass-mode)