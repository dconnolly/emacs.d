;;; packages.el --- default package selection and config.

;;; Commentary:

;;; Code:

(require 'cl-lib)
(require 'package)

(package-initialize)

(defvar packages
  '(ace-jump-mode
     ack-and-a-half
     ag
     auto-complete
     dash
     editorconfig
     elisp-slime-nav
     exec-path-from-shell
     expand-region
     flycheck
     git-commit-mode
     gist
     guru-mode
     helm
     helm-projectile
     magit
     rainbow-mode
     solarized-theme
     undo-tree
     web-mode
     volatile-highlights
     yasnippet
     zenburn-theme)
  "A list of packages to ensure are installed at launch.")

(setq package-archives '(
                          ("gnu" . "https://elpa.gnu.org/packages/")
                          ("marmalade" . "https://marmalade-repo.org/packages/")
                          ;; ("melpa" . "http://melpa.org/packages/") ;; Not HTTPS, not signed (yet).
                          ))

(defun packages-installed-p ()
  "Get all those in 'packages' that have already been installed."
  (cl-every #'package-installed-p packages))

(defun install-packages ()
  "Install all packages listed in `packages'."
  (unless (packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (mapc #'package-install
     (cl-remove-if #'package-installed-p packages))))

(install-packages)

(defmacro auto-install (extension package mode)
  "When opening a file with EXTENSION, auto-install PACKAGE and trigger MODE."
  `(add-to-list 'auto-mode-alist
		`(,extension . (lambda ()
				 (unless (package-installed-p ',package)
				   (package-install ',package))
				 (,mode)))))

(defvar auto-install-alist
  '(("\\.clj\\'" clojure-mode clojure-mode)
    ("\\.coffee\\'" coffee-mode coffee-mode)
    ("\\.css\\'" css-mode css-mode)
    ("\\.ejs\\'" web-mode web-mode)
    ("\\.erl\\'" erlang erlang-mode)
    ("\\.feature\\'" feature-mode feature-mode)
    ("\\.groovy\\'" groovy-mode groovy-mode)
    ("\\.haml\\'" haml-mode haml-mode)
    ("\\.hs\\'" haskell-mode haskell-mode)
    ("\\.html?\\'" web-mode web-mode)
    ("\\.js\\'" js3-mode js3-mode)
    ("\\.json\\'" json-mode json-mode)
    ("\\.jsp\\'" web-mode web-mode)
    ("\\.latex\\'" auctex LaTeX-mode)
    ("\\.less\\'" less-css-mode less-css-mode)
    ("\\.lua\\'" lua-mode lua-mode)
    ("\\.markdown\\'" markdown-mode markdown-mode)
    ("\\.md\\'" markdown-mode markdown-mode)
    ("\\.php\\'" web-mode web-mode)
    ("\\.py\\'" python python-mode)
    ("\\.sass\\'" sass-mode sass-mode)
    ("\\.scala\\'" scala-mode2 scala-mode)
    ("\\.scss\\'" sass-mode sass-mode)
    ("\\.slim\\'" slim-mode slim-mode)
    ;; ("\\.ssh/config\\'" ssh-config-mode ssh-config-mode)
    ;; ("\\sshd?_config\\'" ssh-config-mode ssh-config-mode)
    ("\\.yml\\'" yaml-mode yaml-mode)))

;; markdown-mode doesn't have autoloads for the auto-mode-alist
;; so we add them manually if it's already installed
(when (package-installed-p 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode)))

;; web-mode doesn't have autoloads for the auto-mode-alist
;; so we add them manually if it's already installed
(when (package-installed-p 'web-mode)
  (add-to-list 'auto-mode-alist '("\\..*html\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode)))

;; build auto-install mappings
(mapc
 (lambda (entry)
   (let ((extension (car entry))
	 (package (cadr entry))
	 (mode (cadr (cdr entry))))
     (unless (package-installed-p package)
       (auto-install extension package mode))))
 auto-install-alist)

(defun require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package packages)
    (add-to-list 'packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun require-packages (packages)
    "Ensure PACKAGES are installed.  Missing packages are installed automatically."
    (mapc #'require-package packages))

(defun ensure-module-deps (packages)
  "Ensure PACKAGES are installed.  Missing packages are installed automatically."
  (mapc #'package-install (cl-remove-if #'package-installed-p packages)))

(define-obsolete-function-alias 'ensure-module-deps 'require-packages)

(provide 'packages)
;;; packages.el ends here
