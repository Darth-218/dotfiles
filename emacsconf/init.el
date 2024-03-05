;;; init.el -*- lexical-binding: t; -*-

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

; For installing packages
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                        ("org" . "https://orgmode.org/elpa/")
                        ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
;---


; Coding
;; Language server
(use-package lsp-mode
  :ensure t
  :commands lsp
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  ;; enable / disable the hints as you prefer:
  (lsp-inlay-hint-enable t)
  ;; These are optional configurations. See https://emacs-lsp.github.io/lsp-mode/page/lsp-rust-analyzer/#lsp-rust-analyzer-display-chaining-hints for a full list
  (lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
  (lsp-rust-analyzer-display-chaining-hints t)
  (lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
  (lsp-rust-analyzer-display-closure-return-type-hints t)
  (lsp-rust-analyzer-display-parameter-hints nil)
  (lsp-rust-analyzer-display-reborrow-hints nil)
  :config
  (add-hook 'python-mode-hook #'lsp)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))
(require 'lsp-mode)
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil))


;; Code completion
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(use-package company
  :ensure t
  :custom
  (company-idle-delay 0.2) ;; how long to wait until popup
  ;; (company-begin-commands nil) ;; uncomment to disable popup
  :bind
  (:map company-active-map
	      ("C-n". company-select-next)
	      ("C-p". company-select-previous)
	      ("M-<". company-select-first)
	      ("M->". company-select-last)))


;; Live syntax checking
(require 'flycheck)
(global-flycheck-mode)
(use-package flycheck :ensure)


;; Code snippets
(setq yas-snippet-dirs '("~/.emacs.d/mysnippets"))
(unless (file-exists-p (car yas-snippet-dirs))
(make-directory (car yas-snippet-dirs) t))
(use-package yasnippet
  :ensure t
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode))


;; Parser
(use-package tree-sitter-langs
  :ensure t
  :after tree-sitter)


;; Framework for managing projects
(require 'ede)
(global-ede-mode)


;;Rust config
(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  (setq rustic-format-on-save nil)
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))
(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
  ;; save rust buffers that are not file visiting. Once
  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
  ;; no longer be necessary.
  (when buffer-file-name
    (setq-local buffer-save-without-query t))
  (add-hook 'before-save-hook 'lsp-format-buffer nil t))
(setq rustic-format-on-save nil)

;; C/C++ Language server
(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;---

; To view pdfs
(use-package pdf-tools
  :ensure t
  :defer t
  :commands (pdf-loader-install)
  :mode "\\.pdf\\'"
  :bind (:map pdf-view-mode-map
              ("j" . pdf-view-next-line-or-next-page)
              ("k" . pdf-view-previous-line-or-previous-page)
              ("C-=" . pdf-view-enlarge)
              ("C--" . pdf-view-shrink))
  :init (pdf-loader-install)
  :config (add-to-list 'revert-without-query ".pdf"))
;--

; Org things
(use-package org)
(add-to-list 'load-path "~/.emacs.d/packages")
(require 'org-roam)
(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/RoamNotes")
  :bind (("C-c r l" . org-roam-buffer-toggle)
        ("C-c r f" . org-roam-node-find)
        ("C-c r i" . org-roam-node-insert))
  :config
  (org-roam-db-autosync-enable))

(add-hook 'org-mode-hook #'turn-on-org-cdlatex)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
  (C . t)))

;---

; Treemacs
;;(global-set-key (kbd "<SPC> e") 'treemacs)

(setq eshell-prompt-regexp "^[^λ]+ λ ")

; UI

;; Font
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 120 :weight 'bold)

;; Breaking lines
(setq-default truncate-lines nil)

;; Center cursor (vertically)
(require 'centered-cursor-mode)
(global-centered-cursor-mode 0)

;; Show battery
(require 'fancy-battery)
(add-hook 'after-init-hook #'fancy-battery-mode)
(fancy-battery-mode 1)

;; Show time
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-load-average nil)

;; Indentation
;;; Shows where the block belongs
(require 'indent-guide)
(setq indent-guide-char "^")
(indent-guide-global-mode 1)

;;; Shows indentation marks
(require 'highlight-indentation)
(highlight-indentation-mode 1)
;;---

;; Show symbols
(global-prettify-symbols-mode 1)

;---
