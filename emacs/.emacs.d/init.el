(setq custom-file "~/.emacs.d/custom.el")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load custom-file)
(load-theme 'moonlight t)


(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-message t)

(global-display-line-numbers-mode 1)
(setq display-line-numbers 'relative)
(set-face-attribute 'default nil :font "JetBrainsMono NF SemiBold" :height 110)

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

(use-package evil)
(evil-mode)

(use-package which-key)
(which-key-mode)

(add-hook 'python-mode-hook 'eglot-ensure)
(add-hook 'go-mode-hook 'eglot-ensure)

(use-package markdown-ts-mode
   :mode ("\\.md\\'" . markdown-ts-mode)
   :defer 't
   :config
   (add-to-list 'treesit-language-source-alist '(markdown "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown/src"))
   (add-to-list 'treesit-language-source-alist '(markdown-inline "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown-inline/src")))
