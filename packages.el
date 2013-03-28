;;; packages.el --- default package selection and config.

;;; Code:
(require 'package)
(require 'dash)

(defvar packages
  '(ace-jump-mode 
    ack-and-a-half ag
    auto-complete
    elisp-slime-nav exec-path-from-shell expand-region 
    flycheck
    gist guru-mode helm helm-projectile
    magit magithub melpa
    rainbow-mode solarized-theme undo-tree
    volatile-highlights yasnippet zenburn-theme)
  "A list of packages to ensure are installed at launch.")

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))

;; set package-user-dir to be relative to Prelude install path
(package-initialize)

(defun packages-installed-p ()
  (-all? #'package-installed-p packages))

(defun install-packages ()
  (unless (packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs Prelude is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (-each
     (-reject #'package-installed-p packages)
     #'package-install)))

(install-packages)

(defmacro auto-install (extension package mode)
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
    ("\\.html\\'" web-mode web-mode)
    ("\\.js\\'" js2-mode js2-mode)
    ("\\.latex\\'" auctex LaTeX-mode)
    ("\\.less\\'" less-css-mode less-css-mode)
    ("\\.lua\\'" lua-mode lua-mode)
    ("\\.markdown\\'" markdown-mode markdown-mode)
    ("\\.md\\'" markdown-mode markdown-mode)
    ("\\.php\\'" php-mode php-mode)
    ("\\.py\\'" python python-mode)
    ("\\.sass\\'" sass-mode sass-mode)
    ("\\.scala\\'" scala-mode2 scala-mode)
    ("\\.scss\\'" scss-mode scss-mode)
    ("\\.slim\\'" slim-mode slim-mode)
    ("\\.ssh/config\\'" ssh-config ssh-config-mode)
    ("\\sshd?_config\\'" ssh-config ssh-config-mode)
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


(-each auto-install-alist
  (lambda (entry)
    (let ((extension (car entry))
          (package (cadr entry))
          (mode (cadr (cdr entry))))
      (unless (package-installed-p package)
        (auto-install extension package mode)))))

(defun ensure-module-deps (packages)
  (-each (-remove #'package-installed-p packages) #'package-install))

(provide 'packages)
;;; packages.el ends here
