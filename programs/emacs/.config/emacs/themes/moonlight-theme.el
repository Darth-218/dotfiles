(deftheme moonlight
  "A dark theme inspired by VS Code's Moonlight.")

(require 'color)

(let* ((class '((class color) (min-colors 89)))
       (bg         "#212337")
       (bg-alt     "#191a2a")
       (base0      "#161a2a")
       (base1      "#191a2a")
       (base2      "#1e2030")
       (base3      "#222436")
       (base4      "#2f334d")
       (base5      "#444a73")
       (base6      "#828bb8")
       (base7      "#a9b8e8")
       (base8      "#b4c2f0")
       (fg         "#c8d3f5")
       (fg-alt     "#b4c2f0")
       (highlight  "#82aaff")
       (indigo     "#7a88cf")
       (red        "#ff5370")
       (orange     "#ff995e")
       (green      "#c3e88d")
       (teal       "#77e0c6")
       (yellow     "#ffc777")
       (blue       "#82aaff")
       (magenta    "#c099ff")
       (cyan       "#b4f9f8")
       (violet     "#f989d3")
       (dark-cyan  "#86e1fc")
       ;; Emulate doom-lighten and doom-darken
       (bg-dark    (color-darken-name bg 10))
       (bg-darker  (color-darken-name bg 20))
       (base-dark  (color-darken-name base2 10))
       (base-darker (color-darken-name base2 20)))

  (custom-theme-set-faces
   'moonlight

   ;; Basic coloring
   `(default ((,class (:background ,bg :foreground ,fg))))
   `(cursor ((,class (:background ,fg))))
   `(region ((,class (:background ,highlight :foreground ,bg-alt))))
   `(highlight ((,class (:background ,highlight))))
   `(shadow ((,class (:foreground ,base5))))
   `(minibuffer-prompt ((,class (:foreground ,blue))))
   `(tooltip ((,class (:background ,base0 :foreground ,fg))))

   ;; Font lock faces
   `(font-lock-builtin-face ((,class (:foreground ,magenta))))
   `(font-lock-comment-face ((,class (:foreground ,indigo))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,indigo))))
   `(font-lock-doc-face ((,class (:foreground ,(color-lighten-name indigo 25)))))
   `(font-lock-constant-face ((,class (:foreground ,orange))))
   `(font-lock-function-name-face ((,class (:foreground ,blue))))
   `(font-lock-keyword-face ((,class (:foreground ,magenta))))
   `(font-lock-string-face ((,class (:foreground ,green))))
   `(font-lock-variable-name-face ((,class (:foreground ,red))))
   `(font-lock-type-face ((,class (:foreground ,yellow))))
   `(font-lock-warning-face ((,class (:foreground ,yellow :bold t))))

   ;; Line numbers
   `(line-number ((,class (:foreground ,base5 :background ,bg-darker))))
   `(line-number-current-line ((,class (:foreground ,fg :background ,base3))))

   ;; Mode line
   `(mode-line ((,class (:background ,base-dark :foreground ,base8))))
   `(mode-line-inactive ((,class (:background ,bg-dark :foreground ,base5))))

   ;; Additional custom faces
   `(isearch ((,class (:background ,highlight :foreground ,bg-alt))))
   `(lazy-highlight ((,class (:background ,base4 :foreground ,fg))))
   `(match ((,class (:background ,highlight :foreground ,bg-alt))))
   `(show-paren-match ((,class (:background ,blue :foreground ,bg-alt :bold t))))
   `(show-paren-mismatch ((,class (:background ,red :foreground ,bg-alt :bold t))))
   `(trailing-whitespace ((,class (:background ,red))))
   `(whitespace-tab ((,class (:background ,base0))))
   `(whitespace-space ((,class (:background ,base0))))
   `(whitespace-newline ((,class (:background ,base0))))

   ;; Org-mode
   `(org-block ((,class (:background ,base2))))
   `(org-block-begin-line ((,class (:background ,base2 :foreground ,indigo))))
   `(org-block-end-line ((,class (:background ,base2 :foreground ,indigo))))
   `(org-level-1 ((,class (:foreground ,blue :bold t))))
   `(org-level-2 ((,class (:foreground ,dark-cyan :bold t))))
   `(org-level-3 ((,class (:foreground ,red :bold t))))
   `(org-level-4 ((,class (:foreground ,violet :bold t))))
   `(org-level-5 ((,class (:foreground ,magenta :bold t))))
   `(org-level-6 ((,class (:foreground ,orange :bold t))))
   `(org-level-7 ((,class (:foreground ,green :bold t))))
   `(org-level-8 ((,class (:foreground ,yellow :bold t))))

   ;; Other UI elements
   `(fringe ((,class (:background ,bg))))
   `(vertical-border ((,class (:foreground ,base1))))
   `(success ((,class (:foreground ,green :bold t))))
   `(warning ((,class (:foreground ,yellow :bold t))))
   `(error ((,class (:foreground ,red :bold t))))
   `(link ((,class (:foreground ,blue :underline t))))
   `(link-visited ((,class (:foreground ,magenta :underline t))))
   `(header-line ((,class (:background ,bg-alt :foreground ,fg))))

   ;; Custom faces for specific plugins
   ;; (Add more as needed)
   ))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'moonlight)
