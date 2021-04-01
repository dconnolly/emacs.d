;; package: --- init.el
;;; Commentary:

;;; Code:

(setq warning-suppress-log-types '((package reinitialization)))

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Paths
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

;; (add-to-list 'load-path "~/.emacs.d/lib")

;; Add all top-level subdirectories of .emacs.d to the load path
(progn (cd "~/.emacs.d")
       (normal-top-level-add-subdirs-to-load-path))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Generic
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(load-theme 'seti t)

;; Disable auto-save, which produces those #* files.
(setq auto-save-default nil)

;; Make emacs shell stuff slightly nicer.
(setenv "PAGER" "/bin/cat")
(setenv "EDITOR" "/usr/bin/emacsclient")

;; (require 'server)
;; (unless (server-running-p) (server-start))

;; View column and line numbers by default
(setq-default line-number-mode t)
(setq-default column-number-mode t)

(global-linum-mode 1)
(setq linum-format "%d\u2000")

;; No tabs, tab inserts 4 spaces by default
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; M-q paragraph wrap
(setq-default fill-column 80)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EditorConfig
;; https://github.com/editorconfig/editorconfig-emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This requires the editorconfig core to be installed separately.
;; brew install editorconfig || apt-get install editorconfig
(require 'editorconfig)
(editorconfig-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Rainbow Mode
;; https://elpa.gnu.org/packages/rainbow-mode.html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'rainbow-mode)
(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)
    )
  )

(my-global-rainbow-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Whitespace Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'whitespace)
(setq whitespace-line-column 100)
(setq fill-column 100)
(global-whitespace-mode 1)
(setq whitespace-display-mappings
      ;; all numbers are Unicode codepoint in decimal. try
      ;; (insert-char 182 ) to see it
      '(
        (space-mark 32 [183] [46]) ; 32 SPACE, 183 MIDDLE DOT '·', 46 FULL STOP '.'
        (tab-mark 9 [10230 9] [92 9]) ; 9 TAB, 10230 LONG RIGHTWARDS ARROW '⟶ '
        (newline-mark 10 [8629 10]) ; 10 LINE FEED, 8629 DOWNWARDS ARROW WITH CORNER LEFTWARDS '↵''
        ))

(setq whitespace-style (quote
                        (face
                         tabs
                         spaces
                         trailing
                         lines-tail
                         newline
                         ;;indentation::space
                         ;; empty
                         space-mark
                         tab-mark
                         newline-mark)))

(add-hook 'before-save-hook 'whitespace-cleanup)

(defvar background-color "black") ;; Black renders as transparent if
                                  ;; your terminal supports it.
(defvar foreground-color "gray20")
(defvar violation-foreground-color "chartreuse1")

(set-face-attribute 'whitespace-space nil
                    :background background-color
                    :foreground foreground-color)
(set-face-attribute 'whitespace-hspace nil
                    :background background-color
                    :foreground foreground-color)
(set-face-attribute 'whitespace-tab nil
                    :background background-color
                    :foreground foreground-color)
(set-face-attribute 'whitespace-newline nil
                    :background background-color
                    :foreground foreground-color)
(set-face-attribute 'whitespace-trailing nil
                    :background background-color
                    :foreground violation-foreground-color)
(set-face-attribute 'whitespace-line nil
                    :background background-color
                    :foreground violation-foreground-color)
(set-face-attribute 'whitespace-space-before-tab nil
                    :background background-color
                    :foreground violation-foreground-color)
(set-face-attribute 'whitespace-indentation nil
                    :background background-color
                    :foreground violation-foreground-color)
(set-face-attribute 'whitespace-empty nil
                    :background background-color
                    :foreground violation-foreground-color)
(set-face-attribute 'whitespace-space-after-tab nil
                    :background background-color
                    :foreground violation-foreground-color)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flycheck
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'after-init-hook #'global-flycheck-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LSP mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'lsp-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Company mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'after-init-hook 'global-company-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'python-mode-hook (lambda () (require 'py)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; JS/JS2/JS3 Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-hook 'js-mode-hook (lambda () (require 'javascript)))
(add-hook 'js2-mode-hook (lambda () (require 'javascript)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; JSON Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (add-hook 'json-mode-hook (lambda () (require 'json-config)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SASS/SCSS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (autoload 'sass-mode "sass" "" t)
;; (autoload 'scss-mode "sass" "" t)
;;(add-hook 'sass-mode-hook (lambda () (require 'sass)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Java Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'java-mode-hook (lambda () (require 'java)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Web Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'web-mode-hook (lambda () (require 'web-mode)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Go Mode
;; https://github.com/dominikh/go-mode.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'go-mode-hook (lambda () (require 'go)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'c-mode-common-hook (lambda () (require 'c)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Rust Mode
;; https://github.com/rust-lang/rust-mode.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'rust-mode-hook (lambda () (require 'rust)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; OSX plist bullshit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Allow editing of binary .plist files.
(add-to-list 'jka-compr-compression-info-list
             ["\\.plist$"
              "converting text XML to binary plist"
              "plutil"
              ("-convert" "binary1" "-o" "-" "-")
              "converting binary plist to text XML"
              "plutil"
              ("-convert" "xml1" "-o" "-" "-")
              nil nil "bplist"])

;;It is necessary to perform an update!
(jka-compr-update)

(provide 'init)
;;; init.el ends here
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    (quote
;;     (rust-mode yaml-mode flymake-less less-css-mode markdown-mode web-beautify ## c-mode sass-mode zenburn-theme web-mode volatile-highlights undo-tree tern-auto-complete solarized-theme seti-theme rainbow-mode pyvenv jsx-mode js2-mode highlight-indentation helm-projectile guru-mode go-eldoc gitignore-mode gitconfig-mode gitattributes-mode git-commit gist flycheck expand-region exec-path-from-shell elisp-slime-nav editorconfig coffee-mode ag ack-and-a-half ace-jump-mode))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(toml-mode groovy-mode handlebars-mode rjsx-mode yaml-mode c-mode markdown-mode cargo ## cargo-minor-mode flycheck-rust rust-mode zenburn-theme web-mode web-beautify volatile-highlights undo-tree tern-auto-complete solarized-theme seti-theme sass-mode rainbow-mode pyvenv jsx-mode js2-mode highlight-indentation helm-projectile guru-mode go-eldoc gitignore-mode gitconfig-mode gitattributes-mode git-commit gist flymake-less flycheck expand-region exec-path-from-shell elisp-slime-nav editorconfig coffee-mode ag ack-and-a-half ace-jump-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
