;; rust.el --- configs for rust-mode

;;; Commentary:

;;; Code:
(message "RUST")

(with-eval-after-load 'rust-mode

  (setq rust-format-on-save t)

  (setq lsp-rust-server 'rust-analyzer)
  ;;(setq lsp-rust-all-targets t)
  (setq lsp-rust-analyzer-cargo-watch-command "clippy")
  (setq lsp-rust-analyzer-cargo-watch-args ["-all-features", " --all-targets", " --", "-D", "warnings"])
  (lsp)

  ;; (add-hook 'rust-mode-hook #'flycheck-mode)
  ;; (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
  ;; (add-hook 'flycheck-mode-hook #'flycheck-inline-mode)

  ;; (add-hook 'rust-mode-hook #'company-mode)
  ;; (setq company-tooltip-align-annotations t)
  ;; (setq company-minimum-prefix-length 1)
  ;; (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)

  )

(provide 'rust)
;;; rust.el ends here
