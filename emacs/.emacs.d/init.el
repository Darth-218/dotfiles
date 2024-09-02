(setq custom-file "~/.emacs.d/custom.el")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load custom-file)

;; (use-package ef-themes		  
;;   :ensure t					  
;;   :init						  
;;   (load-theme 'ef-winter 't)
;;   )

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-message t)

(global-display-line-numbers-mode 1)
(setq display-line-numbers 'relative)
(setq tab-width 4)
(set-face-attribute 'default nil :font "JetBrainsMono NF SemiBold" :height 110)

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

(use-package evil
  :ensure t
  :init
  (evil-mode))

(use-package breadcrumb
  :ensure t
  :init
  (breadcrumb-mode))

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package marginalia
  :after vertico
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

(use-package eglot
  :ensure t
  :hook ((python-mode-hook . eglot-enusre)
	 (go-mode-hook . eglot-enusre)))

(add-hook 'before-save-hook 'gofmt-before-save)

(use-package company
  :ensure t
  :after eglot
  :hook (eglot . company-mode)
  :custom
  (company-idle-delay 0.0))
