;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'eldritch)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(set-frame-parameter nil 'alpha-background 70)
(add-to-list 'default-frame-alist '(alpha-background . 70))

(defun df-force()
  (interactive)
  (delete-frame 'nil 't))
(map! :g "C-x C-c" #'df-force)
(map! :i "C-n" #'evil-next-line)
(map! :i "C-p" #'evil-previous-line)
(map! :i "C-d" #'evil-delete-char)
(map! :nvi "C-z" #'suspend-emacs)
(map! :i "C-c" #'evil-normal-state)
(defun down-center()
  "Run C-d zz"
  (interactive)
  (evil-scroll-down 0)
  (evil-scroll-line-to-center (line-number-at-pos)))
(map! :n "C-d" #'down-center)

(defun up-center()
  "Run C-u zz"
  (interactive)
  (evil-scroll-up 0)
  (evil-scroll-line-to-center (line-number-at-pos)))
(map! :n "C-u" #'up-center)
;; Mapping to keep search terms in the middle (:n n/N nzzzv)
(defun center-search-next()
  (interactive)
  (evil-ex-search-next)
  (evil-scroll-line-to-center (line-number-at-pos)))
(map! :n "n" #'center-search-next)

(defun center-search-prev()
  (interactive)
  (evil-ex-search-previous)
  (evil-scroll-line-to-center (line-number-at-pos)))
(map! :n "N" #'center-search-prev)

;; Mapping to paste over highligt but keep original copy (:x <leader>p "\"_dP)
(defun keep-paste()
  (interactive)
  (delete-region evil-visual-beginning evil-visual-end)
  (yank))
(map! :leader :desc "Keep paste buffer" :nv "P" #'keep-paste)

(setq scroll-margin 15)

(setq confirm-kill-emacs 'nil)
(setq global-auto-revert-mode 1)

(setq indent-tabs-mode 't)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;;******************************************************************************
;; VERILOG
;;******************************************************************************
(setq verilog-ext-feature-list
      '(xref
        capf
        hierarchy
        lsp
        flycheck
        beautify
        navigation
        template
        imenu
        which-func
        hideshow
        typedefs
        time-stamp
        block-end-comments
        ports))
(require 'verilog-ext)
(verilog-ext-mode-setup)
(setq verilog-ext-tags-backend 'tree-sitter)
(setq verilog-ext-flycheck-linter 'verilog-verible)
(verilog-ext-lsp-set-server 've-verible-ls)
(add-hook 'verilog-mode-hook #'verilog-ext-mode)
(add-hook 'verilog-mode-hook #'lsp-mode)

(setq load-path (cons (expand-file-name "~/.config/vhdl-mode339") load-path))
(add-to-list 'auto-mode-alist '("\\.vhdl?\\'" . vhdl-ts-mode))
(setq vhdl-modify-date-on-saving nil)
(setq vhdl-ext-feature-list
      '(font-lock
        xref
        capf
        hierarchy
        lsp
        flycheck
        beautify
        navigation
        template
        compilation
        imenu
        which-func
        hideshow
        time-stamp
        ports))
(require 'vhdl-ext)
(vhdl-ext-mode-setup)
(vhdl-ext-lsp-set-server 've-rust-hdl)
(add-hook 'vhdl-mode-hook #'vhdl-ext-mode)
(add-hook 'vhdl-mode-hook #'lsp-mode)
(setq vhdl-file-header
      "-------------------------------------------------------------------------------
      -- Title      : <title string>
      -- Project    : <project>
      -------------------------------------------------------------------------------
      -- File       : <filename>
      -- Author     : Steve Robichaud
      -- Company    : Self
      -- Created    : <date>
      -- Last update: <date>
      -- Platform   : <platform>
      -- Standard   : <standard>
      <projectdesc>-------------------------------------------------------------------------------
      -- Description: <cursor>
      <copyright>-------------------------------------------------------------------------------
      -- Revisions  :
      -- Date        Version  Author  Description
      -- <date>  1.0      <login>	Created
      -------------------------------------------------------------------------------

      ")
(setq vhdl-standard '(19 nil))
(setq vhdl-stutter-mode t)
